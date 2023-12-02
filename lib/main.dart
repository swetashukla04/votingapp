import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/constant.dart';
import 'package:votingapp/screens/home_screen.dart';
import 'package:votingapp/screens/launch_screen.dart';
import 'package:votingapp/screens/result_screen.dart';
import 'package:votingapp/state/vote.dart';
//import 'package:votingapp/state/authentication.dart';
//import 'package:votingapp/utilities.dart';



void main() => runApp(VoteApp());

class VoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VoteState(),
        ),
        ChangeNotifierProvider(
          create: (_) => VoteState(),
        ),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => Scaffold(
                body: LaunchScreen(),
              ),
          '/home': (context) => Scaffold(
                appBar: AppBar(
                  title: const Text(kAppName),
                ),
                //   actions: <Widget>[
                //     Consumer<AuthenticationState>(
                //       builder: (context, authState, child) {
                //         return getActions(context, authState);
                //       },
                //     ),
                //   ],
                // ),
                 body: const HomeScreen(),
              ),
          '/result': (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Result'),
                  leading: IconButton(
                    icon: Icon(Icons.home),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                //   actions: <Widget>[
                //     Consumer<AuthenticationState>(
                //       builder: (context, authState, child) {
                //         return getActions(context, authState);
                //       },
                //     ),
                //   ],
                ),
                body: ResultScreen(),
              ),
        },
      ),
    );
  }

  // PopupMenuButton getActions(
  //     BuildContext context, AuthenticationState authState) {
  //   if (authState.isAuthenticated!) {
  //     return PopupMenuButton<int>(
  //       itemBuilder: (context) => [
  //         PopupMenuItem(
  //           value: 1,
  //           child: Text('Logout'),
  //         )
  //       ],
  //       onSelected: (value) {
  //         if (value == 1) {
  //           // logout
  //           authState.logout();
  //           gotoLoginScreen(context, authState);
  //         }
  //       },
  //     );
  //   } else {
  //     // Return an empty container or any other widget when not authenticated.
  //     return PopupMenuButton<int>(
  //       itemBuilder: (context) => [],
  //     );
  //   }
  // }
}
