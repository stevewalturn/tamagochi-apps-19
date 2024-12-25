import 'package:flutter/material.dart';
import 'package:my_app/features/home/home_viewmodel.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/text_style.dart';
import 'package:my_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: heading3Style(context).copyWith(color: Colors.white),
        ),
        backgroundColor: kcPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getResponsiveHorizontalSpaceMedium(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '🎮 Welcome! 🎮',
                        style: heading2Style(context),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpaceSmall,
                      Text(
                        'Ready to start your virtual pet journey?',
                        style: bodyStyle(context),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                onPressed: viewModel.navigateToTamagochi,
                child: const Text(
                  'Start Tamagochi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
