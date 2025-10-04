import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:story/story_page_view.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final List<Map<String, dynamic>> sampleUsers = [
    {
      'userName': 'Hisham Aymen',
      'imageUrl':
          'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/522598565_2125203187989840_3408856964049920562_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Pyfh_RCfjPUQ7kNvwGi0ydG&_nc_oc=AdnX1xMQBhUtDEDDu0RYlv3WuN8N97c0jdKeW43V-bc9_AZ6SoujW5jDGtuVg9YcJuU&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=j3cFNLHGa7lnB--6XEAc-g&oh=00_Afc41smrJp18P5bY1jLNAeTFIlhvXu4SI1o0MOR7jHhkSw&oe=68E615D1',
      'stories': [
        {
          'imageUrl':
              'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/522598565_2125203187989840_3408856964049920562_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Pyfh_RCfjPUQ7kNvwGi0ydG&_nc_oc=AdnX1xMQBhUtDEDDu0RYlv3WuN8N97c0jdKeW43V-bc9_AZ6SoujW5jDGtuVg9YcJuU&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=j3cFNLHGa7lnB--6XEAc-g&oh=00_Afc41smrJp18P5bY1jLNAeTFIlhvXu4SI1o0MOR7jHhkSw&oe=68E615D1'
        },
        {
          'imageUrl':
              'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/510388215_2100046103838882_8632535229427349386_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_ohc=xY1mKiRxKNYQ7kNvwFUZVIJ&_nc_oc=AdkUEOckktUSxyNDJ06Pq9Yfdqax3YdsjKTXYH0Qs4Jk55NhtXcP4oakb6BckiB9zvA&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=YVvJR3OaxPyHNFJcZq6EYw&oh=00_AffhcTfW2DLt0mOsugAfZO4AkjjlTgKPTZBrZUXfWKGNdg&oe=68E6288C'
        },
      ],
    },
    {
      'userName': 'Etsh Aymen',
      'imageUrl':
          'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/510802745_2100046183838874_6080604176241435470_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=PTaAseMWxgAQ7kNvwG3vaO_&_nc_oc=Adka9G_CqOix7BNYJKbxjNGI3IkrksRbeLWxbt5Cxn1Yx_lDJwp1xKTg3sLfJALIHBg&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=aD6efCJMzYnOqIb4ttTuvA&oh=00_Affw25V2hSuUcYn97klgZHq55YxQMEHpvzzJEkxXruYk3w&oe=68E60878',
      'stories': [
        {
          'imageUrl':
              'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/510014109_2100046147172211_1985836094877017719_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_ohc=EY9aE6J6eY8Q7kNvwEMKDlG&_nc_oc=Adk4Yk5XxZ-esFitFg_-LzzVxFUQFdpAnkp_vzbsjdDawz_pA5268nMeXRQk8ze4DU8&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=YXSrCDpCtNByH967Miz-Dg&oh=00_AfeVk3euD2ASYVrQ_CQI9O6iClTxWT6pZs7lln8pJ6M2hA&oe=68E6026A'
        },
        {
          'imageUrl':
              'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/510327662_2100046467172179_6995335266952488580_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_ohc=vH12s51mu3kQ7kNvwE5NvzB&_nc_oc=Adl0l6OX-EHuDK5s0zXbO6EKu3vZvlxSml8ECCMs6BW9cpUIm2EBkt55YUbDkFPv5Bs&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=f8MN2c3DbBbyt1sxZqOS9w&oh=00_AfctXfpYNtFJ65qDPaM-fqiZdqFjsKI5q3i4Zf_lhym4fg&oe=68E633F8'
        },
        {
          'imageUrl':
              'https://scontent-hbe1-2.xx.fbcdn.net/v/t39.30808-6/509815362_2100046733838819_4844070285046835763_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_ohc=uth1IZxYofUQ7kNvwHFI-I3&_nc_oc=AdlYv2kexvuktHHQpwLejAZggoljEDIae2WqGLHsjkqekHp1c1-H5CFpvNByXbzSY8s&_nc_zt=23&_nc_ht=scontent-hbe1-2.xx&_nc_gid=gHQNRwZAb-YNwXJkBnbVUA&oh=00_AffcqU9nfbZfthGzyvWvTV173Hggcd2WE34rO-YgV1n96w&oe=68E61BF6'
        },
      ],
    },
    {
      'userName': 'Etshawy Aymen',
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'stories': [
        {'imageUrl': 'https://picsum.photos/1080/1920?image=30'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user['stories']
              [storyIndex]; // ✅ Fixed: access 'stories', not 'imageUrl'

          return Stack(
            children: [
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: 0.2.height,
              //     decoration: BoxDecoration(
              //       color: Colors.green.withAlpha(80),
              //     ),
              //     child: Text(
              //       "Welcome",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  story['imageUrl'] as String,
                  // ✅ Now correctly accessing story image
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user['imageUrl'] as String),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      user['userName'] as String,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        pageLength: sampleUsers.length,
        indicatorDuration: Duration(milliseconds: 10000),
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex]['stories'].length;
        },
        indicatorHeight: 0.004.height,
        indicatorVisitedColor: AppColors.greenColor,
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
