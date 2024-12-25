import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/pet.dart';
import 'package:my_app/services/pet_service.dart';

class TamagochiRepository {
  final _petService = locator<PetService>();

  Pet? get currentPet => _petService.currentPet;

  Future<void> createPet(String name) async {
    if (name.trim().isEmpty) {
      throw Exception('Pet name cannot be empty');
    }
    await _petService.createPet(name);
  }

  void feedPet() {
    _petService.feedPet();
  }

  void healPet() {
    _petService.healPet();
  }

  void playWithPet() {
    _petService.playWithPet();
  }

  void putPetToSleep() {
    _petService.putPetToSleep();
  }
}
