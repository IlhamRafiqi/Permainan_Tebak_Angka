import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print('=== Permainan Tebak Angka ===');
  final rng = Random();
  while (true) {
    print('\nPilih tingkat kesulitan: (1) Mudah (2) Sedang (3) Sulit (0) Keluar');
    final diff = _readLine('Masukkan pilihan');
    if (diff == '0') {
      print('Terima kasih sudah bermain.');
      break;
    }
    int max = 50;
    int maxAttempts = 8;
    if (diff == '1') {
      max = 50;
      maxAttempts = 8;
    } else if (diff == '2') {
      max = 100;
      maxAttempts = 7;
    } else if (diff == '3') {
      max = 500;
      maxAttempts = 6;
    } else {
      print('Pilihan tidak valid.');
      continue;
    }

    final target = rng.nextInt(max) + 1;
    print('Tebak angka antara 1 dan $max. Anda punya $maxAttempts kesempatan.');

    var attempts = 0;
    var won = false;
    while (attempts < maxAttempts) {
      attempts++;
      final guess = _readInt('Tebakan ke $attempts');
      if (guess == target) {
        print('Benar! Anda menang dalam $attempts tebakan.');
        won = true;
        break;
      } else if (guess < target) {
        print('Lebih besar.');
      } else {
        print('Lebih kecil.');
      }
      final remaining = maxAttempts - attempts;
      if (remaining > 0) print('Kesempatan tersisa: $remaining');
    }

    if (!won) {
      print('Kalah. Angka yang benar adalah $target');
    }

    final again = _readLine('Main lagi? (y/n)').trim().toLowerCase();
    if (again != 'y') {
      print('Bye.');
      break;
    }
  }
}

String _readLine(String prompt) {
  stdout.write('$prompt: ');
  return stdin.readLineSync() ?? '';
}

int _readInt(String prompt) {
  while (true) {
    final s = _readLine(prompt).trim();
    final v = int.tryParse(s);
    if (v != null) return v;
    print('Input tidak valid. Masukkan bilangan bulat.');
  }
}
