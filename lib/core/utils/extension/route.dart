import 'package:outtappxperience/core/utils/enums/routes.dart';

extension Route on MusicRoutes{
  String toRoute(){
    return '/$name';
  }
}