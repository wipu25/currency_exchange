import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/helpers/text_style_helper.dart';
import 'package:thanarak_exchange/presentation/history/history_notifier.dart';

class TotalBahtPrice extends ConsumerWidget {
  const TotalBahtPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyPrice = ref.watch(historyNotifier).totalDateBuyPrice;
    final sellPrice = ref.watch(historyNotifier).totalDateSellPrice;
    return Text(
      '${AppStrings.totalBuy} $buyPrice ${AppStrings.thb} / ${AppStrings.totalSell} $sellPrice ${AppStrings.thb}',
      style: TextStyleHelper.body3,
    );
  }
}
