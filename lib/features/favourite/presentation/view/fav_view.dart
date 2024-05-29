import 'package:book_store/core/cache/cache_helper.dart';
import 'package:book_store/features/auth/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await CacheHelper.clearData(); // Clear cached data
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (Route<dynamic> route) => false, // Remove all routes
                  );
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
