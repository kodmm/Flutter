import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/providers/user_provider.dart';
import 'package:tutorial/utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  initState() {
    super.initState();
    addData();
  }
  addData() async {
    // UserProvider _userProvider = context.read<UserProvider>();
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();

  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webScreenSize) {
          return widget.webScreenLayout;
        }
        return widget.mobileScreenLayout;
      }
    );
  }
}