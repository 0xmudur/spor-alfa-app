import 'package:flutter/material.dart';
import 'package:spor_alfa_app/common/spor_alfa_theme.dart';
import 'package:spor_alfa_app/view/fixture_view/fixture_view.dart';
import 'package:spor_alfa_app/view/home_view/home_view.dart';
import 'package:provider/provider.dart';

import 'common/spor_alfa_app_bar.dart';
import 'main_view_model.dart';
import 'service_locator.dart';
import 'view/catogory_view/category_view.dart';

class MainView extends StatelessWidget {
  MainViewModel mainViewModel = serviceLocator<MainViewModel>();
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CategoryView(),
    FixtureView()
  ];

  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (context) => mainViewModel,
      child: Consumer<MainViewModel>(
        builder: (context, model, child) => Scaffold(
            // extendBodyBehindAppBar: true,
          appBar: const SporAlfaAppBar(),
          body: _widgetOptions.elementAt(model.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: SporAlfaTheme.primaryColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph),
                label: 'Fixture',
              ),
            ],
            currentIndex: model.selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: model.onTabChanged,
          )

        ),
      ),
    );
  }
}