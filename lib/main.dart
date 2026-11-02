
import 'package:flutter/material.dart';
import 'result_screen.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF7054C8),
        scaffoldBackgroundColor: const Color(0xFFF5F3FB),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String gender = 'Male';
  double height = 170;
  int weight = 65;
  int age = 20;

  static const purple = Color(0xFF7054C8);

  void changeWeight(int value) {
    setState(() {
      weight = (weight + value).clamp(1, 300).toInt();
    });
  }

  void changeAge(int value) {
    setState(() {
      age = (age + value).clamp(18, 100).toInt();
    });
  }

  void calculateBMI() {
    double bmi = weight / ((height / 100) * (height / 100));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmi: bmi,
          age: age,
          gender: gender,
        ),
      ),
    );
  }

  Widget genderCard(String title, IconData icon) {
    bool selected = gender == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            gender = title;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 23),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFFEDE7FA)
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? purple : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: purple.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 42,
                color: selected ? purple : Colors.grey,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: selected ? purple : Colors.black87,
                ),
              ),
              if (selected)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.check_circle,
                    color: purple,
                    size: 17,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberCard(
    String title,
    String unit,
    int value,
    IconData icon,
    Function(int) onChange,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: purple.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: purple, size: 28),
            const SizedBox(height: 9),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF302A42),
              ),
            ),
            Text(
              unit,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controlButton(
                  Icons.remove,
                  () => onChange(-1),
                ),
                const SizedBox(width: 12),
                controlButton(
                  Icons.add,
                  () => onChange(1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget controlButton(IconData icon, VoidCallback action) {
    return InkWell(
      onTap: action,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFFEDE7FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: purple,
          size: 20,
        ),
      ),
    );
  }

  Widget sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: purple, size: 22),
        const SizedBox(width: 9),
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF302A42),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        const Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'HEALTH TRACKER',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        const Text(
                          'BMI Calculator',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Understand your body. Track your health.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Gender Selection
                  sectionTitle(
                    'Select Gender',
                    Icons.person_outline,
                  ),
                  const SizedBox(height: 14),

                  Row(
                    children: [
                      genderCard('Male', Icons.male),
                      const SizedBox(width: 15),
                      genderCard('Female', Icons.female),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Height Selection
                  sectionTitle(
                    'Your Height',
                    Icons.height,
                  ),
                  const SizedBox(height: 14),

                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: purple.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${height.round()} cm',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: purple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: purple,
                            inactiveTrackColor: const Color(0xFFE7E1F3),
                            thumbColor: purple,
                            overlayColor: purple.withValues(alpha: 0.12),
                            trackHeight: 6,
                          ),
                          child: Slider(
                            value: height,
                            min: 120,
                            max: 220,
                            divisions: 100,
                            label: '${height.round()} cm',
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                          ),
                        ),
                        const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '120 cm',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '220 cm',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Weight and Age
                  sectionTitle(
                    'Your Measurements',
                    Icons.monitor_weight_outlined,
                  ),
                  const SizedBox(height: 14),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      numberCard(
                        'Weight',
                        'kg',
                        weight,
                        Icons.monitor_weight_outlined,
                        changeWeight,
                      ),
                      const SizedBox(width: 14),
                      numberCard(
                        'Age',
                        'years',
                        age,
                        Icons.cake_outlined,
                        changeAge,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Calculate Button
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF8066D9),
                          Color(0xFF5740A7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: purple.withValues(alpha: 0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: calculateBMI,
                      icon: const Icon(Icons.calculate_outlined),
                      label: const Text(
                        'CALCULATE BMI',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Disclaimer
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'BMI is a screening measure, not a medical diagnosis. '
                            'This calculator uses standard adult BMI categories.',
                            style: TextStyle(
                              color: Color(0xFF62577D),
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

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
}
