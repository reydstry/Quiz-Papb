import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({super.key});

  @override
  State<InfoCard> createState() => InfoCardState();
}

class InfoCardState extends State<InfoCard> {
  int halamanAktif = 0;

  final PageController controller = PageController(viewportFraction: 0.9);

  final List<String> promo = [
    'Promo Koleksi Film Semi:\nDiskon hingga 0.50%',
    'Koleksi Terbaru Branded:\nSaatnya menjadi kalcer',
    'Penalaran Khodam:\n Temukan khodammu',
  ];

  //buat warna kartunya bang
  final List<Color> warna = [
    const Color(0xFFC02B30),
    const Color.fromARGB(255, 41, 62, 168),
    const Color.fromARGB(255, 57, 145, 82),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: controller,
            padEnds: false,
            itemCount: promo.length,
            onPageChanged: (index) {
              setState(() {
                halamanAktif = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: warna[index],
                    child: Stack(
                      children: [
                        Positioned(
                          right: -35,
                          top: -40,
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.10),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        Positioned(
                          right: 20,
                          bottom: -50,
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.08),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        Positioned(
                          right: 65,
                          top: 15,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        // Isi infonya bang
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Pill buat promo bang
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE6E6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Promo',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: warna[index],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Teks promosi bang
                              Text(
                                promo[index],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // Indikator carousel bang
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(promo.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: halamanAktif == index ? 20 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: halamanAktif == index ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}
