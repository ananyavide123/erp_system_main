// import 'package:flutter/material.dart';

// class ProfileWidget extends StatelessWidget {
//   final String imagePath;
//   final VoidCallback onClicked;
//   const ProfileWidget({
//     Key? key,
//     required this.imagePath,
//     required this.onClicked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         children: [
//           buildImage(),
//           buildEditIcon(),
//         ],
//       ),
//     );
//   }

//   Widget buildImage() {
//     final image = NetworkImage(imagePath);
//     return ClipOval(
//       child: Material(
//         color: Colors.transparent,
//         child: Ink.image(
//           image: image,
//           fit: BoxFit.cover,
//           width: 128,
//           height: 128,
//           child: InkWell(
//             onTap: onClicked,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildEditIcon() => Positioned(
//         bottom: 0,
//         right: 0,
//         child: IconButton(
//           icon: const Icon(Icons.edit),
//           iconSize: 20,
//           onPressed: onClicked,
//           color: Colors.blue, // Set your desired color here
//         ),
//       );
// }
