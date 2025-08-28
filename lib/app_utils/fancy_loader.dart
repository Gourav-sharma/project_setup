import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Enum for loader selection
enum FancyLoaderType {
  neonGlow,
  orbitingPlanets,
  liquidWave,
  multiRings,
  heartbeat,
  blobLoader,
}

/// Wrapper widget for easy switching
class FancyLoader extends StatelessWidget {
  final FancyLoaderType type;
  final double size;
  final Color color;

  const FancyLoader({
    Key? key,
    required this.type,
    this.size = 60,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FancyLoaderType.neonGlow:
        return NeonGlowLoader(size: size, color: color);
      case FancyLoaderType.orbitingPlanets:
        return OrbitingPlanetsLoader(size: size, color: color);
      case FancyLoaderType.liquidWave:
        return LiquidWaveLoader(size: size, color: color);
      case FancyLoaderType.multiRings:
        return MultiRingsLoader(size: size);
      case FancyLoaderType.heartbeat:
        return HeartbeatLoader(size: size, color: color);
      case FancyLoaderType.blobLoader:
        return FunnyBlobLoader();

    }
  }
}


class NeonGlowLoader extends StatefulWidget {
  final double size;
  final Color color;
  const NeonGlowLoader({super.key, required this.size, required this.color});

  @override
  State<NeonGlowLoader> createState() => _NeonGlowLoaderState();
}

class _NeonGlowLoaderState extends State<NeonGlowLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
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
      builder: (_, __) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  widget.color.withOpacity(0.1),
                  widget.color,
                  widget.color.withOpacity(0.1),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.8),
                  blurRadius: 25,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}





/// 🔹 Orbiting Planets Loader
class OrbitingPlanetsLoader extends StatefulWidget {
  final double size;
  final Color color;
  const OrbitingPlanetsLoader(
      {super.key, required this.size, required this.color});

  @override
  State<OrbitingPlanetsLoader> createState() => _OrbitingPlanetsLoaderState();
}

class _OrbitingPlanetsLoaderState extends State<OrbitingPlanetsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 2,
      height: widget.size * 2,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(4, (i) {
              final angle = (_controller.value * 2 * math.pi) + (i * math.pi / 2);
              return Transform.translate(
                offset: Offset(
                  widget.size * math.cos(angle),
                  widget.size * math.sin(angle),
                ),
                child: CircleAvatar(
                  radius: widget.size * 0.15,
                  backgroundColor: Colors.primaries[i % Colors.primaries.length],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

/// 🔹 Liquid Wave Loader
class LiquidWaveLoader extends StatefulWidget {
  final double size;
  final Color color;
  const LiquidWaveLoader({super.key, required this.size, required this.color});

  @override
  State<LiquidWaveLoader> createState() => _LiquidWaveLoaderState();
}

class _LiquidWaveLoaderState extends State<LiquidWaveLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _WavePainter(_controller.value, widget.color),
          );
        },
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final double progress;
  final Color color;
  _WavePainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withOpacity(0.6);
    final path = Path();
    final waveHeight = size.height * 0.2;
    path.moveTo(0, size.height / 2);
    for (double x = 0; x <= size.width; x++) {
      double y = size.height / 2 +
          math.sin((x / size.width * 2 * math.pi) + (progress * 2 * math.pi)) *
              waveHeight;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => true;
}

/// 🔹 Multi Rings Loader


class MultiRingsLoader extends StatefulWidget {
  final double size;
  const MultiRingsLoader({super.key, required this.size});

  @override
  State<MultiRingsLoader> createState() => _MultiRingsLoaderState();
}

class _MultiRingsLoaderState extends State<MultiRingsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 2,
      height: widget.size * 2,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(3, (i) {
              final progress = _controller.value * 2 * math.pi;
              final size = widget.size * (1 + i * 0.6);
              final color = Colors.primaries[i * 4 % Colors.primaries.length];

              return Transform.rotate(
                angle: progress * (i.isEven ? 1.0 : -1.5), // diff speed & dir
                child: CustomPaint(
                  size: Size(size, size),
                  painter: _ArcPainter(
                    color: color,
                    arcLength: 0.7 + i * 0.2, // each ring longer arc
                    strokeWidth: 4,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final Color color;
  final double arcLength; // fraction of circle (0–1)
  final double strokeWidth;

  _ArcPainter({
    required this.color,
    required this.arcLength,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 6);

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // arc length (e.g. 0.8 = 288°)
    final sweep = 2 * math.pi * arcLength;
    canvas.drawArc(rect, 0, sweep, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


/// 🔹 Heartbeat Loader
class HeartbeatLoader extends StatefulWidget {
  final double size;
  final Color color;
  const HeartbeatLoader({super.key, required this.size, required this.color});

  @override
  State<HeartbeatLoader> createState() => _HeartbeatLoaderState();
}

class _HeartbeatLoaderState extends State<HeartbeatLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.8, end: 1.2).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      ),
      child: Icon(Icons.favorite, color: widget.color, size: widget.size),
    );
  }
}


class WaterDropLoader extends StatefulWidget {
  const WaterDropLoader({super.key});

  @override
  State<WaterDropLoader> createState() => _WaterDropLoaderState();
}

class _WaterDropLoaderState extends State<WaterDropLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900, // watery background
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _WaterDropPainter(progress: _controller.value),
          );
        },
      ),
    );
  }
}

class _WaterDropPainter extends CustomPainter {
  final double progress;
  _WaterDropPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    // Draw multiple expanding circles (ripples)
    for (int i = 0; i < 4; i++) {
      double circleProgress = (progress + i * 0.25) % 1.0;
      double radius = circleProgress * size.width * 0.5;
      int alpha = (255 * (1 - circleProgress)).toInt().clamp(0, 255);

      paint.color = Colors.cyanAccent.withAlpha(alpha);

      canvas.drawCircle(center, radius, paint);
    }

    // Draw the "drop" in center
    final dropPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, 10 + math.sin(progress * 2 * math.pi) * 4, dropPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class FunnyBlobLoader extends StatefulWidget {
  final double size;
  final List<Color> colors;

  const FunnyBlobLoader({
    super.key,
    this.size = 80,
    this.colors = const [Colors.purpleAccent, Colors.cyanAccent, Colors.yellowAccent],
  });

  @override
  State<FunnyBlobLoader> createState() => _FunnyBlobLoaderState();
}

class _FunnyBlobLoaderState extends State<FunnyBlobLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(widget.colors.length, (i) {
              final angle = (_controller.value * 2 * math.pi) + (i * 2);
              final dx = math.cos(angle) * (widget.size * 0.4);
              final dy = math.sin(angle) * (widget.size * 0.4);

              return Transform.translate(
                offset: Offset(dx, dy),
                child: _buildBlob(i),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildBlob(int i) {
    final color = widget.colors[i % widget.colors.length];
    return Container(
      width: widget.size * 0.3,
      height: widget.size * 0.3,
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
    );
  }
}






