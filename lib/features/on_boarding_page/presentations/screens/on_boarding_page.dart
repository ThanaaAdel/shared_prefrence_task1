import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/styles.dart';
import '../../data/onboarding_model.dart';
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentPage  = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  _storeOnBoardingInfo()async{
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainWhite,
      appBar: AppBar(
        backgroundColor: ColorsManager.mainWhite,
        elevation: 0,
        actions: [
          TextButton(onPressed: ()async{
           await  _storeOnBoardingInfo();
            context.pushReplacementNamed(Routes.loginPage);
          }, child: const Text("Skip",))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int index){
            setState(() {
              currentPage = index;
            });
          },
          itemCount: screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
            Image.asset(screens[index].img),
            Container(
              height: 10.0,
              child: ListView.builder(


                itemCount: screens.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
                  ],
                );
              },),
            ),
            Text(screens[index].text,style: TextStyles.font20BoldBlack),
            Text(screens[index].desc,style: TextStyles.font16SemiBoldBlack,),
            InkWell(
              onTap: ()async{
                await _storeOnBoardingInfo();
                if(index == screens.length -1){
                  context.pushReplacementNamed(Routes.loginPage);
                }
                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceIn);
              },
              child: Container(padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.0),
              ),
                child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  Text("Next",style: TextStyles.font18SemiBoldWhite,),
                      Icon(Icons.arrow_forward,color: ColorsManager.mainWhite,),
                ]),
              ),
            )
          ],);
        },),
      ),
    );
  }
}
