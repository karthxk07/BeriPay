import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("banner2.jpg"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 3.0),
          child: Text("BeriPay",
              style: GoogleFonts.mukta(
                textStyle: const TextStyle(color: Colors.white, fontSize: 25),
              )),
        ),
      ),
      const Card(child: Text("Pay using UPI")),
      GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        mainAxisSpacing: 0.0,
        crossAxisCount: 4,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 126, 38, 31),
              radius: 20,
              child: Text(
                "K",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 126, 38, 31),
              radius: 20,
              child: Text(
                "K",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 126, 38, 31),
              radius: 20,
              child: Text(
                "K",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 126, 38, 31),
              radius: 20,
              child: Text(
                "K",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 126, 38, 31),
              radius: 20,
              child: Text(
                "K",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
