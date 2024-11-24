class Product {
  // Customer details
  final String customerName;
  final String address;
  final String productName;
  final double productPrice;
  final int productQuantity;
  final double discount;
  // final String hsCode;
  final String particulars;
  // final int quantity;
  // final double rate;
  // final double amountRs1; // Assume Rs1 and Rs2 are for amount breakdown
  // final double amountRs2;

  Product({
    required this.customerName,
    required this.address,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.discount,
    // required this.hsCode,
    required this.particulars,
    // required this.quantity,
    // required this.rate,
    // required this.amountRs1,
    // required this.amountRs2,
  });

  double get totalPrice {
    // Calculate the total price with discount
    double total = productPrice * productQuantity;
    return total - (discount > total ? total : discount);
  }

  double get productAmount {
    // Calculate the amount for the product
    return productPrice * productQuantity;
  }

}
