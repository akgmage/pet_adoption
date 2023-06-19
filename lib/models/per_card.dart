class Pet {
  final int id;
  final String imageAsset;
  final String name;
  final int age;
  final int price;
  final String breed;
  final String type;

  Pet({
    required this.id,
    required this.imageAsset,
    required this.name,
    required this.age,
    required this.price,
    required this.breed,
    required this.type,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] ?? '',
      imageAsset: json['asset'] ?? '',
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      price: json['price'] ?? 0,
      breed: json['breed'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'asset': imageAsset,
      'name': name,
      'age': age,
      'price': price,
      'breed': breed,
      'type': type,
    };
  }
}
