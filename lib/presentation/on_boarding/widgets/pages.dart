import 'package:doctor_h_appointments_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final PageController pagesController;
  final List<PagesModel> pages;
  const Pages({super.key , required this.pagesController , required this.pages});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {},
      controller: pagesController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return SinglePagePresenter(imagePath: pages[index].imagePath, title: pages[index].title, description: pages[index].description);
      },);
  }
}


class SinglePagePresenter extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const SinglePagePresenter({super.key, required this.imagePath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRect(
                child: Image.asset(
                  imagePath,
                  // LOL the most stupid way i know ,, but i am not gonna waste my time on this :)
                  fit: (title == "Doctor H App") ? null : BoxFit.cover,
                ),
              )
            )
        ),
        Padding(
          padding: Constants.paddingForScreen,
          child: Column(
            children: [
              CustomSpace.vertical(),
              Text(title , style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),),
              CustomSpace.vertical(),
              Text(description , style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600 , color: Constants.colorDarkGrey),textAlign: TextAlign.center,),
            ],
          ),
        )
      ],
    );
  }
}
