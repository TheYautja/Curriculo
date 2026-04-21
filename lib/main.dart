import 'package:flutter/material.dart';

void main() {
  runApp(Curriculo());
}

class Curriculo extends StatefulWidget {
  @override
  _CurriculoState createState() => _CurriculoState();
}

class _CurriculoState extends State<Curriculo> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Experiencia()),
    Center(child: Projetos()),
    Center(child: Text("Contato")),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[currentIndex],

        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xffcbeaa6),
          indicatorColor: Color(0xffc0d684),
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Início"),
            NavigationDestination(icon: Icon(Icons.article_sharp), label: "Experiência"),
            NavigationDestination(icon: Icon(Icons.hardware), label: "Projetos"),
            NavigationDestination(icon: Icon(Icons.contact_page), label: "Contato"),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f5f4),
      child: Column(
        children: [
          SizedBox(height: 40),

          Expanded(
            child: Image.asset("assets/images/house.jpg", fit: BoxFit.scaleDown),
          ),

          Text("Augusto Massotti\nPai da computação", textAlign: TextAlign.center),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 30),
                TextCard("Linus Torvalds:", "Na verdade, copiei o kernel do linux do salsicha", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                TextCard("Alan Turing:\n(antes de morrer)", "Tudo que eu sei, devo ao Augusto", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                TextCard("Sam Altmann:", "\"treinei o GPT no git do salsicha\"", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                TextCard("ChatGPT:", "beep boop", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
                SizedBox(width: 30),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


class Experiencia extends StatefulWidget {
  @override
  _ExpState createState() => _ExpState();
}


class _ExpState extends State<Experiencia> {

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Column(
          children: [
            TextCard("Linus Torvalds:", "Na verdade, copiei o kernel do linux do salsicha", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
            TextCard("Alan Turing:\n(antes de morrer)", "Tudo que eu sei, devo ao Augusto", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
            TextCard("Sam Altmann:", "\"treinei o GPT no git do salsicha\"", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
            TextCard("ChatGPT:", "beep boop", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
          ]
        ),
        Column(
          children: [
            TextCard("Linus Torvalds:", "Na verdade, copiei o kernel do linux do salsicha", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
            TextCard("Alan Turing:\n(antes de morrer)", "Tudo que eu sei, devo ao Augusto", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
            TextCard("Sam Altmann:", "\"treinei o GPT no git do salsicha\"", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
            TextCard("ChatGPT:", "beep boop", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
          ]
        ),
      ]
    );
  }
}


class Projetos extends StatefulWidget {
  @override
  _ProjState createState() => _ProjState();
}


class _ProjState extends State<Projetos> {
  @override
  Widget build(BuildContext context){
    return Text("teste proj");
  }
}


class TextCard extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color detailColor;

  TextCard(this.title, this.subtitle, this.width, this.height, this.backgroundColor, this.detailColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 2,
      shadowColor: detailColor,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text(subtitle, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
