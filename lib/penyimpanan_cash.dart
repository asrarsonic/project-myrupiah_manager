class Income {
  final String amount;
  final String description;
  final String date;

  Income({
    required this.amount,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'description': description,
      'date': date,
    };
  }

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      amount: json['amount'],
      description: json['description'],
      date: json['date'],
    );
  }
}
