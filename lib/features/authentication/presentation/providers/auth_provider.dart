import 'package:flutter/cupertino.dart';
import 'package:outtappxperience/app/app.dart';
import 'package:outtappxperience/core/utils/enums/routes.dart';
import 'package:outtappxperience/core/utils/extension/route.dart';

class AuthenticationProvider extends ChangeNotifier {
  final PageController controller = PageController();
  int _authStage = 0;

  int get authStage => _authStage;

  /// This moves the bottoms sheet page view to the next, when it reaches the end
  /// it navigates to the home page
  void updateAuthStage() {
    if (_authStage == 2) {
      navigatorKey.currentState!
          .pushReplacementNamed(MusicRoutes.home.toRoute());
      return;
    }
    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    _authStage = controller.page?.round() ?? 0;
    notifyListeners();
  }

  void reset() {
    _authStage = 0;
    notifyListeners();
  }
}
