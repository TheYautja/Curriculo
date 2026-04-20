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
          color: Color(0xfff6f5f4),
          child: Column(
            children: [
              SizedBox(height: 40),
              Expanded(
                child: Image.asset("assets/images/house.jpg", fit: BoxFit.scaleDown),
              ),
              Text("Augusto Massotti\n Pai da computação"),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 30),
                  ReviewCard("Linus Torvalds:", "Na verdade, copiei o kernel do linux do salsicha", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                  ReviewCard("Rainha Elizabeth:\n(antes de morrer)", "O CARA", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                  ReviewCard("Sam Altmann:", "\"treinei o GPT no git do salsicha\"", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                  ReviewCard("ChatGPT:", "beep boop", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                  SizedBox(width: 30),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),


        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xffcbeaa6),
          indicatorColor: Color(0xffc0d684),
          selectedIndex: 1,
          destinations: [
            NavigationDestination(icon: Icon(Icons.explore), label: "Experiência"),
            NavigationDestination(icon: Icon(Icons.explore), label: "Projetos"),
            NavigationDestination(icon: Icon(Icons.explore), label: "Contato"),
          ],
        )


      )
    );
  }

}


class ReviewCard extends StatelessWidget {

  double width;
  double height;
  String owner;
  String review;
  Color backgroundColor;
  Color detailColor;

  ReviewCard(this.owner, this.review, this.width, this.height, this.backgroundColor, this.detailColor);

  @override
  Widget build(BuildContext context){
    return Expanded( //expanding card, see if changes w more
      child: Card(
        color: this.backgroundColor,
        elevation: 2,
        shadowColor: detailColor,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: this.width,
          height: this.height,
          child: Center(
            child:Column(
              children: [
                Text(this.owner),
                Text(this.review),
              ],
            )
          )
        ),
      ),
      //fit: BoxFit.scaleDown, //wrong place
    );
  }
}

//["#f6f5f4","#cbeaa6","#c0d684"]



