import 'package:votingapp/models/vote.dart';
import 'package:uuid/uuid.dart';

List<Vote> getVoteList() {
  List<Vote> voteList =  [];

  voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'President',
        options: [
          {'Shasank': 70},
          {'Sonal': 30},
          {'Mayank': 20},
          {'Nikita': 50},
        ]),
  );

  voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'General Secretary I',
        options: [
          {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );

  voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'General Secretary II',
        options: [
         {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );

    voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'Cultural Secretary ',
        options: [
         {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );

    voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'Science and Technology Secretary ',
        options: [
         {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );

    voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'Academic Affairs Secretary',
        options: [
          {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );

    voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'Mess Secretary ',
        options: [
          {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );

    voteList.add(
    Vote(
        voteId: Uuid().v4(),
        voteTitle: 'Sports Secretary',
        options: [
        {'candidate 1': 10},
          {'candidate 2': 40},
          {'candidate 3': 70},
        ]),
  );
  return voteList;
}
