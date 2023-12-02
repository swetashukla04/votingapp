import 'package:flutter/material.dart';
import 'package:votingapp/models/vote.dart';
import 'package:votingapp/services/service.dart';

class VoteState with ChangeNotifier {
  List<Vote> _voteList = [];
  Vote? _activeVote;
  String? _selectedOptionInActiveVote;

  Future<void> loadVoteList() async {
    _voteList = getVoteList();
    notifyListeners();
  }

  void clearState() {
    _activeVote = null;
    _selectedOptionInActiveVote = null;
    notifyListeners();
  }

  List<Vote> get voteList => _voteList;
  Vote? get activeVote => _activeVote;
  String? get selectedOptionInActiveVote => _selectedOptionInActiveVote;

  set activeVote(Vote? newValue) {
    _activeVote = newValue;
    notifyListeners();
  }

  set selectedOptionInActiveVote(String? newValue) {
    _selectedOptionInActiveVote = newValue;
    notifyListeners();
  }
}
