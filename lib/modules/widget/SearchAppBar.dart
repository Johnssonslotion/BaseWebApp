import 'package:flutter/material.dart';


class SearchAppbar extends StatefulWidget {
  const SearchAppbar({Key? key}) : super(key: key);
  
  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
      width: 800,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: 
      Row(
        children: [
          Icon(Icons.location_on,color: Colors.amber,),
          TextField(
            controller: _controller,
            onChanged: (String value) async {
              return;
            },
            
          )
        ]
        ),
    ),
    SizedBox( height: 100, width:20),
    Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Icon(Icons.mic),
    )


        ],
      ),
    );
  }
}