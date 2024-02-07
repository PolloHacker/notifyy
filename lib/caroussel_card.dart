import 'dart:ui';

import 'package:flutter/material.dart';

class AwesomeCarousel extends StatefulWidget {
  const AwesomeCarousel({super.key});

  @override
  State<AwesomeCarousel> createState() => _AwesomeCarouselState();
}

class _AwesomeCarouselState extends State<AwesomeCarousel> {
  final Map<int, List<String>> data = {
    0: ["images/barinsul.png", "Barinsul"],
    1: ["images/bb.png", "Banco do Brasil"],
    2: ["images/bradesco.png", "Bradesco"],
    3: ["images/c6.png", "C6 Bank"],
    4: ["images/caixa.png", "Caixa Econômica"],
    5: ["images/hotmart.png", "Hotmart"],
    6: ["images/inter.png", "Inter"],
    7: ["images/itau.png", "Itaú"],
    8: ["images/iti.png", "Iti Itaú"],
    9: ["images/kiwify.png", "Kiwify"],
    10: ["images/lastlink.png", "LastLink"],
    11: ["images/mercadopago.png", "MercadoPago"],
    12: ["images/mercantil.png", "Banco Mercantil"],
    13: ["images/monetizze.png", "Monetizze"],
    14: ["images/next.png", "Next"],
    15: ["images/nubank.png", "Nubank"],
    16: ["images/pagbank.png", "PagBank"],
    17: ["images/perfectpay.png", "PerfectPay"],
    18: ["images/picpay.png", "PicPay"],
    19: ["images/safra.png", "Banco Safra"],
    20: ["images/santander.png", "Santander"],
    21: ["images/sicoob.png", "Sicoob"],
    22: ["images/xp.png", "Xp Investimentos"],
    23: ["images/ticto.png", "Ticto"],
    24: ["images/kirvano.png", "Kirvano"],
    25: ["images/yampi.png", "Yampi"]
  };

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 128.0, maxHeight: 128.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: ValueKey<String>(data[_currentPage % data.length]![1]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(data[_currentPage % data.length]![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black.withOpacity(0.2)),
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 0.55,
                widthFactor: 0.9,
                child: PageView.builder(
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(data[index % data.length]![0]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const Spacer(flex: 1),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data[_currentPage % data.length]![1],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
