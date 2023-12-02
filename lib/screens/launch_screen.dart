import 'package:flutter/material.dart';
import 'package:votingapp/constant.dart';
import 'package:votingapp/widgets/shared_widget.dart';
//import 'package:provider/provider.dart';
//import 'package:votingapp/utilities.dart';
//import '../state/authentication.dart';
//import 'package:votingapp/state/authentication.dart';

class LaunchScreen extends StatelessWidget {
  LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Container(
      // builder: (context, authState, child) {
      //   if (authState.authStatus == kAuthLoading) {
          return Container(
            width: 400,
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: const Text(
                    kAppName,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                // Text(
                //   'loading...',
                //   style: TextStyle(fontSize: 12.0),
                // ),
                 LoginButton(
                      label: 'Google Sign In',
                      onPressed: () => signIn(context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoginButton(
                      label: 'Anonymous Sign In',
                      onPressed: () => signIn(context),
                    ),
              ],
            ),
          );
        }
  //        else if (authState.authStatus == null || authState.authStatus == kAuthError)
  //        {
  //         return Container(
  //           width: 400,
  //           margin: const EdgeInsets.all(20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Container(
  //                 margin: const EdgeInsets.only(top: 100),
  //                 child: const Text(
  //                   kAppName,
  //                   style: TextStyle(
  //                     fontSize: 40.0,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.blueAccent,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 100,
  //               ),
  //               Column(
  //                 children: <Widget>[
  //                   LoginButton(
  //                     label: 'Google Sign In',
  //                     onPressed: () => signIn(context),
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                   LoginButton(
  //                     label: 'Anonymous Sign In',
  //                     onPressed: () => signIn(context),
  //                   ),
  //                 ],
  //               ),
  //               if (authState.authStatus == kAuthError)
  //                 Text(
  //                   'Error...',
  //                   style: TextStyle(
  //                     fontSize: 12.0,
  //                     color: Colors.redAccent,
  //                   ),
  //                 ),
  //             ],
  //           ),
  //         );
  //       } else {
  //         return Container(); // Handle other cases or return an empty container
  //       }
  //     },
  //   );
  // }

  void signIn(BuildContext context) 
  {
    //Perform the authentication logic based on the selected service
    //authState.login(serviceName: service);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
