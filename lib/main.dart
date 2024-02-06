import 'package:flutter/material.dart';
import 'package:notifyy/caroussel_card.dart';
import 'package:notifyy/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notiffy',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(title: 'Notiffy'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController valueController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String valueDisplay = "";
  String timeDisplay = "";
  String numberDisplay = "";

  RegExp digitValidator = RegExp(r"^\d+(?:-\d+)?$");
  bool isANumber = true;

  Time selectedTime = Time.segundos;

  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const AwesomeCarousel(),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 600.0),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (inputValue) {
                            if (inputValue.isEmpty ||
                                digitValidator.hasMatch(inputValue)) {
                              setValidator(true);
                            } else {
                              setValidator(false);
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Valor da transação",
                              errorText: isANumber ? null : "Apenas números"),
                          controller: valueController,
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 10,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (inputValue) {
                            if (inputValue.isEmpty ||
                                digitValidator.hasMatch(inputValue)) {
                              setValidator(true);
                            } else {
                              setValidator(false);
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Número de notificações",
                              errorText: isANumber ? null : "Apenas números"),
                          controller: numberController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SegmentedButton(
                    segments: const <ButtonSegment<Time>>[
                      ButtonSegment(
                        value: Time.segundos,
                        label: Text('Segundos'),
                      ),
                      ButtonSegment(
                        value: Time.minutos,
                        label: Text('Minutos'),
                      ),
                      ButtonSegment(
                        value: Time.horas,
                        label: Text('Horas'),
                      ),
                    ],
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                    selected: <Time>{selectedTime},
                    onSelectionChanged: (Set<Time> newSelection) {
                      setState(() {
                        selectedTime = newSelection.first;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (inputValue) {
                      if (inputValue.isEmpty ||
                          digitValidator.hasMatch(inputValue)) {
                        setValidator(true);
                      } else {
                        setValidator(false);
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Tempo para notificação",
                        errorText: isANumber ? null : "Apenas números"),
                    controller: timeController,
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum Time { segundos, minutos, horas }
