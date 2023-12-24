import 'package:flutter/material.dart';

import 'db_helper.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScreen();
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  User defaultUser = User(1, 'Doncic', '12345678', '938749606', 'doniyorbekomilov@gmail.com', "Sayram 73/45");
  List<User> users = [User(1, 'Doncic', '12345678', '938749606', 'doniyorbekomilov@gmail.com', "Sayram 73/45")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.black, // You can customize the border color here
                    width: 1.0, // You can customize the border width here
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  title: Text(
                    user.username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.email),
                      Text(user.phone),
                      Text(user.address),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
        child: const Icon(
          Icons.refresh,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  void fetch() async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.testRead("user.db");
    List<Map> dbUsers = await dbHelper.getUsers('user.db');
    List<User> temp = [defaultUser];
    for (Map user in dbUsers) {
      temp.add(User(user['id'], user['username'], user['password'], user['phone'], user['email'], user['address']));
    }
    setState(() {
      users = temp;
    });
  }
}
