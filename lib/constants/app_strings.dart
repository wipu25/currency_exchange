class AppStrings {
  //calculate_screen
  static const String appTitle = "Sapphire Exchange";
  static const String preventCalculate = 'กรุณาเลือกค่าเงินก่อน';
  static const String transaction = 'ประเภท';
  static const String emptyAlert = 'เติมช่องว่างให้ครบ';
  static const String negativeAlert = 'ตัวเลขติดลบ';
  static const String notNumberAlert = 'ไม่ใช่ตัวเลข';
  static const String totalAmount = 'จำนวนแลกทั้งหมด';
  static const String equal = 'เท่ากับ';
  static const String addBill = 'เพิ่มช่วงเรทราคา';
  static const String addReceipt = 'สร้างใบเสร็จ';
  static const String saving = 'กำลังบันทึก';
  static const String saveComplete = 'บันทึกสำเร็จ';
  static const String print = 'ปริ้นท์';
  static const String alertPrint = 'ปริ้นท์ไม่สำเร็จ';
  static const String successPrint = 'ปริ้นท์สำเร็จ';
  static const String back = 'ย้อนกลับ';
  static const String thb = 'THB';
  static const String convert = 'ราคา';

  //summary_panel
  static const String totalItem = 'รายการทั้งหมด';
  static const String range = 'ช่วงเงิน';
  static const String price = 'ราคา';
  static const String totalBuy = 'ราคาซื้อรวม';
  static const String totalSell = 'ราคาขายรวม';
  static const String totalPrice = 'ราคารวม';
  static const String paymentMethod = 'ช่องทางชำระเงิน';
  static const String amount = 'จำนวน';

  static const String enTotalSell = 'Total Sell';
  static const String enTotalBuy = 'Total Buy';
  static const String enPaymentMethod = 'Payment Method';

  //exchange_screen
  static const String currency = 'สกุลเงิน';
  static const String denomination = 'ธนบัตรที่รับ';
  static const String buying = 'อัตราซื้อ';
  static const String selling = 'อัตราขาย';
  static const String save = 'บันทึก';
  static const String selectAll = 'เลือกทั้งหมด';
  static const String deselectAll = 'เอาออกทั้งหมด';
  static const String confirm = 'ยืนยัน';
  static const String edit = 'แก้ไข';
  static const String errorFillAll = 'เติมให้ครบช่อง';
  static const String errorNegative = 'ตัวเลขติดลบ';

  static const List<String> exchangeHeader = [
    AppStrings.currency,
    AppStrings.price,
    AppStrings.buying,
    AppStrings.selling
  ];

  static const List<String> historyHeader = [
    'วันที่',
    'เวลา',
    'สกุลเงิน',
    'ธนบัตร',
    'ราคา',
    'จำนวน',
    'ราคารวม THB',
    'จ่ายผ่าน',
    'เพิ่มเติม'
  ];

  //history-screen
  static const String date = 'วันที่';
  static const String noTransaction = 'ไม่มีธุรกรรม';
  static const String cancel = 'ยกเลิก';
  static const String cancelling = 'กำลังยกเลิก';
  static const String time = 'เวลา';
  static const String moreInfo = 'เพิ่มเติม';
  static const String filter = 'กรอง';

  //client-info
  static const String name = 'ชื่อ';
  static const String address = 'ที่อยู่';
  static const String id = 'ID/Passport';
  static const String hintName = 'ชื่อ นามสกุล';
  static const String hintAddress = 'ที่อยู่';
  static const String hintID = '123456789';

  //error
  static const String errorNetwork = 'เกิดข้อผิดพลาด';
  static const String clientInfoIncomplete = 'ข้อมูลไม่ครบ';
}
