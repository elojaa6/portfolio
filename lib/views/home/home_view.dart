import 'package:flutter/material.dart';
import 'package:portfolio/widgets/call_to_action/call_to_action.dart';
import 'package:portfolio/widgets/centered_view/centered_view.dart';
import 'package:portfolio/widgets/info/info.dart';
import 'package:portfolio/widgets/navigation_bar/top_bar_contents.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CenteredView(
          child: Stack(
            children: [
              Center(
                child: Image(
                  image: AssetImage("assets/peep-w.png"),
                ),
              ),
              Column(children: [
                TopBarContents(),
                Expanded(
                    child: Row(
                  children: [
                    Info(),
                    SizedBox(
                      width: 150,
                    ),
                    Expanded(
                      child: Center(
                        child: CallToAction("Let's talk!"),
                      ),
                    ),
                  ],
                ))
              ] // Asumiendo que este widget no ocupa toda la pantalla
                  ),
              Positioned(
                bottom:
                    0, // Esto posiciona _FloatingTextAnimation en la parte inferior del Stack.
                left: 0,
                right: 0,
                child: _FloatingTextAnimation(text: " Elvis Loja"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingTextAnimation extends StatefulWidget {
  final String text;

  const _FloatingTextAnimation({Key? key, required this.text})
      : super(key: key);

  @override
  _FloatingTextAnimationState createState() => _FloatingTextAnimationState();
}

class _FloatingTextAnimationState extends State<_FloatingTextAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: false);

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _translateAnimation = Tween<double>(begin: -100.0, end: 90.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: Offset(
                _translateAnimation.value *
                    MediaQuery.of(context).size.width /
                    100,
                0),
            child: Text(
              widget.text,
              style:
                  const TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
