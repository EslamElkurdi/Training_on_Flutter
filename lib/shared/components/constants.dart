

import 'package:loginscreen/modules/shop_app/login/shop_login_screen.dart';
import 'package:loginscreen/shared/network/remote/cach_helper.dart';

import 'components.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value){
    if(value == true){
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=> print(match.group(0)));
}

String token = '';

String uId = '';


