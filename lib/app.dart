//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'location_list.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
        debugShowCheckedModeBanner: false, home: LocationList());
  }
}
