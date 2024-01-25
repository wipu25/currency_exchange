enum Transaction {
  buy,
  sell;

  String getString() {
    switch (this) {
      case Transaction.buy:
        return 'ซื้อ';
      case Transaction.sell:
        return 'ขาย';
    }
  }
}

enum PaymentMethod {
  cash,
  weChatMom,
  weChatDad,
  cancel;

  String getString() {
    switch (this) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.weChatMom:
        return 'WeChat Mom';
      case PaymentMethod.weChatDad:
        return 'WeChat Dad';
      case PaymentMethod.cancel:
        return 'Cancel';
    }
  }
}
