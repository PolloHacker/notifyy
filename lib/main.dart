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
  TextEditingController intervalController = TextEditingController();

  String valueDisplay = "";
  String timeDisplay = "";
  String numberDisplay = "";
  String intervalDisplay = "";

  RegExp digitValidator = RegExp(r"^\d+(?:-\d+)?$");
  bool isANumber = true;

  Time selectedInit = Time.segundos;
  Time selectedInterval = Time.segundos;

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
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "1) Deslize para selecionar o aplicativo desejado",
                    textAlign: TextAlign.start,
                  ),
                ),
                const AwesomeCarousel()
              ],
            ),
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
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                        "2) Insira o valor da transação e a quantidade de notificações",
                      textAlign: TextAlign.start,
                    ),
                  ),
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
                              hintText: "Quantidade",
                              errorText: isANumber ? null : "Apenas números"),
                          controller: numberController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "3) Selecione a unidade de tempo e insira o tempo de espera",
                      textAlign: TextAlign.start,
                    ),
                  ),
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
                    selected: <Time>{selectedInit},
                    onSelectionChanged: (Set<Time> newSelection) {
                      setState(() {
                        selectedInit = newSelection.first;
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
                        hintText: "Começar em... ",
                        errorText: isANumber ? null : "Apenas números"),
                    controller: timeController,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "4) Selecione a unidade de tempo e insira o tempo de intervalo entre as notificações",
                      textAlign: TextAlign.start,
                    ),
                  ),
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
                    selected: <Time>{selectedInterval},
                    onSelectionChanged: (Set<Time> newSelection) {
                      setState(() {
                        selectedInterval = newSelection.first;
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
                        hintText: "Intervalo",
                        errorText: isANumber ? null : "Apenas números"),
                    controller: intervalController,
                  ),
                  const SizedBox(height: 10)
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
