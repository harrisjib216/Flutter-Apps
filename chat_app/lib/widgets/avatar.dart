import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.imageURL = "",
    required this.radius,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    this.imageURL = "",
  })  : radius = 17,
        super(key: key);

  const Avatar.medium({
    Key? key,
    this.imageURL = "",
  })  : radius = 24,
        super(key: key);

  const Avatar.large({
    Key? key,
    this.imageURL = "",
  })  : radius = 34,
        super(key: key);

  final String imageURL;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).cardColor,
      backgroundImage:
          imageURL.isNotEmpty ? CachedNetworkImageProvider(imageURL) : null,
      child: imageURL.isEmpty ? const Icon(Icons.person) : null,
    );
  }
}
