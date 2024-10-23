import 'package:flutter/material.dart';
import 'package:mytask/view/home/dataCollection.dart';
import 'package:mytask/view/home/viewData.dart';
import 'package:mytask/view/widget/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 205, 241),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
              text: 'Add',
              buttonAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DataCollection()));
              },
            ),
            button(
              text: 'View',
              buttonAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ViewData()));
              },
            )
          ],
        ),
      ),
    );
  }
}
