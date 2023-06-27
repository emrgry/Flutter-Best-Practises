class Cat {
  String description;
  String imageUrl;
  int statusCode;

  Cat(
      {required this.description,
      required this.imageUrl,
      required this.statusCode});

  static Cat fromJson(Map<String, dynamic> json) {
    return Cat(
        description: json['description'],
        imageUrl: json['imageUrl'],
        statusCode: json['statusCode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['statusCode'] = this.statusCode;
    return data;
  }
}
