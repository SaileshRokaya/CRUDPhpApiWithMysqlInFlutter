import 'package:flutter/material.dart';
import 'package:phpapi/model/userModel.dart';
import 'package:phpapi/service/userService.dart';

import 'addedituser.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key, String? title}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late List<UserModel> userList;
  bool loading = true;

  getAllUser() async {
    userList = await UserService().getUser();
    setState(() {
      loading = false;
    });
    print("User: ${userList.length}");
  }

  delete(UserModel userModel) async {
    await UserService().deleteUser(userModel);
    setState(() {
      loading = true;
      getAllUser();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Delete Sucessful"),
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Crud'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditUser(),
                ),
              ).then((value) => getAllUser());
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserModel user = userList[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditUser(
                          userModel: user,
                          index: index,
                        ),
                      ),
                    ).then((value) => getAllUser());
                  },
                  leading: CircleAvatar(
                    child: Text(user.firstname[0]),
                  ),
                  title: Text(user.firstname),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        delete(user);
                      }),
                );
              }),
    );
  }
}
