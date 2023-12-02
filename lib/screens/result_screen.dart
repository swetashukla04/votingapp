import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:votingapp/models/vote.dart';
import 'package:votingapp/state/vote.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height/2,
      child: createChart(context),
    );
  }

  Widget createChart(BuildContext context) {
    return charts.BarChart(
      retrieveVoteResult(context),
      animate: true,
    );
  }

  List<charts.Series<VoteData, String>> retrieveVoteResult(
      BuildContext context) {
    Vote activeVote =
        Provider.of<VoteState>(context, listen: false)
            .activeVote!;

    List<VoteData> data = [];

    for (var option in activeVote.options) {
      option.forEach((key, value) {
        data.add(VoteData(key, value));
      });
    }

    return [
      charts.Series<VoteData, String>(
      id:'VoteResult',
      colorFn:(_,pos){
        if(pos!%2==0){
            return charts.MaterialPalette.green.shadeDefault;
        }
        return charts.MaterialPalette.blue.shadeDefault;
      },
      domainFn: (VoteData vote,_)=>vote.option,
      measureFn: (VoteData vote,_)=>vote.total,
      data: data,
      )
    ];
  }
}

class VoteData 
{
  final String option;
  final int total;

  VoteData(this.option, this.total);
}
