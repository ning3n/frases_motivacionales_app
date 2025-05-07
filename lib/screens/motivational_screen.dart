import 'package:flutter/material.dart';
import 'dart:math';

class MotivationalScreen extends StatefulWidget {
  const MotivationalScreen({super.key});

  @override
  State<MotivationalScreen> createState() => _MotivationalScreenState();
}

class _MotivationalScreenState extends State<MotivationalScreen> {
  final List<String> frases = [
    "Eres muy fuerte, sigue asi.",
    "Hoy es un buen dia para empezar.",
    "Pequeños pasos tambien te llevan lejos.",
    "Respira, sonríe y sigue adelante.",
    "Lo importante es ser mejor que el tu de ayer."
  ];
  double _opacidad = 1.0;
  String fraseActual = "Generador de frases";

  void generarFrase() async{
    // 1. Bajar opacidad
    setState(() {
      _opacidad = 0.0;
    });

    // 2. Esperar la animación (debe coincidir con duration del AnimatedOpacity)
    await Future.delayed(const Duration(milliseconds: 500));

    // 3. Cambiar la frase
    final random = Random();
    setState(() {
      fraseActual = frases[random.nextInt(frases.length)];
    });

    // 4. Volver a mostrarla
    setState(() {
      _opacidad = 1.0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: const Text('Motivacion.exe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AnimatedOpacity(
                  opacity: _opacidad, 
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    fraseActual,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: generarFrase,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Motivate!'),
            )
          ],
        ),
      ),
    );
  }
}