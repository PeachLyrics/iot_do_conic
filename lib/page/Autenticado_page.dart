import 'package:iot_do_conic/api/local_auth_api.dart';
import 'package:iot_do_conic/main.dart';
import 'package:iot_do_conic/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class Autenticado extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, color: Colors.red, size:400),
                SizedBox(height: 24),
                buildAuthenticate(context),
                Text(''),
                Text(''),
                Text('Seja bem vindo(a)'),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
              ],
            ),
          ),
        ),
      );

      Widget buildAuthenticate(BuildContext context) => buildButton(
        text: 'Prosseguir',
        icon: Icons.lock_open,
        onClicked: () async {
          //final isAuthenticated = await LocalAuthApi.authenticate();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );

          /*if (isAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }*/
        },
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
      side: BorderSide(color: Colors.pink)
          )
        )),
        icon: Icon(icon, size: 26),
        label: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}