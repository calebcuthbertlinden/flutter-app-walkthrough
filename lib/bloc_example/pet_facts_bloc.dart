import 'package:flutter_app_walkthrough/network/pet_facts_repository.dart';
import 'package:rxdart/rxdart.dart';

class PetListBloc {
  final PetFactsRepository _repository = PetFactsRepository();
  final BehaviorSubject<List<dynamic>> _subject = BehaviorSubject<List<dynamic>>();

  getPetList() async {
    List<dynamic> response =
        await _repository.getListFromApi();
    _subject.sink.add(response);
  }

  clearPetList() {
    _subject.sink.add(<dynamic>[]);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<dynamic>> get subject => _subject;
}

final bloc = PetListBloc();
