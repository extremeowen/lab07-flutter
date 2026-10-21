import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Stateless-віджет: сам нічого не зберігає
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Picker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorPickerPage(),
    );
  }
}
// Stateful-віджет: значення RGB змінюються, тому потрібен стан
class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});
  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}
class _ColorPickerPageState extends State<ColorPickerPage> {
  double _red = 50;
  double _green = 33;
  double _blue = 230;
  // Один метод будує підпис + слайдер для будь-якого каналу
  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.round()}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Slider(
          value: value,
          min: 0,
          max: 255,
          onChanged: onChanged,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Квадрат, колір якого залежить від стану
            Container(
              width: 150,
              height: 150,
              color: Color.fromARGB(
                255,
                _red.round(),
                _green.round(),
                _blue.round(),
              ),
            ),
            const SizedBox(height: 60),
            _buildSlider('Red', _red, (v) => setState(() => _red = v)),
            _buildSlider('Green', _green, (v) => setState(() => _green = v)),
            _buildSlider('Blue', _blue, (v) => setState(() => _blue = v)),
          ],
        ),
      ),
    );
  }
}