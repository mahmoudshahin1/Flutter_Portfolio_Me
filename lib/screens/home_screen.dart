import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/screens/widgets/anmaited_observision.dart';
import 'package:portfolio/screens/widgets/exparince_about_me_small.dart';
import 'package:portfolio/screens/widgets/exprince_about_me_larg.dart';
import 'package:portfolio/screens/widgets/image_profile.dart' show ImageProfile;
import 'package:portfolio/screens/widgets/info_data.dart' show InfoData;
import 'package:portfolio/screens/widgets/project_widget.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.circle_sharp,
              size: 12,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "SHAHIN PORTFOLIO  ",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        // foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(child: ImageProfile()),
            const FadeSlideIn(
                duration: Duration(seconds: 4), child: InfoData()),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: context.screenConstraint().width * 0.8,
                child: context.screenConstraint().width > 1200
                    ? const FadeSlideIn(
                        duration: Duration(seconds: 5),
                        child: ExprinceAboutMeLarg())
                    : const FadeSlideIn(
                        duration: Duration(seconds: 5),
                        child: ExparinceAboutMeSmall()),
              ),
            ),
            SizedBox(
              height: context.screenConstraint().height * 0.05,
            ),
            FadeSlideIn(
              duration: Duration(seconds: 6),
              child: Center(
                child: SizedBox(
                    width: context.screenConstraint().width * 0.8,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2),
                        itemCount: projectList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectWidget(
                            projectData: projectList[index],
                          );
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
