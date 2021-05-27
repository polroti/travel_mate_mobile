import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PastTripsPage extends StatefulWidget {
  PastTripsPage({
    Key key,
  }) : super(key: key);

  @override
  _PastTripsPageState createState() => _PastTripsPageState();
}

List nikan = ["A", "B", "C", "D", "E", "F"];
List anotherNikan = [
  {"start": "Wellawatte", "end": "Petta1"},
  {"start": "Wellawatte", "end": "Petta1"},
  {"start": "Wellawatte", "end": "Petta"},
  {"start": "Wellawatte", "end": "Petta"},
  {"start": "Wellawatte", "end": "Petta"},
  {"start": "Wellawatte", "end": "Petta parak"},
];

class _PastTripsPageState extends State<PastTripsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [],
        elevation: 4,
        title: Text("Past Trips"),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            //loop here!
            for (int i = 0; i <= anotherNikan.length - 1; i++)
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                elevation: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'Wellawattte - Pettah',
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment(0.95, 0),
                              child: Padding(
                                child: Text(
                                  'LKR35.00',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                padding: EdgeInsets.all(7.0),
                              )),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                            alignment: Alignment(-0.1, 0),
                            child: Padding(
                              child: Text(
                                'Pettah - Moratuwa',
                                style: const TextStyle(),
                              ),
                              padding: EdgeInsets.fromLTRB(7.0, 0, 0, 7.0),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(7.0, 0, 0, 7.0),
                          child: Icon(
                            Icons.directions_bus,
                            color: Colors.black,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                            alignment: Alignment(-0.1, 0),
                            child: Padding(
                              child: Text(
                                '26.03.2021',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              padding: EdgeInsets.fromLTRB(7.0, 0, 0, 4.0),
                            )),
                        Expanded(
                          child: Align(
                              alignment: Alignment(1, 0),
                              child: Padding(
                                child: TextButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  child: Text("TRIP INFORMATION"),
                                ),
                                padding: EdgeInsets.fromLTRB(0, 0, 7.0, 4.0),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      )),
    );
  }
}

// Card(
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               color: Color(0xFFF5F5F5),
//               elevation: 5,
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(7.0),
//                         child: Text(
//                           'Wellawattte - Pettah',
//                           style: const TextStyle(fontSize: 17),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                             alignment: Alignment(0.95, 0),
//                             child: Padding(
//                               child: Text(
//                                 'LKR35.00',
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               padding: EdgeInsets.all(7.0),
//                             )),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Align(
//                           alignment: Alignment(-0.1, 0),
//                           child: Padding(
//                             child: Text(
//                               'Pettah - Moratuwa',
//                               style: const TextStyle(),
//                             ),
//                             padding: EdgeInsets.fromLTRB(7.0, 0, 0, 7.0),
//                           ))
//                     ],
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(7.0, 0, 0, 7.0),
//                         child: Icon(
//                           Icons.directions_bus,
//                           color: Colors.black,
//                           size: 24,
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Align(
//                           alignment: Alignment(-0.1, 0),
//                           child: Padding(
//                             child: Text(
//                               '26.03.2021',
//                               style: TextStyle(color: Colors.grey.shade500),
//                             ),
//                             padding: EdgeInsets.fromLTRB(7.0, 0, 0, 7.0),
//                           )),
//                       Expanded(
//                         child: Align(
//                             alignment: Alignment(1, 0),
//                             child: Padding(
//                               child: TextButton(
//                                 onPressed: () {
//                                   print('Button pressed ...');
//                                 },
//                                 child: Text("DETAILS"),
//                               ),
//                               padding: EdgeInsets.fromLTRB(0, 0, 7.0, 7.0),
//                             )),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
