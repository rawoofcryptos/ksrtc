import 'package:flutter/material.dart';
import 'package:ksrtc/Login.dart';
import 'package:ksrtc/authenticate.dart';
import 'package:ksrtc/model/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Login();
    }
  }
}
