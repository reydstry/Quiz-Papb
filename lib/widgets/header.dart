import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ini buat teks judul aplikasi di atas pojok kiri bang
            Text(
              'Reys Clothes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 4),

            //ini buat yang lokasi ala ala itu bang
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: Color.fromARGB(255, 219, 219, 219),
                ),

                Text(
                  'Kepo lu pak, mana tau',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),

                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Color.fromARGB(255, 219, 219, 219),
                ),
              ]
            )
          ]
        ),

        //ini buat icon notif di pojok kanan atas bang
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 8,
                right: 4
                ),
              child: Icon(
                Icons.notifications_none,
                size: 34,
                color: Colors.white,
              ),
            ),

            // buat yang lingkaran merah kecil di pojok kanan atas icon notif bang, jadi ala ala ada notip gitu bang
            Positioned(
              top: 6,
              right: 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
                ),
              )
            )
          ]
        )
      ]
    );
  }
}