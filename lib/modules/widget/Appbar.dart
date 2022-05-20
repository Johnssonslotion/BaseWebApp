




import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function pushed;
  const CustomAppBar({ 
    required Function this.pushed,
    
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(25.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: pushed(),)
      ),
    );
  }
}