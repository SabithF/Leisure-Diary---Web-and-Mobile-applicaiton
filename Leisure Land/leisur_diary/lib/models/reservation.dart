class Reservation {
  final String? username;
  final String? title;
  final String? date;
  final String? price;
  final String? phone;

  Reservation({this.username, this.title, this.date, this.price, this.phone});

  Map<String, dynamic> toJson() => {
        'username': username,
        'title': title,
        'date': date,
        'price': price,
        'phone': phone,
      };
}
