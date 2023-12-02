import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/state/vote.dart';
import 'package:votingapp/models/vote.dart';

class VoteListWidget extends StatelessWidget {
  const VoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Function alternateColor = getAlternate(start: 0);
     String activeVoteId = Provider.of<VoteState>(context).activeVote?.voteId ?? '';
    return Consumer<VoteState>(
      builder: (context, voteState, child) {
       

        return Column(
          children: <Widget>[
            for (Vote vote in voteState.voteList)
              Card(
 
                child: ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      vote.voteTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        // color: activeVoteId == vote.voteId
                        //     ? Colors.white
                        //     : Colors.black,
                        color: Colors.black,
                        // fontWeight: activeVoteId == vote.voteId
                        //     ? FontWeight.bold
                        //     : FontWeight.normal,
                      ),
                    ),
                  ),
                   
                  selected: activeVoteId == vote.voteId ? true : false,
                  onTap: () {
                    Provider.of<VoteState>(context,listen: false).activeVote=vote;
                  },
                ),
                 color:  activeVoteId==vote.voteId ?Colors.red.shade200:alternateColor(),
              ),
          ],
        );
      },
    );
  }

  Function getAlternate({int start = 0}) {
    int indexNum = start;

    Color? getColor() {
      Color? color = Colors.teal[100];

      if (indexNum % 2 == 0) {
        color = Colors.blueAccent[100];
      }
      ++indexNum;
      return color;
    }

    return getColor;
  }
}