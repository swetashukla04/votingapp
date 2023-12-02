class Vote{
   String voteId;
   String voteTitle;
   List<Map<String,int>> options;

  Vote({required this.voteId,required this.voteTitle,required this.options});
  }

  class Voter{
    late String uid;
    late String voteId;
    late int markedVoterOption;

  }