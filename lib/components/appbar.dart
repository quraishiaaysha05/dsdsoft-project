import 'package:flutter/material.dart';

import '../theme/constants.dart';

AppBar screensAppBar({
  required BuildContext context,
  required String title,
  bool showAction = false,
  Widget? destination, // optional navigation destination
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: white,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: mainTitleText,
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 20,
          child: Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 20,
          ),
        ),
      ),
    ),
    actions: showAction && destination != null
        ? [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => destination,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            ),
          ]
        : null,
  );
}
