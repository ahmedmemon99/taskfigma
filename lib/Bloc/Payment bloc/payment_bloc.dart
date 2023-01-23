import 'package:flutter_bloc/flutter_bloc.dart';


enum PaymentMethodEnum {

 visa,masterCard,rupPay

}



class PaymentCubit extends Cubit<PaymentMethodEnum>{

  PaymentCubit(): super(PaymentMethodEnum.visa);

  void selectPaymentMethod(val){
   emit(val);
  }

}


