import 'package:flutter/material.dart';
import 'package:qr_code_app/constants.dart';

class GridIconItem extends StatelessWidget {
  const GridIconItem({
    super.key,
    required this.iconName,
    this.icon,
  });
  final String iconName;
  final dynamic icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kPrimaryColor,
              width: 2.5,
            ),
          ),
          child: icon is IconData
              ? Center(
                  child: Icon(
                    icon,
                    color: kPrimaryColor,
                    size: 35,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.asset(
                    '$icon',
                  ),
                ),
        ),
        Positioned(
          top: -12,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kPrimaryColor,
            ),
            child: Text(
              iconName,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
