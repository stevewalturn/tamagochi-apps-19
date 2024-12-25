enum PetState {
  happy,
  hungry,
  tired,
  sick,
  dead;

  String get displayName {
    switch (this) {
      case PetState.happy:
        return 'Happy';
      case PetState.hungry:
        return 'Hungry';
      case PetState.tired:
        return 'Tired';
      case PetState.sick:
        return 'Sick';
      case PetState.dead:
        return 'Dead';
    }
  }

  String get emoji {
    switch (this) {
      case PetState.happy:
        return '😊';
      case PetState.hungry:
        return '🍽';
      case PetState.tired:
        return '😴';
      case PetState.sick:
        return '🤒';
      case PetState.dead:
        return '💀';
    }
  }
}
