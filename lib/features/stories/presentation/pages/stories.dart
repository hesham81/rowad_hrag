import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final List<Map<String, dynamic>> sampleUsers = [
    {
      'userName': 'Alex Morgan',
      'imageUrl': 'https://i.pravatar.cc/150?img=1',
      'stories': [
        {'imageUrl': 'https://picsum.photos/1080/1920?image=10'},
        {'imageUrl': 'https://picsum.photos/1080/1920?image=11'},
      ],
    },
    {
      'userName': 'Taylor Swift',
      'imageUrl': 'https://i.pravatar.cc/150?img=2',
      'stories': [
        {'imageUrl': 'https://picsum.photos/1080/1920?image=20'},
        {'imageUrl': 'https://picsum.photos/1080/1920?image=21'},
        {'imageUrl': 'https://picsum.photos/1080/1920?image=22'},
      ],
    },
    {
      'userName': 'Chris Evans',
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
          final story = user['stories'][storyIndex]; // ✅ Fixed: access 'stories', not 'imageUrl'

          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  story['imageUrl'] as String, // ✅ Now correctly accessing story image
                  fit: BoxFit.cover,
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
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex]['stories'].length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}