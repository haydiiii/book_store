import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/books/presentation/view/book_view.dart';
import 'package:book_store/features/cart/presentation/views/cart_view.dart';
import 'package:book_store/features/favourite/presentation/view/fav_view.dart';
import 'package:book_store/features/home/presentation/view/home_view.dart';
import 'package:book_store/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;
  List<Widget> views = [
    const HomeView(),
     BooksView(
      
     ),
    const FavView(),
    const CartView(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home,
              color: AppColors.greyColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            activeIcon: Icon(
              Icons.book,
              color: AppColors.greyColor,
            ),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            activeIcon: Icon(
              Icons.favorite_border_rounded,
              color: AppColors.greyColor,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.greyColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(
              Icons.person,
              color: AppColors.greyColor,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor:
            AppColors.greyColor, // Set selected item color if needed
        unselectedItemColor:
            Colors.blueAccent, // Set unselected item color if needed
      ),
    );
  }
}

// void main() => runApp(MaterialApp(
//   home: NavBarWidget(),
// ));
