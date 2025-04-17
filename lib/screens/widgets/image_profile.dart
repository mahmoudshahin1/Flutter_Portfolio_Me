import 'package:flutter/material.dart';
import 'package:portfolio/data/data.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            kGradient1,
            kGradient2,
          ],
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            profileimagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
