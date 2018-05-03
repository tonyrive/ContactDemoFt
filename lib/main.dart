import 'package:flutter/material.dart';
import 'data/contact.dart';
import 'data/contacts.dart';
import 'contactdetails.dart';

void main() {
  runApp(new ContactPage());
}

class ContactPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Contacts',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new ContactHomePage(title: 'Contacts'),
    );
  }
}

class ContactHomePage extends StatefulWidget {
  ContactHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContactHomePageState createState() => new _ContactHomePageState();
}

class _ContactHomePageState extends State<ContactHomePage> {
  @override
  Widget build(BuildContext context) {
    var contacts = getContacts();

    var listView = new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contacts[index];
          return new SizedBox(
            height: 110.0,
            child: new Card(
              elevation: 2.0,
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new ListTile(
                    leading: new CircleAvatar(
                        backgroundImage: new NetworkImage(contact.Picture),
                        backgroundColor: Colors.blueGrey
                    ), //new Image.network(contact.Picture),
                    title: new Text(contact.DisplayName),
                    subtitle: new Text(contact.Phone),
                    onTap: ()=> _onTap(context, contact),
                  ),
                ],
              ),
            ),
          );
        }
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),

      body: listView
    );
  }

  _onTap(BuildContext context, Contact contact) {
    Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new ContactDetails(contact)),
    );
  }
}