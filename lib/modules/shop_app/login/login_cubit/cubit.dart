import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginscreen/models/shop_app/login_model.dart';
import 'package:loginscreen/modules/shop_app/login/login_cubit/states.dart';
import 'package:loginscreen/shared/network/remote/dio_helper.dart';
import 'package:loginscreen/shared/network/remote/end_point.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

   late ShopLoginModel loginModel;

  void userLogin({
    required String email,
    required String password
})
  {
    emit(ShopLoginLoadingState());

    print('arrived here');

    DioHelper.postData(

        url: LOGIN,
        data:
        {
          'email' : email,
          'password' : password
        }
    ).then((value)
    {
      //print(value.data);
      loginModel = ShopLoginModel.fromJson(value?.data);
      // print(loginModel.message);
      // print(loginModel.data.id);

      emit(ShopLoginSuccessState(loginModel));

    }).catchError((error)
    {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {

    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(ShopChangePasswordVisibility());
  }
}