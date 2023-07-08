import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginscreen/layout/news_app/cubit/cubit.dart';
import 'package:loginscreen/layout/news_app/cubit/states.dart';
import 'package:loginscreen/shared/components/components.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var article = AppNewsCubit.get(context).sports;
          return builder(article: article);
        }
    );
  }
}
