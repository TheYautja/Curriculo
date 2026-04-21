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

  final List<ExperienceModel> experiences = [
    ExperienceModel("Empresa", "Dev (2024 - atual)"),
    ExperienceModel("Empresa", "Dev (2023)"),
  ];

  final List<ProjectModel> projects = [
    ProjectModel("App", "em", "assets/images/house.jpg"),
    ProjectModel("App", "em", "assets/images/house.jpg"),
  ];

  late final List<Widget> _pages = [
    HomePage(),
    Experiencia(experiences),
    Projetos(projects),
    Center(child: Text("Contato")),
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(

        body: _pages[currentIndex],

        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xffcbeaa6),
          indicatorColor: Color(0xffc0d684),
          selectedIndex: currentIndex,
          onDestinationSelected: (index){
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


class ExperienceModel {
  final String title;
  final String description;

  ExperienceModel(this.title, this.description);
}

class ProjectModel {
  final String title;
  final String description;
  final String imagePath;

  ProjectModel(this.title, this.description, this.imagePath);
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
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
                TextCard("Sobre mim", "aeknvfaasdadasd", 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
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


class Experiencia extends StatelessWidget {

  final List<ExperienceModel> experiences;

  Experiencia(this.experiences);

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: experiences.map((exp){
          return Padding(
            padding: EdgeInsets.all(16),
            child: TextCard(exp.title, exp.description, 300, 200, Color(0xffcbeaa6), Color(0xffc0d684)),
          );
        }).toList(),
      )
    );
  }
}


class Projetos extends StatelessWidget {

  final List<ProjectModel> projects;

  Projetos(this.projects);

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: projects.map((proj){
          return Padding(
            padding: EdgeInsets.all(16),
            child: ProjCard(proj.title, proj.description, 200, 200, proj.imagePath, Color(0xffcbeaa6), Color(0xffc0d684)),
          );
        }).toList(),
      )
    );
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
  Widget build(BuildContext context){
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


class ProjCard extends StatelessWidget {

  final double width;
  final double height;
  final String title;
  final String subtitle;
  final String imgPath;
  final Color backgroundColor;
  final Color detailColor;

  ProjCard(this.title, this.subtitle, this.width, this.height, this.imgPath, this.backgroundColor, this.detailColor);

  @override
  Widget build(BuildContext context){
    return Card(
      color: backgroundColor,
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset(imgPath, fit: BoxFit.scaleDown),
              Text(title),
              Text(subtitle),
            ],
          )
        )
      )
    );
  }

}
