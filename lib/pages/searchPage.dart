import 'package:flutter/material.dart';
import 'package:example_stack/pages/menu.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 13,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${Menu.dummy.length} Product Found',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Menu.dummy.length,
                  itemBuilder: (context, index) {
                    Menu menu = Menu.dummy[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SizedBox(
                        height: 180,
                        child: Card(
                          color: menu.color,
                          child: Row(
                            children: [
                              Image.asset(
                                menu.imagePath,
                                height: 128,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    menu.nameVar,
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (_) => const Icon(Icons.star,
                                          color: Colors.amberAccent),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        color: Colors.grey[300],
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        '5 Min',
                                        style:
                                            TextStyle(color: Colors.grey[300]),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(
                                        Icons.home,
                                        color: Colors.grey[300],
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        '5 Min',
                                        style:
                                            TextStyle(color: Colors.grey[300]),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
