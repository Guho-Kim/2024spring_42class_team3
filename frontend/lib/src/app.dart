import 'package:flutter/material.dart';
import 'package:frontend/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'pages/mypage/my_page.dart';
import 'pages/qna/qna_page.dart';
import 'pages/sharing/sharing_page.dart';
import 'pages/recruiting/recruiting_page.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Obx(
        () => Scaffold(
          // backgroundColor: Colors.red,
          // appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            // children: [Home(), Recruiting(), QnA(), Sharing()],
            children: [
              // const LoginPage(),
              const MyPage(),
              const RecruitingPage(),
              const QnAPage(),
              const SharingPage(),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            onTap: controller.changeBottomNav,
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: 'Recruiting',
              ),
              // BottomNavigationBarItem(
              //   icon: ImageData(IconsPath.uploadIcon),
              //   label: 'upload',
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.question_answer,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.question_answer,
                  color: Colors.black,
                ),
                label: 'Q&A',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.library_books,
                  color: Colors.black,
                ),
                label: 'Sharing',
              ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle, color: Colors.grey),
              //       width: 30,
              //       height: 30),
              //   label: 'Chatting',
              // ),
            ],
          ),
        ),
      ),
      canPop: false,
      onPopInvoked: (bool didPop) async {
        await controller.onBackPressed();
      },
    );
  }
}
