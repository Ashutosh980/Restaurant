import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'api/users_api.dart';
import 'model/al.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Al> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Al>(
            future: futureAlbum,
            builder: (context, snapshot) {
              final users = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(itemCount: users!.data!.length,
                  itemBuilder: (context, index) {
                    final user = users!.data![index];

                    return ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.link!),
                      ),
                      title: Text(user.title!),
                      subtitle: Text(user.summary.toString()),
                    );
                  },);
                //Text(snapshot.data!.data![0].title.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
// import 'package:apicalling/api/users_api.dart';
// import 'package:apicalling/page/user_networkpage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'model/user.dart';
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   static final String title = 'Future Builder & Json';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: title,
//     theme: ThemeData(
//       primarySwatch: Colors.teal,
//     ),
//     home: MainPage(title: title),
//   );
// }
//
// class MainPage extends StatefulWidget {
//   final String title;
//   const MainPage({
//     required this.title,
//   });
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int index = 0;
//   Datum datum=Datum;
//
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     UsersApi();
//     Datum..toString();
//   }
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     bottomNavigationBar: BottomNavigationBar(
//       currentIndex: index,
//       selectedItemColor: Colors.teal,
//       items: [
//         BottomNavigationBarItem(
//           icon: Text('FutureBuilder'),
//           title: Text('Local'),
//         ),
//         BottomNavigationBarItem(
//           icon: Text('FutureBuilder'),
//           title: Text('Network'),
//         ),
//       ],
//       onTap: (int index) => setState(() => this.index = index),
//     ),
//     body: buildPages(),
//   );
//
//   Widget buildPages() {
//     switch(index){
//     // switch (index) {
//     //   case 0:
//     //     return UserLocalPage();
//       case 1:
//         return UserNetworkPage();
//       default:
//         return Container();
//     }
//   }
// }
