import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Option Selector',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подбор варианта на экзамен'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Основной цвет',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Розовый'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Желтый'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Зеленый'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Показ результат',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Dialog'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Snackabr'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Переход между экранами',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Снизу вверх'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Сверху вниз'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Справа налево'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Подобрать вариант'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Открыть критерии'),
            ),
          ],
        ),
      ),
    );
  }

  // void showDialog(BuildContext context) {}
  //
  // void showSnackbar(BuildContext context) {}
}
