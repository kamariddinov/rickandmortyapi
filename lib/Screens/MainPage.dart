import 'package:rickandmorty/Repisitory/CharactersRepisitory.dart';
import 'package:flutter/material.dart';

Widget listViewWidget(List<Results> characters) {
  return Container(
      color: Colors.black,
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {
            return Card(
                color: Colors.blueGrey,
                child: ListTile(
                    subtitle: Text(
                      'Species - ${characters[position].species}\nGender - ${characters[position].gender}\nStatus - ${characters[position].status}',
                      style: const TextStyle(color: Colors.lightGreenAccent),
                    ),
                    title: Text(
                      characters[position].name,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        radius: 31,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundImage:
                              NetworkImage(characters[position].image),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Card(
                                    child: Scaffold(
                                        appBar: AppBar(
                                          iconTheme: const IconThemeData(
                                              color: Colors.greenAccent),
                                          backgroundColor: Colors.blueGrey,
                                          title: Text(
                                            characters[position].name,
                                            style: const TextStyle(
                                                fontFamily: 'Schyler',
                                                fontSize: 25,
                                                color: Colors.greenAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          centerTitle: true,
                                        ),
                                        body: Container(
                                          color: Colors.blueGrey,
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Image.network(
                                                      characters[position]
                                                          .image)),
                                              const Divider(),
                                              Text(
                                                'Name - ${characters[position].name}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                              const Divider(),
                                              Text(
                                                'Status - ${characters[position].status}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                              const Divider(),
                                              Text(
                                                'Gender - ${characters[position].gender}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                              const Divider(),
                                              Text(
                                                'Species - ${characters[position].species}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                              const Divider(),
                                              Text(
                                                'Type - ${characters[position].type}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                              const Divider(),
                                              Text(
                                                'Origin - ${characters[position].origin.name}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                              const Divider(),
                                              Text(
                                                'Location - ${characters[position].location.name}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.greenAccent),
                                              ),
                                            ],
                                          ),
                                        )),
                                  )));
                    }));
          }));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Rick and Morty',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Schyler', color: Colors.greenAccent, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(page),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data!)
                : const Center(child: CircularProgressIndicator());
          }),
      bottomNavigationBar: Container(
        clipBehavior: Clip.none,
        color: Colors.black,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              visualDensity: VisualDensity.comfortable,
              iconSize: 25,
              alignment: Alignment.center,
              icon: const Icon(Icons.arrow_back),
              color: Colors.blueGrey,
              tooltip: 'Previous page',
              onPressed: () {
                setState(() {
                  if (page <= 1) {
                    page == 1;
                  } else {
                    page--;
                  }
                });
              },
            ),
            Text(
              '$page',
              style: const TextStyle(color: Colors.blueGrey, fontSize: 23),
            ),
            IconButton(
              visualDensity: VisualDensity.comfortable,
              iconSize: 25,
              alignment: Alignment.center,
              icon: const Icon(Icons.arrow_forward),
              color: Colors.blueGrey,
              tooltip: 'Next page',
              onPressed: () {
                setState(() {
                  if (page >= 41) {
                    page == 41;
                  } else {
                    page++;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
