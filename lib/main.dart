import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

enum Color { pink, yellow, green }

enum Result { dialog, snackbar }

enum Transition { bottomToTop, topToBottom, rightToLeft }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Option Selector',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow[50]),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Color? selectedColor;
  Result? selectedResult;
  Transition? selectedTransition;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _randomize();
  }

  void _randomize() {
    setState(() {
      selectedColor = Color.values[random.nextInt(Color.values.length)];
      selectedResult = Result.values[random.nextInt(Result.values.length)];
      selectedTransition =
          Transition.values[random.nextInt(Transition.values.length)];
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Color: $selectedColor'),
              Text('Result: $selectedResult'),
              Text('Transition: $selectedTransition'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
            Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      setState(() {
                        selectedColor = Color.pink;
                      });
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        (selectedColor == Color.pink) ? Colors.yellow : null,
                  ),
                  child: const Text('Розовый'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedColor = Color.yellow;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        (selectedColor == Color.yellow) ? Colors.yellow : null,
                  ),
                  child: const Text('Желтый'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedColor = Color.green;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        (selectedColor == Color.green) ? Colors.yellow : null,
                  ),
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
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedResult = Result.dialog;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: (selectedResult == Result.dialog)
                        ? Colors.yellow
                        : null,
                  ),
                  child: const Text('Dialog'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedResult = Result.snackbar;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: (selectedResult == Result.snackbar)
                        ? Colors.yellow
                        : null,
                  ),
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
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTransition = Transition.bottomToTop;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        (selectedTransition == Transition.bottomToTop)
                            ? Colors.yellow
                            : null,
                  ),
                  child: const Text('Снизу вверх'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTransition = Transition.topToBottom;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        (selectedTransition == Transition.topToBottom)
                            ? Colors.yellow
                            : null,
                  ),
                  child: const Text('Сверху вниз'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTransition = Transition.rightToLeft;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        (selectedTransition == Transition.rightToLeft)
                            ? Colors.yellow
                            : null,
                  ),
                  child: const Text('Справа налево'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _randomize,
              child: const Text('Подобрать вариант'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Открыть критерии'),
            ),
            if (selectedColor != null &&
                selectedResult != null &&
                selectedTransition != null)
              ElevatedButton(
                onPressed: _showDialog,
                child: const Text('Показать результат'),
              ),
          ],
        ),
      ),
    );
  }
}
