import 'package:flutter/material.dart';
import 'package:my_app/features/tamagochi/tamagochi_repository.dart';
import 'package:my_app/models/pet.dart';
import 'package:stacked/stacked.dart';

class TamagochiViewModel extends BaseViewModel {
  final _repository = TamagochiRepository();
  final nameController = TextEditingController();

  Pet? get pet => _repository.currentPet;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> createPet() async {
    try {
      setBusy(true);
      await _repository.createPet(nameController.text);
      notifyListeners();
    } catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }

  void feedPet() {
    try {
      _repository.feedPet();
      notifyListeners();
    } catch (e) {
      setError(e);
    }
  }

  void healPet() {
    try {
      _repository.healPet();
      notifyListeners();
    } catch (e) {
      setError(e);
    }
  }

  void playWithPet() {
    try {
      _repository.playWithPet();
      notifyListeners();
    } catch (e) {
      setError(e);
    }
  }

  void putPetToSleep() {
    try {
      _repository.putPetToSleep();
      notifyListeners();
    } catch (e) {
      setError(e);
    }
  }
}
