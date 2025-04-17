import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ExprinceAboutMeLarg extends StatelessWidget {
  const ExprinceAboutMeLarg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: Column(
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
        ),
        SizedBox(
          width: context.screenConstraint().width * .1,
        ),
        Flexible(
          flex: 2,
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Location",
                          style: kSubTitleText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ],
    );
  }
}
