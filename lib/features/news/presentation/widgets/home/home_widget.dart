import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/widgets/widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            SizedBox(height: 40),
            HomeTitle(),
            SizedBox(height: 40),
            HomeImage(),
            Spacer(flex: 2),
            Text(
              "Stay informed with the latest updates on markets, "
              "finance, and global business trends. "
              "\nYour trusted source for business insights.",
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            Spacer(flex: 2,), // pushes button to bottom
            HomeButton(),
            SizedBox(height: 20), // little spacing from bottom
          ],
        ),
      ),
    );
  }
}
