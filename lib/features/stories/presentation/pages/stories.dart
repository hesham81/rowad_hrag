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
          'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/481198415_2008116629698497_3187727101447524743_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=0yCGK_Q-XDcQ7kNvwGsjEfB&_nc_oc=AdlXUC4JFjQmtXXyAoKr6SsgjBAOu0imgqLpn6TRN_Mv4OwKod8kFdcXCCuV46dXeaI&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=4VpsaL_zMajxR1vYThrCQQ&oh=00_AfcTB1mtlBuOHg_RtKKgndxU62y6CsUfDHr-6LjS0z_-PA&oe=68F1A42C',
      'stories': [
        {
          'imageUrl':
              'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/489928976_2045949285915231_1389553330135841803_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=RHUOwAb3rYAQ7kNvwFIvf0i&_nc_oc=AdmfL-GxKuebc-P1WYCa3l9t05c8Yhy9xXTos76OFmMi4m0OBtb07-qNdOZVvEDXuwg&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=JihOVGb4QbG--FzYWrXm6A&oh=00_AfcdEza4iVi7bAnYZv6oDRvpSZTmcU2IEElvtyekX5YqQw&oe=68F1B114'
        },
        {
          'imageUrl':
              'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/459731975_1882440005599494_4981009547302570452_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=6goJm30_qvwQ7kNvwGc8ytd&_nc_oc=AdkxI58oLXW8PTBm0cVc6xli4jBP5Ul2J0WKn-Pun6tXvNmvbEK7Z3RZri-3S06N-2A&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=m3Fb3GXsw0mmw6XGR6DZUg&oh=00_AffPanaG8popS95D6gpcj5JrKPe-UNXvxauqVsDtq18Qfw&oe=68F1BB9C'
        },
      ],
    },
    {
      'userName': 'Etsh Aymen',
      'imageUrl':
          'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/483103367_2018925161950977_3530181175992229483_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=u03X-0Zge2YQ7kNvwFSrgkj&_nc_oc=AdmUaK1uuKrnYvfuhGtLhWFoZswJRpXid0JWH2ZLSqaRs9aYj5lkqJJ_-W6PvGHTQSo&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=7HHdDwE-RrO4WS2ejN9-dA&oh=00_AfeWEdCqRLl52CPHd_706xC6Sn-9p4HjJzuoHKhXrMv0oQ&oe=68F1AAF1',
      'stories': [
        {
          'imageUrl':
              'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/484902048_2017564598753700_1489532305759034881_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=EyBsLHeolKkQ7kNvwEHz1W9&_nc_oc=AdmhNioQH4Uovwjd2uOktnBdn_WrVA-3bW3W8yAyim4V4QbcOvXpkYkLRgSnXAsol4M&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=suE3c_3uD3orMYFigWIa4g&oh=00_Afd46lNE2WGQCeBgyDOTSsHnT7sjZ-XZUL5ugd0IZvoNww&oe=68F1BEA4'
        },
        {
          'imageUrl':
              'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/484536729_2016774942165999_2341388830333562627_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=83vQ60jEGeQQ7kNvwEs9uXi&_nc_oc=AdkErI3Q8UDF8kFLMN-XHEMGqO60OmNkfVhQ7M9U1VSILP2GjvOpaE6PbRbVUCX1xGM&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=C7WmXQ59KCtyMqQbIlTkNw&oh=00_AffIjal5GsIV6YPLrEHZq6sSHAuvAP80aoqYud3dw8Ktfw&oe=68F1C3E0'
        },
        {
          'imageUrl':
              'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/473618596_1973510229825804_3352329176313836362_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=s43uDKyJf3wQ7kNvwEIZI_9&_nc_oc=AdkSloqXstnF-y-YT1rUntFYrHkypnpYSr1gc4W46D2xNr16xCgrEbuBu1u4Z1kZJ0c&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=GiPETFTg3b6CSVd-MhN99g&oh=00_Afe0LYw3nY6cUhkg9W1c_gFWqqEXG4HI1AzL-27dkgkzVg&oe=68F1B07E',
        },
      ],
    },
    {
      'userName': 'Etshawy Aymen',
      'imageUrl':
          'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/483601244_2014988165678010_3165195477285177409_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=986cXwwpHMcQ7kNvwGTab9R&_nc_oc=AdnUCuC9jbsS-U7nOkda5NzAOql1x_6qZTUgWiIaMWc8LGVnM3QfFpnSAw8PyHiydRI&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=lbus7VQEDztrcf1Naakn4g&oh=00_AfcjT7vKOBVzD4bjJuegY3Uo_wXnI3Q-uF_INBFH7kKfVg&oe=68F1C05D',
      'stories': [
        {
          'imageUrl':
              'https://scontent.fcai30-1.fna.fbcdn.net/v/t39.30808-6/481198415_2008116629698497_3187727101447524743_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=0yCGK_Q-XDcQ7kNvwGsjEfB&_nc_oc=AdlXUC4JFjQmtXXyAoKr6SsgjBAOu0imgqLpn6TRN_Mv4OwKod8kFdcXCCuV46dXeaI&_nc_zt=23&_nc_ht=scontent.fcai30-1.fna&_nc_gid=4VpsaL_zMajxR1vYThrCQQ&oh=00_AfcTB1mtlBuOHg_RtKKgndxU62y6CsUfDHr-6LjS0z_-PA&oe=68F1A42C',
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
