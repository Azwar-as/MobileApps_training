import 'package:flutter/material.dart';

class Notifpage extends StatefulWidget {
  const Notifpage({super.key});

  @override
  State<Notifpage> createState() => _NotifpageState();
}

class _NotifpageState extends State<Notifpage> {
  List notifications = [
    {
      'title':
          "Exciting news! There's a fresh freelance opportunity waiting for you. Don't miss ou...",
      'time': '1h ago',
    },
    {
      'title':
          "Hey there! You've got a new message waiting for you. Open it now to stay...",
      'time': '2h ago',
    },
    {
      'title':
          "Great news! We've just added new freelance opportunities that match your...",
      'time': '3h ago',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Notification',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Today',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ListView.builder(
                  itemCount: notifications.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFE4E4E4),
                                  ),
                                  child: Icon(Icons.message_rounded),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Text(
                                    notifications[index]["title"],
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  notifications[index]['time'],
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFA0A0A0),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          height: 32,
                        )
                      ],
                    );
                  })
            ],
          ),
        ));
  }
}
