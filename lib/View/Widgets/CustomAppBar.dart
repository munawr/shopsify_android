import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      gradient: const LinearGradient(
        colors: [Color(0xFF0298b1), Color(0xFF7CD857)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      title: Row(
        children: [
          Container(
            height: 50,
            width: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              color: Colors.black,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(90.0); // Increased preferred size
}

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Gradient gradient;
  final Widget title;
  final List<Widget> actions;

  GradientAppBar(
      {super.key,
      required this.gradient,
      required this.title,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradient),
        ),
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
