import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatapp extends StatelessWidget{
  var isonclick = false;

  var faker = new Faker();

  List<Widget> myTab = [
    Tab(
      child: Icon(Icons.add_a_photo),
    ),
    Tab(
      child: Text(
        "CHATS",
      ),
    ),
    Tab(
      child: Text("STATUS"),
    ),
    Tab(
      child: Text("CALLS"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: (isonclick) ? Brightness.light : Brightness.dark),
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 130,
                  color: Colors.purple,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Log Out"))
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("WhatsApp Clone"),
            bottom: TabBar(
              tabs: myTab,
            ),
            actions: [
              Icon(
                Icons.search,
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
          body: ListView.builder(
              padding: EdgeInsets.all(2),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Dismissible(
                  confirmDismiss: (direction) {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm"),
                            content: Text("Are you sure want to delete ?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("No")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                  ),
                  key: Key(index.toString()),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/id/$index/200/300'),
                    ),
                    title: Text(faker.person.name()),
                    subtitle: Text(faker.lorem.sentence()),
                    trailing: Text("12.00 PM"),
                  ),
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ),
      ),
    );
  }
}