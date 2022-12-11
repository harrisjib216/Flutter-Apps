import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';

class TabNavigationItem extends StatelessWidget {
  const TabNavigationItem({
    Key? key,
    required this.label,
    required this.iconData,
    required this.navigate,
    this.isSelected = false,
  }) : super(key: key);

  final String label;
  final IconData iconData;
  final bool isSelected;
  final VoidCallback navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        navigate();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 28,
            color: isSelected ? AppColors.secondary : null,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: isSelected
                ? TextStyle(
                    fontSize: 12.0,
                    color: isSelected ? AppColors.secondary : null,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  )
                : const TextStyle(
                    fontSize: 12.0,
                  ),
          ),
        ],
      ),
    );
  }
}
