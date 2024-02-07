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
  final _formKey = GlobalKey<FormState>();

  TextEditingController valueController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController intervalController = TextEditingController();

  Time selectedInit = Time.segundos;
  Time selectedInterval = Time.segundos;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.fromLTRB(4, 4, 4, 0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: const Text(
                      "1) Deslize para selecionar o aplicativo desejado",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const AwesomeCarousel()),
            Form(
              key: _formKey,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 2000.0),
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
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return "Campo obrigatório";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Valor da transação",
                              ),
                              controller: valueController,
                            ),
                          ),
                          const Spacer(flex: 1),
                          Expanded(
                            flex: 10,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return "Campo obrigatório";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Quantidade",
                              ),
                              controller: numberController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "3) Selecione a unidade de tempo e insira a espera para a primeira notificação",
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (inputValue) {
                          if (inputValue == null || inputValue.isEmpty) {
                            return "Campo obrigatório";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Começar em... ",
                        ),
                        controller: timeController,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "4) Selecione a unidade de tempo e insira o intervalo entre as notificações",
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (inputValue) {
                          if (inputValue == null || inputValue.isEmpty) {
                            return "Campo obrigatório";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Intervalo",
                        ),
                        controller: intervalController,
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processando dados')),
                            );
                          }
                        },
                        child: const Text("Iniciar processo"),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Time { segundos, minutos, horas }
