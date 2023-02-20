import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Acerca"),
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Singular",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Splash",
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20.0),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/jlb2099"),
              ),
              title: Text("Jorge Lopez Bautista"),
              subtitle: Text("Software Architect"),
              trailing: Container(
                width: 120.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () async {
                          final url = "https://github.com/jlb2099";
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.black,
                          size: 30,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Version: 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
