import 'package:flutter/material.dart';

class LayoutPages extends StatelessWidget {
  const LayoutPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 115,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo Azwar!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Mau Masak Apa Hari ini?',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuItem('assets/icons/bakso.png', 'Bakso'),
                  menuItem('assets/icons/pizza.png', 'Pizza'),
                  menuItem('assets/icons/ramen.png', 'Ramen'),
                  menuItem('assets/icons/taco.png', 'Taco'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recomended',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: SizedBox(
                        width: 220,
                        child: Card(
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: 20,
                                left: 80,
                                child: Image.asset(
                                  'assets/images/nasi-goreng.png',
                                  height: 160,
                                ),
                              ),
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nasi Goreng Spesial Khas Malang',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) {
                                          return Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer_outlined,
                                          color: Colors.grey[400],
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          '5 Min',
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                        const SizedBox(width: 16),
                                        Icon(
                                          Icons.home,
                                          color: Colors.grey[400],
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          '5 Min',
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                        )
                                      ],
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String path, String name) {
    return Column(
      children: [
        Image.asset(
          path,
          width: 60,
        ),
        Text(name),
      ],
    );
  }
}
