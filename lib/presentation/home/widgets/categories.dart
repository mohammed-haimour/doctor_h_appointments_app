import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/generated/assets.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

final List<Map<String, Object>> items = [
  {'image': Assets.imageHomeHeart, 'label': 'Heart'},
  {'image': Assets.imageHomeDental, 'label': 'Dental'},
  {'image': Assets.imageHomeKidney, 'label': 'Kidney'},
  {'image': Assets.imageHomeStomach, 'label': 'Stomach'},
  {'image': Assets.imageHomeLung, 'label': 'Lung'},
  {'image': Assets.imageHomeBrain, 'label': 'Brain'},
  {'image': Assets.imageHomeMental, 'label': 'Mental'},
  {'image': Assets.imageHomeLiver, 'label': 'Liver'},
];

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          CustomSpace.vertical(space: 10),
          Padding(
            padding: Constants.paddingMedium,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  image: items[index]['image'] as String,
                  label: items[index]['label'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String label;

  const CategoryCard({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: getIt<UserBusinessInterface>().userPreferences!.theme! ==
                ThemeMode.light
            ? Constants.colorWhiteBlueVeryLight
            : Constants.colorLightBlack,
        borderRadius: Constants.radiusLarge,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 30),
          CustomSpace.vertical(space: 5),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
