import 'package:iot_do_conic/api/local_auth_api.dart';
import 'package:iot_do_conic/main.dart';
import 'package:iot_do_conic/page/home_page.dart';
import 'package:iot_do_conic/page/Autenticado_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintPage extends StatelessWidget {
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
                Icon(Icons.fingerprint, color: Colors.pink, size:400),
                SizedBox(height: 24),
                buildAuthenticate(context),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text('Por favor, aproxime seu dedo ao leitor biométrico do seu dispositivo.'),
              ],
            ),
          ),
        ),
      );

  Widget buildText(String text, bool checked) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? Icon(Icons.check, color: Colors.green, size: 24)
                : Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 24)),
          ],
        ),
      );

  Widget buildAuthenticate(BuildContext context) => buildButton(
        text: 'Autenticar',
        icon: Icons.lock_open,
        onClicked: () async {
          //final isAuthenticated = await LocalAuthApi.authenticate();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Autenticado()),
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