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
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.black,
          child: Text(
            "MH",
            style: TextStyle(color: Colors.white),
          ),
        ),
        CustomSpace.horizontal(space: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back !",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400, color: Constants.colorGrey)),
            const Text("Andrew Smith")
          ],
        )
      ],
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
