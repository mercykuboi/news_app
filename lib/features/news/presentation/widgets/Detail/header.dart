import 'package:flutter/material.dart';
import 'package:news_app/core/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class NewsDetailHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String headerTitle;
  final VoidCallback? onBackPressed;
  final VoidCallback? onThemePressed;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const NewsDetailHeader({
    super.key,
    required this.title,
    required this.headerTitle,
    this.onBackPressed,
    this.onThemePressed,
    this.scaffoldKey,
  });

  @override
  Size get preferredSize {
    // header takes 18% of screen height
    return Size.fromHeight(
      WidgetsBinding
              .instance
              .platformDispatcher
              .views
              .first
              .physicalSize
              .height *
          0.18 /
          WidgetsBinding
              .instance
              .platformDispatcher
              .views
              .first
              .devicePixelRatio,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.18, // dynamic 18% height
      child: Column(
        children: [
          // Top AppBar with back arrow
          AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
            elevation: 0,
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),

          // Blue Header Row (Menu + Title + Theme + Search)
          Expanded(
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  // Hamburger (Drawer)
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      if (scaffoldKey != null) {
                        scaffoldKey!.currentState?.openDrawer();
                      } else {
                        Scaffold.of(context).openDrawer();
                      }
                    },
                  ),

                  // Centered Title
                  Expanded(
                    child: Center(
                      child: Text(
                        headerTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  // Theme Icon
                  IconButton(
                    icon: const Icon(Icons.dark_mode, color: Colors.white),
                    onPressed: () {
                      context.read<ThemeNotifier>().toggleTheme();
                    },
                  ),

                  // Search Icon
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      // do nothing for now
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
