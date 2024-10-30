import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [UserNameAndWelcoming(), SearchAndFavorites()],
      ),
    );
  }
}

class UserNameAndWelcoming extends StatelessWidget {
  const UserNameAndWelcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              (getIt<UserBusinessInterface>()
                  .userPreferences!
                  .userName!
                  .substring(0, 2)
                  .toUpperCase()),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          CustomSpace.horizontal(space: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back !",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400, color: Constants.colorGrey),
                ),
                Text(
                  getIt<UserBusinessInterface>().userPreferences!.userName!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchAndFavorites extends StatelessWidget {
  const SearchAndFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.search,
          size: 30,
        ),
        CustomSpace.horizontal(space: 10),
        const Icon(
          Icons.favorite_border,
          size: 30,
        ),
      ],
    );
  }
}
