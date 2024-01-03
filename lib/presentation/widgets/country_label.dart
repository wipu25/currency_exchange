import 'package:flutter/material.dart';

class CountryLabel extends StatelessWidget {
  final String logo;
  final String currency;
  final String fullCountry;
  const CountryLabel(
      {Key? key,
      required this.currency,
      required this.fullCountry,
      required this.logo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          logo.isEmpty
              ? const Icon(
                  Icons.currency_exchange,
                  size: 50,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    logo,
                    fit: BoxFit.fill,
                    width: 50,
                    height: 50,
                  )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currency,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  fullCountry,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
