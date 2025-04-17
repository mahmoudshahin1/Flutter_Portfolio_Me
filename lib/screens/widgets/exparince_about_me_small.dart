import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ExparinceAboutMeSmall extends StatelessWidget {
  const ExparinceAboutMeSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Experience",
              style: kSectionTitleText,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(aboutWorkExperience),
            const Divider(),
            Text("About Me", style: kSectionTitleText),
            const SizedBox(
              height: 10,
            ),
            Text(aboutMeSummary),
          ],
        ),
        Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: kSubTitleText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            location,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Website",
                        style: kSubTitleText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(website),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.launch,
                            size: 16,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Portfolio",
                        style: kSubTitleText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(portfolio),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.launch,
                            size: 16,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: kSubTitleText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: contactEmail,
                          );
                          await launchUrl(emailLaunchUri);
                        },
                        child: Row(
                          children: [
                            Text(email),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.launch,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            )
          ],
        ),
      ],
    );
  }
}
