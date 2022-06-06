import 'package:fit_kal/utils/app_colors.dart';
import 'package:fit_kal/views/favorites_page.dart';
import 'package:fit_kal/views/home_page.dart';
import 'package:fit_kal/views/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   
  int _selectedItem = 0;
  List<Widget> listOfItems = [
    const FavoritesPage(),
     const SearchPage(),
    const HomePage()
  ];

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened =MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      backgroundColor: AppColors.kBackGround,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:keyboardIsOpened ? 
          null : SizedBox(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: AppColors.kOrange,
            splashColor: AppColors.kYellow,
            onPressed: () {
              setState(() {
                _selectedItem = 2;
              });
            },
            child: const Icon(Icons.home),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/app_bar.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _selectedWidget(_selectedItem),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedItem = value;
          });
        },
        selectedItemColor: AppColors.kBackGround,
        unselectedItemColor: AppColors.kBackGround,
        backgroundColor: AppColors.kTransparentOrange,
        items: const [
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 32,
                child: Icon(
                  Icons.favorite,
                  color: AppColors.kBackGround,
                ),
              ),
              label: " Favorites",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 32,
              child: Icon(
                Icons.search,
                color: AppColors.kBackGround,
              ),
            ),
            label: " Search",
          )
        ],
      ),
    );
  }

  Widget _selectedWidget(int index) {
    return listOfItems[index];
  }
}
