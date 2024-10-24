import 'package:amazon_clone_project/constants/global_variables.dart';
import 'package:amazon_clone_project/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_project/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Clone",
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Hello")),
          backgroundColor: GlobalVariables.secondaryColor,
        ),
        body: Column(
          children: [
            const Center(
              child: Text("Flutter Demo Home Page"),
            ),
            Builder(builder: (context) {
              // If you try to use Navigator.pushNamed(context, ...) in some places,
              // the context might refer to the wrong part of the widget tree. For example,
              // it might not have access to the Navigator or other inherited widgets (like a Scaffold).
              // By wrapping the ElevatedButton in a Builder, you ensure that the context passed to
              // Navigator.pushNamed is the correct one, where a Navigator is actually available in the widget tree.
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AuthScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      const Size(90, 40), // Set width and height to be the same
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0), // Set border radius to 0 for a perfect square
                  ),
                ),
                child: const Text("Click"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
