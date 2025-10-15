import 'package:flutter/material.dart';

class FollowPerson extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int followers;

  const FollowPerson({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.followers,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // for Arabic layout
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Followers count
            Text.rich(
              TextSpan(
                text: 'متابعين ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '$followers',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),

            // Divider
            Container(
              width: 1,
              height: 30,
              color: Colors.grey.withOpacity(0.4),
            ),

            // Profile info
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF00897B),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 10),

                // Profile photo
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: imageUrl.startsWith('http')
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageUrl) as ImageProvider,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
