import 'package:flutter/material.dart';


class ProfileFollowContainer extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isFollowing;

  const ProfileFollowContainer({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    bool _isFollowing=isFollowing;
    return Directionality(
      textDirection: TextDirection.ltr, 
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Follow button
            ElevatedButton(
              onPressed: ()=>_isFollowing==true?false:true,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFollowing
                    ? Colors.grey[300]
                    : const Color(0xFF00897B), // teal color when not following
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              
              child: Text(
                _isFollowing ? "متابع" : "متابعة",
                style: TextStyle(
                  color: _isFollowing ? Colors.black87 : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
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

                // Profile image
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
