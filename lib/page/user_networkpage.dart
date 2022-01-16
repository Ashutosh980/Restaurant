// import 'package:apicalling/api/users_api.dart';
// import 'package:apicalling/model/user.dart';
// import 'package:flutter/material.dart';
//
//
// class UserNetworkPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: FutureBuilder<List<Datum>>(
//       future: UsersApi.getUsers(),
//       builder: (context, snapshot) {
//         final users = snapshot.data;
//
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return Center(child: CircularProgressIndicator());
//           default:
//             if (snapshot.hasError) {
//               return Center(child: Text('Some error occurred!'));
//             } else {
//               return
//                  buildUsers(users!);
//             }
//         }
//       },
//     ),
//   );
//
//   Widget buildUsers(List<Datum> news) => ListView.builder(
//     physics: BouncingScrollPhysics(),
//     itemCount: news.length,
//     itemBuilder: (context, index) {
//       final user = news[index];
//       return ListTile(
//         // onTap: () => Navigator.of(context).push(MaterialPageRoute(
//         //   builder: (BuildContext context) => UserPage(user: user),
//         // )),
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(user.link.toString()),
//         ),
//         title: Text(user.title.toString()),
//         subtitle: Text(user.summary.toString()),
//       );
//     },
//   );
// }