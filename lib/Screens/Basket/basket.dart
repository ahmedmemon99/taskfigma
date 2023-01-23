import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskappfigma/AppData/app_colors.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_bloc.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_state.dart';
import 'package:taskappfigma/Repository/cart_repository.dart';
import 'package:taskappfigma/Screens/Checkout%20Screen/checkout_screen.dart';
import 'package:taskappfigma/common%20widget/custom_button.dart';
import '../../AppData/app_fonts.dart';
import '../../Bloc/bottom navigation/navigation_bloc.dart';
import 'componets/basket_header.dart';
import 'componets/basket_info_notification.dart';
import 'componets/basket_listview.dart';


class  Basket extends StatelessWidget {
  const Basket ({Key? key}) : super(key: key);

  static const String routeName ='/basket';


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: ()async{
        Navigator.of(context).pop();
        context.read<NavigationBloc>().navigateScreen(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.homeScreenBgColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 BasketHeader(deviceHeight: deviceHeight, deviceWidth: deviceWidth),
                 BasketInfoNotification(deviceWidth: deviceWidth, deviceHeight: deviceHeight),
                 BasketListView(deviceHeight: deviceHeight),
                 const Spacer(),
                 Padding(
                    padding:EdgeInsets.only(bottom: deviceHeight * 0.0569,left: deviceWidth * 0.1232,right: deviceWidth * 0.1232),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Total',style:TextStyle(fontFamily: AppFonts.raleWayRegular,fontSize: deviceHeight * 0.0190),),
                        BlocBuilder<CartBloc,CartState>(
                          builder: (context,state) {

                            if(state is CartLoadingState){
                              return Text('\$00.00',style:TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: deviceHeight * 0.0246),);
                            }

                            if(state is CartLoadedState){
                              return Text('\$${context.watch<CartBloc>().total}',style:TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: deviceHeight * 0.0246),);
                            }

                            return Text('\$00.00',style:TextStyle(color: AppColors.scaffoldBackgroundColor,fontFamily: AppFonts.raleWayBold,fontSize: deviceHeight * 0.0246),);
                          }
                        ),
                      ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: deviceWidth * 0.085,right: deviceWidth * 0.085,bottom: deviceHeight * 0.0502),
                child: CustomButton(onPressed: (){

                  Navigator.of(context).pushNamed(CheckOutScreen.routName);
                }, text: 'Checkout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


