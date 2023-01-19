import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskappfigma/Bloc/Authentication/auth_bloc.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_bloc.dart';
import 'package:taskappfigma/Bloc/Cart%20Bloc/cart_event.dart';
import 'package:taskappfigma/Screens/Basket/basket.dart';
import '../../../AppData/app_colors.dart';
import '../../../AppData/app_images.dart';
import '../../../Bloc/bottom navigation/navigation_bloc.dart';
import '../../../Bloc/bottom navigation/navigation_states.dart';


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          unselectedItemColor: Colors.red,
          onTap:(index) {
            context.read<NavigationBloc>().navigateScreen(index);
            if(index == 3){
              context.read<CartBloc>().add(CartLoadedEvent(userid: context.read<AuthBloc>().userid!));
              Navigator.of(context).pushNamed(Basket.routeName);
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.homeScreenBgColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: state.currentIndex,
          enableFeedback: false,
          elevation: 0,
          items: [
            _buildBottomNavigationItem(AppCustomIcons.home, AppCustomIcons.selectedHome),
            _buildBottomNavigationItem(AppCustomIcons.favorite, AppCustomIcons.selectedFavorite),
            _buildBottomNavigationItem(AppCustomIcons.profile, AppCustomIcons.selectedProfile),
            _buildBottomNavigationItem(AppCustomIcons.cart, AppCustomIcons.selectedCart,),
          ],
        );
      },
    );
  }
}

BottomNavigationBarItem _buildBottomNavigationItem(String icon,String selectedIcon,[VoidCallback? onTap]) {
  return BottomNavigationBarItem(
      icon:SvgPicture.asset(icon,color: AppColors.unSelectedBottomNavigationIconColor),
      activeIcon: InkWell(
        onTap: onTap,
        child: Container(
            decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.selectedBottomNavigationIconColor.withOpacity(0.5),
                      blurRadius: 22,
                      offset: const Offset(0, 4)
                  )
                ]
            ),
            child: SvgPicture.asset(selectedIcon,color: AppColors.selectedBottomNavigationIconColor)),
      ),label: "null");
}