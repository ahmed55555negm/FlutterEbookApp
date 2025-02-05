import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/util/dialogs.dart';
import 'package:flutter_ebook_app/views/explore/explore.dart';
import 'package:flutter_ebook_app/views/home/home.dart';
import 'package:flutter_ebook_app/views/settings/settings.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController
      _pageController; //TODO:WHAT THE DIFFERNT BETWEEN THIS _PAGE CONTROLLER AND PageController _pageController=PageController();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //isnt it better if he take object from Dialogs Or because we are use it only one time he did this
      onWillPop: () => Dialogs().showExitDialog(context),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged:
              onPageChanged, //TODO:this function take int how he use it without passing page?
          children: <Widget>[
            Home(),
            Explore(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.grey[500],
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.compass,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.settings,
              ),
              label: 'Settings',
            ),
          ],
          onTap:
              navigationTapped, //TODO:this function take int how he use it without passing page?
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    //are this  process are best practice this process meaning intialise pageController here
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page; //TODO:why use (this) here
    });
  }
}
