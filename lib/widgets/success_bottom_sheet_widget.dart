import 'package:flutter/material.dart';

/*
 @created on : june 3,2025
 @author : Lathamani 
 Description : Custom bottom sheet widget for showing on lead successfull submission
 usage: use showSuccessBottomSheet(arg1, arg2, arg3) method where ever want to show bottom sheet
 arg1: context of that page,
 arg2: header text of bottom sheet 
 arg3: message text of bottom sheet
*/
void showSuccessBottomSheet(
  BuildContext context,
  String headerTxt,
  String message,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder:
        (context) =>
            _AnimatedSuccessContent(headerTxt: headerTxt, message: message),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
  );
}

class _AnimatedSuccessContent extends StatefulWidget {
  final String message;
  final String headerTxt;
  const _AnimatedSuccessContent({
    required this.headerTxt,
    required this.message,
  });

  @override
  State<_AnimatedSuccessContent> createState() =>
      _AnimatedSuccessContentState();
}

class _AnimatedSuccessContentState extends State<_AnimatedSuccessContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 60),
              SizedBox(height: 16),
              Text(
                widget.headerTxt,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
