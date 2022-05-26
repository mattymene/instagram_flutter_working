import 'package:flutter/material.dart';
import 'package:instagram_flutter_working/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// checks if the width of the device is > of a constant, and builds 2 different build functions
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreenLayout; // web screen
        }
        return mobileScreenLayout; // mobile screen
      },
    );
  }
}
