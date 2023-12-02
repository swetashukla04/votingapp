import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/state/vote.dart';
import 'package:votingapp/widgets/vote.dart';
import 'package:votingapp/widgets/vote_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScrState createState() => _HomeScrState();
}


class _HomeScrState extends State<HomeScreen> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false)
          .clearState();
      Provider.of<VoteState>(context, listen: false)
          .loadVoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: _currentStep,
              steps: [
                getStep(
                  title: 'Choose',
                  child: VoteListWidget(),
                  isActive: true,
                ),
                getStep(
                  title: 'Vote',
                  child:  VoteWidget(),
                  isActive:
                      _currentStep >= 1 ? true : false,
                ),
              ],
              onStepContinue: () {
                if(_currentStep==0){
                  if(step2Required()){
                   setState(() {
                      _currentStep = (_currentStep + 1) > 1? 1: _currentStep + 1;
                    });
                  }
                  else
                  {
                    showSnackBar(context, 'PLease select a vote first');
                  }
                }
                else if(_currentStep==1){
                    if(step3Required()){
                      Navigator.pushReplacementNamed(context, '/result');
                    }
                    else
                    {
                      showSnackBar(context, 'Please mark your vote!');
                    }
                }
              },
              onStepCancel: () {

                if(_currentStep<=0){
                  Provider.of<VoteState>(context,listen: false).activeVote=null;
                }
                setState(() {
                  _currentStep = (_currentStep - 1) < 0 ? 0: _currentStep - 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  bool step2Required() {
    if (Provider.of<VoteState>(context,listen: false).activeVote ==
        null) {
      return false;
    }
    return true;
  }

  bool step3Required(){

 
     // ignore: unnecessary_null_comparison
     if (Provider.of<VoteState>(context,listen: false).selectedOptionInActiveVote == null) {
      return false;
    }
    return true;
  }

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(fontSize: 22),
      ),
    ));
  }

  Step getStep(
      {required String title,
      required Widget child,
      bool isActive = false}) {
    return Step(
      title: Text(title),
      content: child,
      isActive: isActive,
    );
  }
}
