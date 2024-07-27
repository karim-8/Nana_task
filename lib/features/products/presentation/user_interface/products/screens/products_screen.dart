import 'package:flutter/material.dart';

import 'package:nana_mobile_task/features/products/presentation/user_interface/products/widgets/main_section_widget.dart';
import 'package:nana_mobile_task/features/products/presentation/user_interface/products/widgets/most_use_widget.dart';
import 'package:nana_mobile_task/features/products/presentation/user_interface/products/widgets/recommendation_widget.dart';
import '/core/utils/resources/resources_exporter.dart';
import '/core/utils/shared_widgets/main_scaffold.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Scaffold(
        appBar: AppBar(
          key: const Key("appBarKey"),
          backgroundColor: ColorManager.lightPink,
          centerTitle: true,
          title: Text(
            StringsManager.products,
            style: TextStyleManager.screenTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: ColorManager.blackColor,
            child: const Column(
              children: [
                /// Main Section
                MainSectionWidget(),
                // MostUse Section
                MostUseWidget(),
                // Recommende Section
                RecommendationWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
