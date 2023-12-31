import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginscreen/modules/counter_app/counter/counter_cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {


  CounterCubit() : super(CounterInitialState());



  int counter = 1;

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }
  void plus(){
    counter++;
    emit(CounterPlusState());
  }

}