import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:my_app/models/pet.dart';

class PetService implements InitializableDependency {
  static const String _petKey = 'pet_data';
  Pet? _currentPet;
  Timer? _updateTimer;

  Pet? get currentPet => _currentPet;

  @override
  Future<void> init() async {
    await _loadPet();
    _startUpdateTimer();
  }

  Future<void> createPet(String name) async {
    if (_currentPet != null) {
      throw Exception('You already have a pet! Take care of it first.');
    }

    _currentPet = Pet(name: name);
    await _savePet();
    _startUpdateTimer();
  }

  void feedPet() {
    _ensurePetExists();
    _currentPet!.feed();
    _savePet();
  }

  void healPet() {
    _ensurePetExists();
    _currentPet!.heal();
    _savePet();
  }

  void playWithPet() {
    _ensurePetExists();
    _currentPet!.play();
    _savePet();
  }

  void putPetToSleep() {
    _ensurePetExists();
    _currentPet!.sleep();
    _savePet();
  }

  Future<void> _savePet() async {
    if (_currentPet == null) return;

    final prefs = await SharedPreferences.getInstance();
    final petJson = jsonEncode(_currentPet!.toJson());
    await prefs.setString(_petKey, petJson);
  }

  Future<void> _loadPet() async {
    final prefs = await SharedPreferences.getInstance();
    final petJson = prefs.getString(_petKey);

    if (petJson != null) {
      try {
        final petMap = jsonDecode(petJson) as Map<String, dynamic>;
        _currentPet = Pet.fromJson(petMap);
      } catch (e) {
        throw Exception(
            'Failed to load pet data. Please try creating a new pet.');
      }
    }
  }

  void _startUpdateTimer() {
    _updateTimer?.cancel();
    _updateTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        if (_currentPet != null) {
          _currentPet!.update();
          _savePet();
        }
      },
    );
  }

  void _ensurePetExists() {
    if (_currentPet == null) {
      throw Exception('You need to create a pet first!');
    }
  }

  void dispose() {
    _updateTimer?.cancel();
  }
}
