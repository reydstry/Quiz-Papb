import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  const TabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,

      // Styling tab bar bang
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,

      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      indicatorColor: Colors.white,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.label,

      dividerColor: Colors.transparent,

      labelPadding: EdgeInsets.symmetric(horizontal: 20),

      // Isi Tab bang
      tabs: [
        Tab(text: 'Semuanya'),
        Tab(text: 'Pakaian Doang'),
        Tab(text: 'Kendaraan Doang'),
        Tab(text: 'Aksesoris Doang'),
      ],
    );
  }
}
