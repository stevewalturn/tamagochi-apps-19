import 'package:flutter/material.dart';
import 'package:my_app/models/enums/pet_state.dart';
import 'package:my_app/ui/common/app_colors.dart';

class PetAvatarWidget extends StatelessWidget {
  final PetState petState;
  final String petName;
  final double size;

  const PetAvatarWidget({
    required this.petState,
    required this.petName,
    this.size = 120,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        shape: BoxShape.circle,
        border: Border.all(
          color: kcPrimaryColor,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              petState.emoji,
              style: TextStyle(fontSize: size * 0.4),
            ),
            if (petState != PetState.dead)
              Text(
                petName,
                style: TextStyle(
                  fontSize: size * 0.15,
                  fontWeight: FontWeight.bold,
                  color: kcPrimaryTextColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (petState) {
      case PetState.happy:
        return Colors.green.withOpacity(0.2);
      case PetState.hungry:
        return Colors.orange.withOpacity(0.2);
      case PetState.tired:
        return Colors.blue.withOpacity(0.2);
      case PetState.sick:
        return Colors.red.withOpacity(0.2);
      case PetState.dead:
        return Colors.grey.withOpacity(0.2);
    }
  }
}
