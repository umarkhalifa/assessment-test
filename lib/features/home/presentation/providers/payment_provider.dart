import 'package:flutter/cupertino.dart';
import 'package:outtappxperience/config/locator/locator.dart';
import 'package:outtappxperience/config/services/flushbarService.dart';
import 'package:outtappxperience/features/home/data/model/account.dart';
import 'package:outtappxperience/features/home/data/model/bank.dart';
import 'package:outtappxperience/features/home/domain/usecases/get_bank_use_case.dart';
import 'package:outtappxperience/features/home/domain/usecases/verify_account_use_case.dart';

class PaymentProvider extends ChangeNotifier {
  final PageController controller = PageController();
  final GetBankUseCase _bankUseCase = locator<GetBankUseCase>();
  final VerifyAccountUseCase _verifyAccountUseCase =
      locator<VerifyAccountUseCase>();
  AppState _appState = AppState.idle;
  Bank? _selectedBank;
  List<Bank> _banks = [];
  Account? _account;


  List<Bank> get banks => _banks;

  Bank? get selectedBank => _selectedBank;
  Account?get account=> _account;

  AppState get appState => _appState;

  Future<void> getBanks() async {
    /// Reset selected account number
    _account = null;
    if (banks.isEmpty) {
      try {
        _appState = AppState.loading;
        notifyListeners();
        await Future.delayed(const Duration(seconds: 5));
        final data = await _bankUseCase(null);
        data.fold((l) {
          FlushBarService().showFlushError(title: l.message);

        }, (r) {
          _banks = r;
        });
      } finally {
        _appState = AppState.idle;
      }
    }
    notifyListeners();
  }

  Future<void> verifyAccount({required String number}) async {
    if(controller.page == 1.0 && account != null){
      updateStage();
      return;
    }

    if (_selectedBank != null) {
      try {
        _appState = AppState.inAppLoading;
        notifyListeners();
        final data = await _verifyAccountUseCase(
            {'number': number, 'code': selectedBank?.code});
        data.fold((l) {
          FlushBarService().showFlushError(title: l.message);
        }, (r) {
          _account = r;
        });
      }
      catch(error){
        FlushBarService().showFlushError(title: "Something went wrong");
        appState == AppState.idle;

      }
      finally {
        _appState = AppState.idle;
      }
    }
    notifyListeners();
  }

  void changeBank(Bank bank) {
    _selectedBank = bank;
    notifyListeners();
  }

  void updateStage(){
    controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
    notifyListeners();
  }
}

enum AppState { idle, loading, inAppLoading }
