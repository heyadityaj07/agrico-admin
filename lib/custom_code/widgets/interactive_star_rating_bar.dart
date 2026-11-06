// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

// --------------------------------------------------------------------------
// 1. Color and Gradient Star Widget
// --------------------------------------------------------------------------

// The highlight color for the extreme bright spots (like sunlight reflection)
const Color highlightColor =
    Color(0xFFFFF0B3); // A very light, almost white yellow

// The mid-tone bright yellow/gold
const Color midToneColor = Color(0xFFFDC700);

// The shadow color for depth
const Color shadowColor = Color(0xFFFF8C00);

/// A custom widget to apply a linear gradient to the star icon with three colors.
class GradientStar extends StatelessWidget {
  final double size;

  const GradientStar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        // Define the three colors and their positions (stops)
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            shadowColor,
            highlightColor,
            shadowColor,
          ],
          // Adjusted stops for centered highlight
          stops: [0.1, 0.6, 0.9],
        ).createShader(bounds);
      },
      child: Icon(
        Icons.star,
        size: size,
        color: Colors.white,
      ),
    );
  }
}

// --------------------------------------------------------------------------
// 2. Star Clipper for Fractional Fill (Half Stars)
// --------------------------------------------------------------------------

/// Custom Clipper to cut the star icon horizontally based on the fill percentage.
class _StarClipper extends CustomClipper<Rect> {
  final double fill;

  _StarClipper({required this.fill});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0.0,
      0.0,
      size.width * fill,
      size.height,
    );
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) => oldClipper.fill != fill;
}

/// A widget that renders a star with a fractional fill (e.g., 0.5 for half a star).
class StarWidget extends StatelessWidget {
  final double fill; // 0.0 to 1.0
  final double size;
  final Color outlinedColor;

  const StarWidget({
    Key? key,
    required this.fill,
    required this.size,
    required this.outlinedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ⭐️ PERFORMANCE FIX: RepaintBoundary isolates the rendering of this star.
    return RepaintBoundary(
      child: buildStarContent(context),
    );
  }

  Widget buildStarContent(BuildContext context) {
    // 1. Full Star (Gradient)
    final Widget filledStar = GradientStar(size: size);

    // 2. Outlined Star
    final Widget outlinedStar = Icon(
      Icons.star_border,
      color: outlinedColor,
      size: size,
    );

    // 3. Determine base star content
    Widget starContent;
    if (fill >= 1.0) {
      starContent = filledStar;
    } else if (fill <= 0.0) {
      starContent = outlinedStar;
    } else {
      // Half Star (Fractional Fill > 0 and < 1)
      starContent = Stack(
        children: <Widget>[
          outlinedStar,
          ClipRect(
            clipper: _StarClipper(fill: fill),
            child: filledStar,
          ),
        ],
      );
    }

    // 4. Apply elevation (BoxShadow) effect if the star is filled
    if (fill > 0.0) {
      // Use Container with BoxDecoration to simulate elevation
      return starContent;
    }

    // Return the standard outlined star if not filled
    return starContent;
  }
}

// --------------------------------------------------------------------------
// 3. Interactive Star Rating Bar (FlutterFlow Custom Widget)
// --------------------------------------------------------------------------

class InteractiveStarRatingBar extends StatefulWidget {
  const InteractiveStarRatingBar({
    super.key,
    this.width,
    this.height,
    required this.rating, // 👉 ONLY ONE EXTERNAL PARAM
  });

  final double? width;
  final double? height;

  /// Rating value passed from FlutterFlow (e.g., 3.5)
  final double rating;

  @override
  State<InteractiveStarRatingBar> createState() =>
      _InteractiveStarRatingBarState();
}

class _InteractiveStarRatingBarState extends State<InteractiveStarRatingBar> {
  // Internal config (NOT FlutterFlow params)
  static const int _totalStars = 5;
  static const double _starSize = 35.0;

  late double _rating;

  @override
  void initState() {
    super.initState();
    // Initialize from passed rating, clamped between 0 and totalStars
    _rating = widget.rating.clamp(0.0, _totalStars.toDouble());
  }

  // Method to update the rating when the user taps (still interactive)
  void _handleTap(double newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkBackground =
        Theme.of(context).brightness == Brightness.dark;
    final Color outlinedStarColor =
        isDarkBackground ? Colors.white70 : Colors.black54;
    final Color textColor = isDarkBackground ? Colors.white : Colors.black;

    List<Widget> stars = List.generate(_totalStars, (index) {
      final int starIndex = index + 1;
      double fill = 0.0;

      if (starIndex <= _rating) {
        fill = 1.0;
      } else if (starIndex > _rating && starIndex - 1 < _rating) {
        fill = _rating - (starIndex - 1);
      }

      // We wrap the StarWidget in GestureDetector for interactivity
      return StarWidget(
        fill: fill,
        size: _starSize,
        outlinedColor: outlinedStarColor,
      );
    });

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The rating number (e.g., '3.5')
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              _rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: _starSize * 0.9,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
          ),
          ...stars,
        ],
      ),
    );
  }
}
