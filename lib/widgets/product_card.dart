import 'package:flutter/material.dart';

import '../models/product.dart';

class ProdukCard extends StatelessWidget {
  final Produk produk;

  const ProdukCard({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,

            //buat foto bang
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                produk.foto,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: Color(0xFFE6E6E6),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        // Teks nama produk bang
        Text(
          produk.nama,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 1),
        // Harga produk bang
        Text(
          produk.harga,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
