import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votingapp/state/vote.dart';

class VoteWidget extends StatefulWidget {
  const VoteWidget({Key? key}) : super(key: key);

  @override
  _VoteWidgetState createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {
  @override
  Widget build(BuildContext context) {
    final activeVote = Provider.of<VoteState>(context, listen: false).activeVote;

    if (activeVote == null) {
      // Handle the case when activeVote is null, for example, show a loading indicator or an error message.
      return const Center(child: Text("No active vote available."));
    }

    List<String> options = [];

    for (Map<String, int> option in activeVote.options) {
      option.forEach((title, value) {
        options.add(title);
      });
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Text(
              activeVote.voteTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
        ),
        for (String option in options)
          Card(
            child: InkWell(
              onTap: () {
                Provider.of<VoteState>(context, listen: false)
                    .selectedOptionInActiveVote = option;
              },
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 60,
                      ),
                      width: 8,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          option,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 22),
                        ),
                        color: Provider.of<VoteState>(context, listen: false)
                                    .selectedOptionInActiveVote ==
                                option
                            ? Colors.green[300]
                            : Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
