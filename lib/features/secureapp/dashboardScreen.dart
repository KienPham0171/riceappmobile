import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kienapp/features/member/memberScreen.dart';
import 'package:kienapp/features/secureapp/dashboardController.dart';

import '../chat/chatScreen.dart';
import '../meal/mealScreen.dart';
import '../money/moneyScreen.dart';
import '../overview/overviewScreen.dart';

class DashBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller){
        return Scaffold(
            body: SafeArea(
                child: IndexedStack(
                    index:controller.tabIndex,
                    children:[
                      OverviewScreen(),
                      MealScreen(),
                      ChatScreen(),
                      MemberScreen(),
                      MoneyScreen()
                    ]
                )
            ),
            bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.red,
                currentIndex: controller.tabIndex,
                onTap: controller.changeTabIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: [
                  _bottomNavigationBarItem(icon: Icons.api,label: "overview"),
                  _bottomNavigationBarItem(icon: Icons.fastfood,label:"meal"),
                  _bottomNavigationBarItem(icon: Icons.mark_unread_chat_alt,label: "chat"),
                  _bottomNavigationBarItem(icon: Icons.person_pin,label: "member"),
                  _bottomNavigationBarItem(icon: Icons.money,label: "money"),
                ]
            )
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon,required String label}){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

}