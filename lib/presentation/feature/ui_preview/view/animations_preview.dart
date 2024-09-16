import 'package:flutter/material.dart';
import 'package:hack_yeah_2k24/presentation/common/animations/animations.dart';
import 'package:hack_yeah_2k24/presentation/common/components/card.dart';
import 'package:hack_yeah_2k24/presentation/common/components/text.dart';
import 'package:hack_yeah_2k24/presentation/theme/theme_helpers.dart';

class AnimationsPreview extends StatefulWidget {
  const AnimationsPreview({super.key});

  @override
  State<AnimationsPreview> createState() => _AnimationsPreviewState();
}

class _AnimationsPreviewState extends State<AnimationsPreview>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  );

  @override
  void initState() {
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => UiCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UiText.titleMedium('Animation Preview'),
              const SizedBox(height: 16),
              UiText.titleSmall('Bounce In'),
              SizedBox(
                height: 16,
                width: 100,
                child: _AnimationPreview(
                  animation: CurvedAnimation(
                    parent: animationController,
                    curve: UiCurves.bounceIn,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              UiText.titleSmall('Bounce Out'),
              SizedBox(
                height: 16,
                width: 100,
                child: _AnimationPreview(
                  animation: CurvedAnimation(
                    parent: animationController,
                    curve: UiCurves.bounceOut,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              UiText.titleSmall('Decelerate'),
              SizedBox(
                height: 16,
                width: 100,
                child: _AnimationPreview(
                  animation: CurvedAnimation(
                    parent: animationController,
                    curve: UiCurves.decelerate,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
}

class _AnimationPreview extends StatelessWidget {
  const _AnimationPreview({
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _AnimationPainter(
        animation: animation,
        trackColor: context.colorPalette.primary,
        thumbColor: context.colorPalette.primaryForeground,
        thumbOutlineColor: context.colorPalette.primary,
      ),
      child: const SizedBox(height: 8),
    );
  }
}

class _AnimationPainter extends CustomPainter {
  _AnimationPainter({
    required this.animation,
    required this.trackColor,
    required this.thumbColor,
    required this.thumbOutlineColor,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color trackColor;
  final Color thumbColor;
  final Color thumbOutlineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.fill;

    final thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final thumbOutlinePaint = Paint()
      ..color = thumbOutlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final thumbRadius = size.height / 3;
    final trackRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final thumbRect = Rect.fromCircle(
      center: Offset(
        animation.value * (size.width - thumbRadius * 2) + thumbRadius,
        size.height / 2,
      ),
      radius: thumbRadius,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, const Radius.circular(100)),
      trackPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(thumbRect, Radius.circular(thumbRadius)),
      thumbPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(thumbRect, Radius.circular(thumbRadius)),
      thumbOutlinePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
