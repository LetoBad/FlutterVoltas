import 'dart:async';
import 'package:flutter/material.dart';
import 'package:voltas/core/viewmodel/models/volta_model.dart';

class CronometroViewModel extends ChangeNotifier {
  Duration _tempoTotal = Duration.zero;
  Duration _tempoUltimaVolta = Duration.zero;
  Timer? _timer;
  bool _estaRodando = false;
  final List<Volta> _voltas = [];

  Duration get tempoTotal => _tempoTotal;
  List<Volta> get voltas => _voltas;
  bool get estaRodando => _estaRodando;

  // Método para iniciar el cronómetro
  void iniciar() {
    if (!_estaRodando) {
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        _tempoTotal += Duration(milliseconds: 100);
        notifyListeners();
      });
      _estaRodando = true;
      notifyListeners();
    }
  }

  // Método para pausar el cronómetro
  void pausar() {
    if (_estaRodando) {
      _timer?.cancel();
      _estaRodando = false;
      notifyListeners();
    }
  }

  // Método para registrar una vuelta
  void registrarVolta() {
    if (_estaRodando) {
      final novaVolta = Volta(
        numero: _voltas.length + 1,
        tempoVolta: _tempoTotal - _tempoUltimaVolta,
        tempoTotal: _tempoTotal,
      );
      _voltas.insert(0, novaVolta); // Insertar la nueva vuelta al inicio
      _tempoUltimaVolta = _tempoTotal;
      notifyListeners();
    }
  }

  // Método para reiniciar el cronómetro
  void reiniciar() {
    _timer?.cancel();
    _tempoTotal = Duration.zero;
    _tempoUltimaVolta = Duration.zero;
    _voltas.clear();
    _estaRodando = false;
    notifyListeners();
  }
}
