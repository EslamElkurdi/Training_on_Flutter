import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginscreen/models/shop_app/login_model.dart';

import 'package:loginscreen/modules/shop_app/register/register_cubit/states.dart';
import 'package:loginscreen/shared/network/remote/dio_helper.dart';
import 'package:loginscreen/shared/network/remote/end_point.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

   late ShopLoginModel loginModel;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
})
  {
    emit(ShopRegisterLoadingState());

    print('arrived here');

    DioHelper.postData(

        url: REGISTER,
        data:
        {
          'name' : name,
          'email' : email,
          'password' : password,
          'phone' : phone
        }
    ).then((value)
    {
      //print(value.data);
      loginModel = ShopLoginModel.fromJson(value?.data);
      // print(loginModel.message);
      // print(loginModel.data.id);

      emit(ShopRegisterSuccessState(loginModel));

    }).catchError((error)
    {
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {

    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(ShopRegisterChangePasswordVisibility());
  }
}