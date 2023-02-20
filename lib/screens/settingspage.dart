import 'package:flutter/material.dart';
import 'package:singularsplash/screens/aboutpage.dart';
import 'package:singularsplash/widgets/accent_colors.dart';
import 'package:singularsplash/widgets/thememode_dialog.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configuracion"),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Apariencia",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return ThemeModeDialog();
                    }),
                title: Text(
                  "Selecciona un modo para el tema",
                ),
                leading: Icon(Icons.format_paint),
                subtitle: Text("Elige un tema"),
              ),
              ListTile(
                title: Text("Selecciona tema oscuro"),
                subtitle: Text(
                    "Elija el tema oscuro para usar cuando el modo oscuro esté habilitado"),
                leading: Icon(Icons.color_lens),
              ),
              ListTile(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AccentColors();
                      }),
                  title: Text("Elija un color"),
                  subtitle: Text("Seleccione un color"),
                  leading: Icon(Icons.colorize)),
              ListTile(
                title: Text(
                  "Info",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
                title: Text("Acerca de"),
                leading: Icon(Icons.info),
              )
            ],
          ),
        ));
  }
}
