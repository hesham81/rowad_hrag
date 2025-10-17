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
          'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/522598565_2125203187989840_3408856964049920562_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Ly6Lftnf6JcQ7kNvwGFDiXt&_nc_oc=AdmK6cC-Tf7Okr3EjN541Am8WlDg7lgwzI3o53soUy-xTzSyo4e9UvwsUlM4hXYHxu0&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=58q98s7-_6DOUoEVFZcuNA&oh=00_Afe5wiHkTiNwD55e52OoEKgGw-ZRnqEN8mxMA2lQ1p5CDw&oe=68F6C8D1',
      'stories': [
        {
          'imageUrl':
              'https://marketplace.canva.com/EAGFdr5xrIY/1/0/1600w/canva-beige-and-brown-elegant-coming-soon-instagram-post-rCVKQbzDkrc.jpg'
        },
        {
          'imageUrl':
              'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/510388215_2100046103838882_8632535229427349386_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_ohc=xY1mKiRxKNYQ7kNvwFUZVIJ&_nc_oc=AdkUEOckktUSxyNDJ06Pq9Yfdqax3YdsjKTXYH0Qs4Jk55NhtXcP4oakb6BckiB9zvA&_nc_zt=23&_nc_ht=scontent-hbe1-1.xx&_nc_gid=YVvJR3OaxPyHNFJcZq6EYw&oh=00_AffhcTfW2DLt0mOsugAfZO4AkjjlTgKPTZBrZUXfWKGNdg&oe=68E6288C'
        },
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
