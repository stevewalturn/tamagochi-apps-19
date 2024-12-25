import 'package:my_app/models/enums/pet_state.dart';

class Pet {
  Pet({
    required this.name,
    this.health = 100,
    this.hunger = 0,
    this.energy = 100,
    this.happiness = 100,
    this.age = 0,
  });

  final String name;
  double health;
  double hunger;
  double energy;
  double happiness;
  int age;

  PetState get state {
    if (health <= 0) return PetState.dead;
    if (health < 30) return PetState.sick;
    if (hunger > 70) return PetState.hungry;
    if (energy < 30) return PetState.tired;
    return PetState.happy;
  }

  void feed() {
    if (state != PetState.dead) {
      hunger = (hunger - 30).clamp(0, 100);
      happiness = (happiness + 10).clamp(0, 100);
    }
  }

  void sleep() {
    if (state != PetState.dead) {
      energy = (energy + 50).clamp(0, 100);
      hunger = (hunger + 10).clamp(0, 100);
    }
  }

  void play() {
    if (state != PetState.dead) {
      happiness = (happiness + 20).clamp(0, 100);
      energy = (energy - 20).clamp(0, 100);
      hunger = (hunger + 20).clamp(0, 100);
    }
  }

  void heal() {
    if (state != PetState.dead) {
      health = (health + 40).clamp(0, 100);
      energy = (energy - 10).clamp(0, 100);
    }
  }

  void update() {
    if (state != PetState.dead) {
      hunger = (hunger + 0.5).clamp(0, 100);
      energy = (energy - 0.3).clamp(0, 100);
      happiness = (happiness - 0.2).clamp(0, 100);

      if (hunger > 80 || energy < 20) {
        health = (health - 1).clamp(0, 100);
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'health': health,
      'hunger': hunger,
      'energy': energy,
      'happiness': happiness,
      'age': age,
    };
  }

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      name: json['name'] as String,
      health: (json['health'] as num).toDouble(),
      hunger: (json['hunger'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      happiness: (json['happiness'] as num).toDouble(),
      age: json['age'] as int,
    );
  }
}
