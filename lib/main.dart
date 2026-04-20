import 'package:flutter/material.dart';

void main() {
  runApp(Curriculo());
}


class Curriculo extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp (
      home: Scaffold(


        body: Container(
          color: Color(0xfff3f9d2),
          child: Column(
            children: [
              SizedBox(height: 40),
              Expanded(
                child: Image.asset("assets/images/house.jpg", fit: BoxFit.scaleDown),
              ),
              Text("Augusto Massotti\n pai da computação"),
              SizedBox(height: 30),
              Row(
                children: [
                  Text("teste c1"),
                  Text("teste c2"),
                  Text("teste c3"),
                ],
              ),
            ],
          ),
        ),


        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xffcbeaa6),
          indicatorColor: Color(0xffc0d684),
          selectedIndex: 1,
          destinations: [
            NavigationDestination(icon: Icon(Icons.explore), label: "explore"),
            NavigationDestination(icon: Icon(Icons.explore), label: "exploree"),
            NavigationDestination(icon: Icon(Icons.explore), label: "exploreee"),
          ],
        )


      )
    );
  }

}

//["#f3f9d2","#cbeaa6","#c0d684"]
