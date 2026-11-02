
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  final int age;
  final String gender;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.age,
    required this.gender,
  });

  String get category {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal Weight';
    if (bmi < 30) return 'Overweight';
    return 'Obesity';
  }

  Color get resultColor {
    if (bmi < 18.5) return const Color(0xFFE5A13A);
    if (bmi < 25) return const Color(0xFF299D75);
    if (bmi < 30) return const Color(0xFFE58B43);
    return const Color(0xFFE15B68);
  }

  String get interpretation {
    if (bmi < 18.5) {
      return 'Your BMI is below the standard adult reference range.';
    } else if (bmi < 25) {
      return 'Your BMI is within the standard healthy adult reference range.';
    } else if (bmi < 30) {
      return 'Your BMI is above the standard healthy adult reference range.';
    } else {
      return 'Your BMI falls in the adult obesity category.';
    }
  }

  double get indicatorValue =>
      ((bmi - 10) / 30).clamp(0.0, 1.0).toDouble();

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF7054C8);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FB),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF8066D9),
                          Color(0xFF5740A7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 25,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'HEALTH TRACKER',
                              style: TextStyle(
                                color: Colors.white70,
                                letterSpacing: 2,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Your BMI Report',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Your body mass index summary',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Main BMI Card
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: purple.withValues(alpha: 0.07),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'YOUR BODY MASS INDEX',
                          style: TextStyle(
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Animated BMI Indicator
                        TweenAnimationBuilder<double>(
                          tween: Tween(
                            begin: 0,
                            end: indicatorValue,
                          ),
                          duration: const Duration(seconds: 1),
                          builder: (context, value, child) {
                            return SizedBox(
                              width: 190,
                              height: 190,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: CircularProgressIndicator(
                                      value: value,
                                      strokeWidth: 15,
                                      strokeCap: StrokeCap.round,
                                      backgroundColor:
                                          const Color(0xFFEDEAF5),
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                        resultColor,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        bmi.toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontSize: 47,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF302A42),
                                        ),
                                      ),
                                      const Text(
                                        'kg/m²',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 24),

                        // BMI Category
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: resultColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: resultColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF777384),
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Personal Details
                  const Text(
                    'Your Details',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF302A42),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      Expanded(
                        child: detailCard(
                          Icons.person_outline,
                          'Gender',
                          gender,
                        ),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: detailCard(
                          Icons.cake_outlined,
                          'Age',
                          '$age years',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // BMI Reference
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'BMI Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF302A42),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Standard adult reference ranges',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: [
                            categoryIndicator(
                              'Underweight',
                              '< 18.5',
                              const Color(0xFFE5A13A),
                            ),
                            categoryIndicator(
                              'Normal',
                              '18.5–24.9',
                              const Color(0xFF299D75),
                            ),
                          ],
                        ),

                        const SizedBox(height: 17),

                        Row(
                          children: [
                            categoryIndicator(
                              'Overweight',
                              '25–29.9',
                              const Color(0xFFE58B43),
                            ),
                            categoryIndicator(
                              'Obesity',
                              '30+',
                              const Color(0xFFE15B68),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Disclaimer
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FA),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: purple,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'BMI is a screening measure, not a medical diagnosis. '
                            'Results should be interpreted alongside other health factors.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF62577D),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Recalculate Button
                  SizedBox(
                    height: 58,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        'RECALCULATE BMI',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purple,
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Center(
                    child: Text(
                      'BMI CALCULATOR • FLUTTER PROJECT',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF7054C8),
            size: 32,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF302A42),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryIndicator(
    String title,
    String range,
    Color color,
  ) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                Text(
                  range,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
