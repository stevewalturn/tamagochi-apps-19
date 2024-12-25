import 'package:flutter/material.dart';
import 'package:my_app/features/tamagochi/tamagochi_viewmodel.dart';
import 'package:my_app/features/tamagochi/widgets/pet_actions_widget.dart';
import 'package:my_app/features/tamagochi/widgets/pet_avatar_widget.dart';
import 'package:my_app/features/tamagochi/widgets/pet_stats_widget.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class TamagochiView extends StackedView<TamagochiViewModel> {
  const TamagochiView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TamagochiViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet'),
        backgroundColor: kcPrimaryColor,
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      viewModel.modelError.toString(),
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : viewModel.pet == null
                  ? _CreatePetView(viewModel: viewModel)
                  : _PetView(viewModel: viewModel),
    );
  }

  @override
  TamagochiViewModel viewModelBuilder(BuildContext context) =>
      TamagochiViewModel();
}

class _CreatePetView extends StatelessWidget {
  final TamagochiViewModel viewModel;

  const _CreatePetView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Create Your Pet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceMedium,
          TextField(
            controller: viewModel.nameController,
            decoration: const InputDecoration(
              labelText: 'Pet Name',
              border: OutlineInputBorder(),
            ),
          ),
          verticalSpaceMedium,
          ElevatedButton(
            onPressed: viewModel.createPet,
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            child: const Text('Create Pet'),
          ),
        ],
      ),
    );
  }
}

class _PetView extends StatelessWidget {
  final TamagochiViewModel viewModel;

  const _PetView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PetAvatarWidget(
            petState: viewModel.pet!.state,
            petName: viewModel.pet!.name,
          ),
          verticalSpaceMedium,
          PetStatsWidget(
            health: viewModel.pet!.health,
            hunger: viewModel.pet!.hunger,
            energy: viewModel.pet!.energy,
            happiness: viewModel.pet!.happiness,
          ),
          verticalSpaceMedium,
          PetActionsWidget(
            petState: viewModel.pet!.state,
            onFeed: viewModel.feedPet,
            onHeal: viewModel.healPet,
            onPlay: viewModel.playWithPet,
            onSleep: viewModel.putPetToSleep,
          ),
        ],
      ),
    );
  }
}
