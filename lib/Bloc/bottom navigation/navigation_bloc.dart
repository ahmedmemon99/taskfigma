import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/Bloc/bottom%20navigation/navigation_states.dart';

enum NavigationItem {
  home,
  favorite,
  profile,
  cart,
}
class NavigationBloc extends Cubit<NavigationStates>{

  NavigationBloc() : super(NavigationStates(currentIndex: 0,navigationItem: NavigationItem.home));

  void navigateScreen(int index){
    if(index ==0){
      emit(NavigationStates(currentIndex: index, navigationItem: NavigationItem.home));
    }else if(index ==1){
      emit(NavigationStates(currentIndex: index, navigationItem: NavigationItem.favorite));
    }else if(index ==2){
      emit(NavigationStates(currentIndex: index, navigationItem: NavigationItem.profile));
    }else if(index ==3){
      emit(NavigationStates(currentIndex: index, navigationItem: NavigationItem.cart));
    }

  }



}