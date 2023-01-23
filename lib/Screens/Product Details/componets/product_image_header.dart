import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskappfigma/AppData/app_images.dart';

class ProductImageHeader extends StatelessWidget {
  const ProductImageHeader({Key? key,required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top -MediaQuery.of(context).viewPadding.bottom ;
    return SafeArea(
      child: SizedBox(
        height: deviceHeight * 0.4386,
        child: LayoutBuilder(
          builder: (context,constraints){
            return  Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: constraints.maxWidth * 0.05,left: constraints.maxWidth * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: SvgPicture.asset(AppCustomIcons.back)),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset(AppCustomIcons.favorite,color: Colors.black,)),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    height: constraints.maxHeight * 0.6725,
                    margin: EdgeInsets.only(left: constraints.maxWidth * 0.2341,right : constraints.maxWidth * 0.2341,bottom: constraints.maxHeight * 0.0934),
                    child: FittedBox(child: Image.network(url,fit: BoxFit.cover,)),
                  ),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}
