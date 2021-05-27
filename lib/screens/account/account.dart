import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountPage extends StatefulWidget {
  AccountPage({
    Key key,
  }) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Add Money".toUpperCase(),
        ),
        elevation: 8,
        icon: Icon(Icons.add),
        onPressed: () {
          print("Otha veliya poda poolu");
        },
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Account Status',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment(0.95, 0),
                      child: Padding(
                        child: Chip(
                          backgroundColor: Colors.green.shade100,
                          label: Text(
                            "Active",
                            style: TextStyle(color: Colors.green.shade900),
                          ),
                        ),
                        padding: EdgeInsets.all(7.0),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Account Balance',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment(0.95, 0),
                      child: Padding(
                        child: Text(
                          'LKR 2500.00',
                          style: const TextStyle(fontSize: 17),
                        ),
                        padding: EdgeInsets.all(7.0),
                      )),
                )
              ],
            ) //Account status
          ],
        ),
      ),
    );
  }
}
