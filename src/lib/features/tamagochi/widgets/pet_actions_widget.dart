import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/models/enums/pet_state.dart';

class PetActionsWidget extends StatelessWidget {
  final PetState petState;
  final VoidCallback onFeed;
  final VoidCallback onHeal;
  final VoidCallback onPlay;
  final VoidCallback onSleep;

  const PetActionsWidget({
    required this.petState,
    required this.onFeed,
    required this.onHeal,
    required this.onPlay,
    required this.onSleep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAlive = petState != PetState.dead;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kcPrimaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _ActionButton(
                  icon: Icons.restaurant,
                  label: 'Feed',
                  color: Colors.orange,
                  onTap: isAlive ? onFeed : null,
                ),
                _ActionButton(
                  icon: Icons.medical_services,
                  label: 'Heal',
                  color: Colors.red,
                  onTap: isAlive ? onHeal : null,
                ),
                _ActionButton(
                  icon: Icons.sports_esports,
                  label: 'Play',
                  color: Colors.green,
                  onTap: isAlive ? onPlay : null,
                ),
                _ActionButton(
                  icon: Icons.bedtime,
                  label: 'Sleep',
                  color: Colors.blue,
                  onTap: isAlive ? onSleep : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: onTap != null
                      ? color.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: onTap != null ? color : Colors.grey,
                  size: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: onTap != null ? kcPrimaryTextColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
