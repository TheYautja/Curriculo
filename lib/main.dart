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
    ExperienceModel("Governo Americano", "cientista da computacao\n1968 - 1980\n Criei a world wide web(sozinho)"),
    ExperienceModel("IFC - câmpus Concórdia", "Aluno\n2023 - 2026?\n estudei"),
  ];

  final List<ProjectModel> projects = [
    ProjectModel("Rigel", "Emulador de Chip8", "assets/images/chip8print.png"),
    ProjectModel("Valinor", "Linguagem de programação interpretada", "assets/images/house.jpg"),
    ProjectModel("Gondolin", "Kernel em C", "assets/images/kernel.jpg"),
    ProjectModel("Poppy", "Emulador de terminal", "assets/images/poppyprint.png"),
  ];

  void addExperience(ExperienceModel exp) {
    setState(() {
      experiences.add(exp);
    });
  }

  void addProject(ProjectModel proj) {
    setState(() {
      projects.add(proj);
    });
  }

  late final List<Widget> _pages = [
    HomePage(),
    Experiencia(experiences, addExperience),
    Projetos(projects, addProject),
    Contato(),
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: _pages[currentIndex]),

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

class PageWrapper extends StatelessWidget {

  final Widget child;

  PageWrapper(this.child);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Color(0xfff6f5f4),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: child,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return PageWrapper(
      SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 250,
              child: Image.asset("assets/images/pomba.png", fit: BoxFit.contain),
            ),

            Text(
              "Augusto Dalla Costa Massotti",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("C - C++ - bash"),

            SizedBox(height: 30),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                TextCard("Sobre mim", "Aluno do IFC campus Concórdia, interessado em low-level", 300, 180, Color(0xffcbeaa6), Color(0xffc0d684)),
                TextCard("Objetivo", "Ir bem no ENEM", 300, 180, Color(0xffcbeaa6), Color(0xffc0d684)),
                TextCard("Competências", "Virtualmente nenhuma", 300, 180, Color(0xffcbeaa6), Color(0xffc0d684)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class Experiencia extends StatelessWidget {

  final List<ExperienceModel> experiences;
  final Function(ExperienceModel) onAdd;

  Experiencia(this.experiences, this.onAdd);

  @override
  Widget build(BuildContext context){
    return PageWrapper(
      Column(
        children: [

          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddExperiencePage()),
              );

              if (result != null) {
                onAdd(result);
              }
            },
            child: Text("Add Experiência"),
          ),

          SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: experiences.length,
              itemBuilder: (context, index){
                final exp = experiences[index];
                return TextCard(exp.title, exp.description, double.infinity, double.infinity, Color(0xffcbeaa6), Color(0xffc0d684));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Projetos extends StatelessWidget {

  final List<ProjectModel> projects;
  final Function(ProjectModel) onAdd;

  Projetos(this.projects, this.onAdd);

  @override
  Widget build(BuildContext context){
    return PageWrapper(
      Column(
        children: [

          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddProjectPage()),
              );

              if (result != null) {
                onAdd(result);
              }
            },
            child: Text("Add Projeto"),
          ),

          SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index){
                final proj = projects[index];
                return ProjCard(proj.title, proj.description, double.infinity, double.infinity, proj.imagePath, Color(0xffcbeaa6), Color(0xffc0d684));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Contato extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return PageWrapper(
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Contato", style: TextStyle(fontSize: 24)),

            SizedBox(height: 30),

            TextCard("Email", "am.96138669@gmail.com", 400, 100, Color(0xffcbeaa6), Color(0xffc0d684)),
            SizedBox(height: 10),
            TextCard("GitHub", "github.com/TheYautja", 400, 100, Color(0xffcbeaa6), Color(0xffc0d684)),
            SizedBox(height: 10),
            TextCard("ZipZop", "(49) 9800-8934", 400, 100, Color(0xffcbeaa6), Color(0xffc0d684)),

          ],
        ),
      ),
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
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
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
      child: Column(
        children: [

          Expanded(
            child: Image.asset(
              imgPath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(subtitle, textAlign: TextAlign.center),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class AddExperiencePage extends StatefulWidget {
  @override
  _AddExperiencePageState createState() => _AddExperiencePageState();
}

class _AddExperiencePageState extends State<AddExperiencePage> {

  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Nova Experiência")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Título"),
            ),

            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Descrição"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(
                  context,
                  ExperienceModel(
                    titleController.text,
                    descController.text,
                  ),
                );
              },
              child: Text("Salvar"),
            )

          ],
        ),
      ),
    );
  }
}

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final imgController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Novo Projeto")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Título"),
            ),

            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Descrição"),
            ),

            TextField(
              controller: imgController,
              decoration: InputDecoration(labelText: "Caminho da imagem"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(
                  context,
                  ProjectModel(
                    titleController.text,
                    descController.text,
                    imgController.text,
                  ),
                );
              },
              child: Text("Salvar"),
            )

          ],
        ),
      ),
    );
  }
}
