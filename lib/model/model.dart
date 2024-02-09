// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String name;
  String model;
  String price;
  String mileage;

  Posts({
    required this.name,
    required this.model,
    required this.price,
    required this.mileage,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    name: json["Name"],
    model: json["Model"],
    price: json["Price"],
    mileage: json["Mileage"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Model": model,
    "Price": price,
    "Mileage": mileage,
  };
}
