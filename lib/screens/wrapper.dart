import 'package:attendance/models/user.dart';
import 'package:attendance/screens/aunthenticate/authenticate.dart';
import 'package:attendance/screens/home/home.dart';
import 'package:attendance/widgets/nav.dart';

//import 'package:attendance/screens/home/splash1.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<UserM>(context);
    if(user==null)
    return Authenticate();
    else
    return Nav();
  }
}
