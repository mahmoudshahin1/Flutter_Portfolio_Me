import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';

//Update with colors of your choice for dp background gradient
Color kGradient1 = Colors.purple;
Color kGradient2 = Colors.pinkAccent;

String imagePath = "";
String profileimagePath = 'assets/images/profile.jpeg';

//String data to modify
String name = "Mahmoud--Shahin";
String username = "Flutter Developer";

//Link to resume on Google Drive
String resumeLink =
    "https://drive.google.com/file/d/1oNjU_dZbPRaUHz3jccpAgG8CMOKuHd24/view?usp=sharing";

//Contact Email
String contactEmail = "mahmoudshahaen@gmail.com";

String aboutWorkExperience = '''
I’m a fresh graduate and a dedicated Flutter developer with a real passion for building mobile apps that actually make a difference. I had the chance to join an advanced Flutter training with NTI for two months, where I learned a lot beyond the basicsworking- with clean architecture, advanced state management, and building real, production-level features.

Along the way, I also worked on two freelance projects, where I helped turn client ideas into fully functional mobile apps. Through those experiences, I focused on writing clean, efficient code and creating smooth user experiences. The results helped improve their business performance by up to 80%, which felt like a big win—not just for them, but for me too. I'm always excited to keep learning and building apps that solve real problems.

 
''';

String aboutMeSummary = '''
Mahmoud Shahin is an experienced Mobile Application Developer with a Bachelor's inComputer Science and a strong focus on Flutter development. Skilled in handling large-scale projects, with excellent communication and teamwork abilities. Passionate 
about creating efficient, user-friendly mobile applications and delivering high-quality solutions.
''';

String location = "Egypt, Cairo";
String website = "adityathakur.in";
String portfolio = "adityathakurxd";
String email = contactEmail;

List<Project> projectList = [
  Project(
      name: "Shades",
      description:
          "Winner IEEE Mandi 'Go Online' Challenge at Electrothon, NIT Hamirpur.",
      link: "https://github.com/adityathakurxd/shades",
      imagePath: 'assets/images/shahin.jpg'),
  Project(
      imagePath: 'assets/images/2.png',
      name: "Fiasco",
      description:
          "Fiasco is one stop solution to help you manage Family expenses in one place!",
      link: "https://github.com/adityathakurxd/fiasco"),
  Project(
      imagePath: 'assets/images/profile.jpeg',
      name: "Fiasco",
      description:
          "Fiasco is one stop solution to help you manage Family expenses in one place!",
      link: "https://github.com/adityathakurxd/fiasco"),
  Project(
      imagePath: 'assets/images/profile.jpeg',
      name: "Flutter Portfolio",
      description: "A template for Portfolio",
      link: "https://github.com/adityathakurxd/flutter-portfolio")
];
