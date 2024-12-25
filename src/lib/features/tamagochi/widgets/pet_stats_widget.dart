import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/ui_helpers.dart';

class PetStatsWidget extends StatelessWidget {
  final double health;
  final double hunger;
  final double energy;
  final double happiness;

  const PetStatsWidget({
    required this.health,
    required this.hunger,
    required this.energy,
    required this.happiness,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatBar(
              context: context,
              label: 'Health',
              value: health,
              color: Colors.red,
              icon: Icons.favorite,
            ),
            verticalSpaceSmall,
            _buildStatBar(
              context: context,
              label: 'Hunger',
              value: hunger,
              color: Colors.orange,
              icon: Icons.restaurant,
            ),
            verticalSpaceSmall,
            _buildStatBar(
              context: context,
              label: 'Energy',
              value: energy,
              color: Colors.blue,
              icon: Icons.battery_charging_full,
            ),
            verticalSpaceSmall,
            _buildStatBar(
              context: context,
              label: 'Happiness',
              value: happiness,
              color: Colors.green,
              icon: Icons.mood,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBar({
    required BuildContext context,
    required String label,
    required double value,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 16),
            horizontalSpaceTiny,
            Text(
              label,
              style: TextStyle(
                color: kcPrimaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        verticalSpaceTiny,
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
