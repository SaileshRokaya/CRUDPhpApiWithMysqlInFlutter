import 'package:flutter/material.dart';

import 'model/userModel.dart';
import 'service/userService.dart';

class AddEditUser extends StatefulWidget {
  final UserModel? userModel;
  final int? index;
  AddEditUser({this.userModel, this.index});
  @override
  _AddEditUserState createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController id = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  bool editMode = false;

  UserService userservice = new UserService();

  add(UserModel userModel) async {
    await userservice.addUser(userModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Add Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

  update(UserModel userModel) async {
    await userservice.updateUser(userModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Update Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      firstname.text = widget.userModel!.firstname;
      lastname.text = widget.userModel!.lastname;
      phone.text = widget.userModel!.phone;
      email.text = widget.userModel!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? "Update" : "Add"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: firstname,
              decoration: InputDecoration(hintText: 'First Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: lastname,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(hintText: 'Phone'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'email'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (editMode) {
                UserModel userModel = UserModel(
                    id: widget.userModel!.id,
                    firstname: firstname.text,
                    lastname: lastname.text,
                    phone: phone.text,
                    email: email.text);
                update(userModel);
              } else {
                if (firstname.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("This field is required"),
                  ));
                } else {
                  UserModel userModel = UserModel(
                      id: id.text,
                      firstname: firstname.text,
                      lastname: lastname.text,
                      phone: phone.text,
                      email: email.text);
                  add(userModel);
                }
              }
            },
            child: Text(
              editMode ? "Update" : "Save",
            ),
          ),
        ],
      ),
    );
  }
}
