import 'package:flutter/material.dart';

/// ✅ Widget جاهز فيه Fade + Slide animation تقدر تستخدمه في أي مكان
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offsetY;
  final Curve curve;

  const FadeSlideIn({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.offsetY = 60,
    this.curve = Curves.easeOut,
  }) : super(key: key);

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, widget.offsetY / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }
}

/// 🔹 كده تستخدمه ببساطة في أي شاشة:
/// FadeSlideIn(child: Text("Hello!"))
