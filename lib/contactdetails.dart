import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/contact.dart';

class ContactDetails extends StatelessWidget {
  // This widget is the root of your application.
  final Contact contact;

  ContactDetails(this.contact);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Contacts Details',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new ContactDetailsPage(title: 'Contacts Details', contact: this.contact),
    );
  }
}

class ContactDetailsPage extends StatefulWidget {
  ContactDetailsPage({Key key, this.title, this.contact}) : super(key: key);

  final String title;
  final Contact contact;

  @override
  _ContactDetailsPageState createState() => new _ContactDetailsPageState(contact);
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  final Contact contact;
  _ContactDetailsPageState(this.contact);

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        constraints: new BoxConstraints.expand(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircleAvatar(
              backgroundImage: new NetworkImage(contact.Picture),
              backgroundColor: Colors.blueGrey,
              radius: 80.0,
              foregroundColor: Colors.grey,
            ),
            new Text(contact.DisplayName),
            new Text(contact.Address),
            new Text(contact.Address2),
            new Text(contact.Phone),
            new RaisedButton(onPressed: () {
              if(contact.Phone != ""){
                launch("tel:" + contact.Phone);
              }
            }, child: new Text("Call"),
            ),
          ],
        ),
      ),
    );
  }
}