import 'package:flutter/material.dart';

class CountryLabel extends StatelessWidget {
  final String logo;
  final String currency;
  final String fullCountry;
  final Color? textColor;
  const CountryLabel(
      {Key? key,
      required this.currency,
      required this.fullCountry,
      required this.logo,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.black),
                  ),
                  Text(
                    fullCountry,
                    style: TextStyle(
                        fontSize: 16, color: textColor ?? Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
