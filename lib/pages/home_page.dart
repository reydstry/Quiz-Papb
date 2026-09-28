import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/tab_content.dart';
import '../widgets/product_card.dart';
import '../widgets/info_card.dart';
import '../widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  int _selectedNavigation = 0;

  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // buat filter bang
    final visibleProducts = listProduk.where((product) {
      return product.nama.toLowerCase().contains(_query.toLowerCase());
    }).toList();

    //ini dibungkus ama tab bang biar menyesuaikan tapi tidak di sesuaikan karna ini cuma frontend bang
    return DefaultTabController(
      //sesuaiin ama jumlah tab bang
      length: 4,

      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header bang.
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 9, 16, 0),
                child: Header(),
              ),

              const SizedBox(height: 13),

              // Search Bar bang.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 38,
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    onChanged: (text) {
                      setState(() {
                        _query = text;
                      });
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Search for clothes...',
                      hintStyle: const TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 19,
                        color: Color(0xFF909090),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 39,
                        minHeight: 38,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF303030),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF8F8F8F)),
                      ),
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 14),

              // Kartu info info an.
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: InfoCard(),
              ),

              const SizedBox(height: 12),

              // Tab bar bang.
              // ini diambil dari widget tab_content.dart bang
              const TabContent(),

              const SizedBox(height: 12),

              // Grid buat produknya bang 2 kolom sesuai pesanan abang.
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    //lebar kartu produknya bang, jadi padding kanan ama kiri 16 bang ditambah jadi 32, trus jaraknya 10 bang, trus dibagi 2 karna 2 kolom
                    final cardWidth = (constraints.maxWidth - 32 - 10) / 2;

                    //buat kalo ga ada produk yang dicari bang
                    if (visibleProducts.isEmpty) {
                      return const Center(
                        child: Text(
                          'Produk tidak ditemukan',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    //buat gridview bang, ini diambil dari widget product_card.dart bang, topnya dikasi o padding nya bang
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      itemCount: visibleProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 13,
                        mainAxisExtent: cardWidth + 40,
                      ),
                      itemBuilder: (context, index) {
                        return ProdukCard(produk: visibleProducts[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Navbar bagian bawah bang.
        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1C),
              border: Border(
                top: BorderSide(color: Color(0xFF414141), width: 0.7),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navIcon(Icons.home_outlined, 0, 'Beranda'),
                _navIcon(Icons.search, 1, 'Pencarian'),
                _navIcon(Icons.shopping_bag_outlined, 2, 'Keranjang'),
                _navIcon(Icons.person_outline, 3, 'Profil'),
              ],
            ),
          ),
        ),
      )
    );
  }

  // buat icon navbar bawah bang
  Widget _navIcon(IconData icon, int index, String tooltip) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () {
        setState(() {
          _selectedNavigation = index;
        });

        if (index == 1) {
          _searchFocus.requestFocus();
        } else {
          _searchFocus.unfocus();
        }
      },
      icon: Icon(
        icon,
        size: 23,
        color: _selectedNavigation == index
            ? Colors.white
            : const Color(0xFF8C8C8C),
      ),
    );
  }
}
