import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/pages/home_page.dart';
import 'package:food_dictionary/pages/search_ingredient_page.dart';
import 'package:food_dictionary/pages/search_recipe_page.dart';
import 'package:food_dictionary/pages/cook_now_page.dart';
import 'package:food_dictionary/pages/person_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ControlPage extends StatefulWidget {
  int lastPage = 0;

  ControlPage({@required this.lastPage});

  @override
  _PageState createState() => _PageState(lastPage: lastPage);
}

class _PageState extends State<ControlPage> {
  final int lastPage;
  final PageStorageBucket bucket = PageStorageBucket();
  final user = FirebaseAuth.instance.currentUser;
  Widget currentScreen;
  int index=0;

  _PageState({@required this.lastPage});



  @override
  void initState() {
    super.initState();
    getPage(lastPage);
  }

  @override
  Widget build(BuildContext context) {
    print(lastPage);
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   index: lastPage,
      //   height: 48,
      //   color: AppColors.cor2,
      //   backgroundColor: Colors.white.withOpacity(0),
      //   buttonBackgroundColor: AppColors.cor2,
      //   // animationDuration: Duration(
      //   //   microseconds: 500,
      //   // ),
      //   // animationCurve: Curves.bounceInOut,
      //   items: [
      //     Icon(Icons.visibility_outlined, size: 28, color: Colors.white),
      //     Icon(Icons.set_meal, size: 28, color: Colors.white),
      //     FaIcon(FontAwesomeIcons.book, size: 25, color: Colors.white),
      //     Icon(Icons.restaurant_menu, size: 28, color: Colors.white),
      //     Icon(Icons.person, size: 28, color: Colors.white),
      //   ],
      //   onTap: (index) {
      //     index == 0
      //         ? setState(() {
      //             currentScreen = HomePage();
      //       lastPage == 0;
      //           })
      //         : index == 1
      //             ? setState(() {
      //                 currentScreen = Search01();
      //                 lastPage == 1;
      //               })
      //             : index == 2
      //                 ? setState(() {
      //                     currentScreen = Search02();
      //                     lastPage == 2;
      //                   })
      //                 : index == 3
      //                     ? setState(() {
      //                         currentScreen = Create();
      //                         lastPage == 3;
      //                       })
      //                     : index == 4
      //                         ? setState(() {
      //                             currentScreen = Person();
      //                             lastPage == 4;
      //                           })
      //                         : setState(() {
      //                             currentScreen = HomePage();
      //                             lastPage == 0;
      //                           });
      //     //Handle button tap
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:
                Icon(Icons.visibility_outlined),
            label: 'Explore',
            backgroundColor: AppColors.cor2,
          ),
          BottomNavigationBarItem(
            icon:
            Icon(Icons.set_meal, size: 24),
            label: 'Ingredient',
            backgroundColor: AppColors.cor2,
          ),
          BottomNavigationBarItem(
            icon:
            FaIcon(FontAwesomeIcons.book, size: 22),
            label: 'Recipe',
            backgroundColor: AppColors.cor2,
          ),
          BottomNavigationBarItem(
            icon:
            Icon(Icons.restaurant_menu, size: 24),
            label: 'Cook Now',
            backgroundColor: AppColors.cor2,
          ),
          BottomNavigationBarItem(
            icon:
            Icon(Icons.person, size: 24),
            label: 'Me',
            backgroundColor: AppColors.cor2,
          )
        ],
        currentIndex: index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.cor2,
        selectedItemColor: Colors.black45,
          unselectedItemColor: Colors.white,
          onTap: (currentIndex) {
            currentIndex == 0
                ? setState(() {
                    currentScreen = HomePage();
                    index =0;
                  })
                : currentIndex == 1
                    ? setState(() {
                        currentScreen = Search01();
                        index = 1;
                      })
                    : currentIndex == 2
                        ? setState(() {
                            currentScreen = Search02();
                            index = 2;
                          })
                        : currentIndex == 3
                            ? setState(() {
                                currentScreen = Create();
                                index = 3;
                              })
                            : currentIndex == 4
                                ? setState(() {
                                    currentScreen = Person();
                                    index = 4;
                                  })
                                : setState(() {
                                    currentScreen = HomePage();
                                    index = 5;
                                  });
            //Handle button tap
          },
        // selectedItemColor: AppColors.cor1,
        // onTap: _onItemTapped,
      ),
    );
  }

  void getPage(int lastPage) {
    lastPage == 0
        ? setState(() {
            currentScreen = HomePage();
          })
        : lastPage == 1
            ? setState(() {
                currentScreen = Search01();
              })
            : lastPage == 2
                ? setState(() {
                    currentScreen = Search02();
                  })
                : lastPage == 3
                    ? setState(() {
                        currentScreen = Create();
                      })
                    : lastPage == 4
                        ? setState(() {
                            currentScreen = Person();
                          })
                        : setState(() {
                            currentScreen = HomePage();
                          });
    //Handle button tap
  }
}
