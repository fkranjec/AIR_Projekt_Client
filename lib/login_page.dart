import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        //await createUser(session.accounts[0]).then(
        //    (value) => (Navigator.pushReplacementNamed(context, "/home")));

        setState(() {
          _session = session;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage(walletId: _session.accounts[0])));
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  Future<http.Response> createUser(String id) {
    return http.post(
      Uri.parse('http://10.0.2.2:3000/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.gamepad,
                  size: 200.00,
                  color: Colors.greenAccent,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Text("ANMANOFIVE",
                      style:
                          TextStyle(fontSize: 50, color: Colors.greenAccent)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Text(
                    "asdjd iajso saijd ioasj dioa iasjd oiasj iaj iosja doij aisjd ia udhsai uhduahs idjasoi j oiasj dioajs oijsa",
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () => {loginUsingMetamask(context)},
              label: const Text(
                "Connect with Metamask",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              icon: Image.asset(
                'assets/images/metamask.ico',
                scale: 5,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            )
          ],
        ),
      ),
    );
  }
}
