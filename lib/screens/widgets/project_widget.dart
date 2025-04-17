import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart' show Project;
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🔁 نموذج المشروع

// 🔧 الخطوط
const kSectionTitleText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const kSubTitleText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

// 📦 الـ Widget الرئيسي
class ProjectWidget extends StatefulWidget {
  final Project projectData;
  const ProjectWidget({super.key, required this.projectData});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInBack),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _AnimatedCard(
        animation: _fadeAnimation,
        slideAnimation: _slideAnimation,
        child: _ProjectCard(
          projectData: widget.projectData,
          width: double.infinity,
          height: null,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          isMobile: true,
        ),
      ),
      tablet: (context) => _AnimatedCard(
        animation: _fadeAnimation,
        slideAnimation: _slideAnimation,
        child: _ProjectCard(
          projectData: widget.projectData,
          width: MediaQuery.of(context).size.width * 0.6,
          height: 300,
        ),
      ),
      desktop: (context) => _AnimatedCard(
        animation: _fadeAnimation,
        slideAnimation: _slideAnimation,
        child: _ProjectCard(
          projectData: widget.projectData,
          width: MediaQuery.of(context).size.width * 0.4,
          height: 300,
        ),
      ),
    );
  }
}

// 🎞️ Animation Wrapper
class _AnimatedCard extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Animation<Offset> slideAnimation;

  const _AnimatedCard({
    required this.child,
    required this.animation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }
}

// ♻️ Widget الكارت
class _ProjectCard extends StatelessWidget {
  final Project projectData;
  final double width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool isMobile;

  const _ProjectCard({
    required this.projectData,
    required this.width,
    this.height,
    this.padding,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: width,
        height: height,
        constraints: isMobile
            ? const BoxConstraints(minHeight: 250, maxHeight: 350)
            : null,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(projectData.imagePath, fit: BoxFit.cover),
              Container(color: Colors.black.withOpacity(0.4)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.build, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            projectData.name,
                            style:
                                kSectionTitleText.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: isMobile
                            ? const BouncingScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        child: Text(
                          projectData.description,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(projectData.link);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                        ),
                        child: Text(
                          "View Project",
                          style: kSubTitleText.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
