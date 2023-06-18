import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Verify length of allUsers list', () {
    final List<Map<String, dynamic>> allUsers = [
      {
        "id": 1,
        "name": "Andy",
        "age": 29,
        "type": "cat",
        "asset": "assets/cat1.jpg",
        "breed": "Persian"
      },
      {
        "id": 2,
        "name": "Aragon",
        "age": 40,
        "type": "dog",
        "asset": "assets/dog1.jpg",
        "breed": "Golden Retriever"
      },
      {
        "id": 3,
        "name": "Bob",
        "age": 5,
        "type": "rabbit",
        "asset": "assets/rabbit1.jpg",
        "breed": "Holland Lop"
      },
      {
        "id": 4,
        "name": "Barbara",
        "age": 35,
        "type": "cat",
        "asset": "assets/cat2.jpg",
        "breed": "Siamese"
      },
      {
        "id": 5,
        "name": "Candy",
        "age": 21,
        "type": "dog",
        "asset": "assets/dog2.jpg",
        "breed": "Labrador Retriever"
      },
      {
        "id": 6,
        "name": "Colin",
        "age": 55,
        "type": "rabbit",
        "asset": "assets/rabbit2.jpg",
        "breed": "Mini Rex"
      },
      {
        "id": 7,
        "name": "Audra",
        "age": 30,
        "type": "cat",
        "asset": "assets/cat3.jpg",
        "breed": "Maine Coon"
      },
      {
        "id": 8,
        "name": "Banana",
        "age": 14,
        "type": "dog",
        "asset": "assets/dog3.jpg",
        "breed": "French Bulldog"
      },
      {
        "id": 9,
        "name": "Caversky",
        "age": 100,
        "type": "rabbit",
        "asset": "assets/rabbit3.jpg",
        "breed": "Netherland Dwarf"
      },
      {
        "id": 10,
        "name": "Becky",
        "age": 32,
        "type": "cat",
        "asset": "assets/cat4.jpg",
        "breed": "Bengal"
      },
      {
        "id": 11,
        "name": "Dexter",
        "age": 7,
        "type": "dog",
        "asset": "assets/dog4.jpg",
        "breed": "German Shepherd"
      },
      {
        "id": 12,
        "name": "Coco",
        "age": 3,
        "type": "dog",
        "asset": "assets/dog4.jpg",
        "breed": "Poodle"
      },
      {
        "id": 13,
        "name": "Luna",
        "age": 2,
        "type": "dog",
        "asset": "assets/dog5.jpg",
        "breed": "Siberian Husky"
      },
      {
        "id": 14,
        "name": "Milo",
        "age": 6,
        "type": "cat",
        "asset": "assets/cat5.jpg",
        "breed": "Scottish Fold"
      },
      {
        "id": 15,
        "name": "Fluffy",
        "age": 4,
        "type": "cat",
        "asset": "assets/cat5.jpg",
        "breed": "Ragdoll"
      },
      {
        "id": 16,
        "name": "Bella",
        "age": 1,
        "type": "rabbit",
        "asset": "assets/rabbit.jpg",
        "breed": "Flemish Giant"
      },
      {
        "id": 17,
        "name": "Max",
        "age": 8,
        "type": "dog",
        "asset": "assets/dog4.jpg",
        "breed": "Bulldog"
      },
      {
        "id": 18,
        "name": "Simba",
        "age": 2,
        "type": "cat",
        "asset": "assets/cat4.jpg",
        "breed": "Persian"
      },
      {
        "id": 19,
        "name": "Daisy",
        "age": 5,
        "type": "dog",
        "asset": "assets/dog4.jpg",
        "breed": "Beagle"
      },
      {
        "id": 20,
        "name": "Lola",
        "age": 3,
        "type": "cat",
        "asset": "assets/cat4.jpg",
        "breed": "Siamese"
      },
      {
        "id": 21,
        "name": "Ruby",
        "age": 2,
        "type": "dog",
        "asset": "assets/dog4.jpg",
        "breed": "Labrador Retriever"
      },
      {
        "id": 22,
        "name": "Oreo",
        "age": 6,
        "type": "cat",
        "asset": "assets/cat4.jpg",
        "breed": "British Shorthair"
      },
      {
        "id": 23,
        "name": "Rocky",
        "age": 4,
        "type": "dog",
        "asset": "assets/dog5.jpg",
        "breed": "Boxer"
      },
      {
        "id": 24,
        "name": "Gizmo",
        "age": 3,
        "type": "cat",
        "asset": "assets/cat5.jpg",
        "breed": "Exotic Shorthair"
      },
      {
        "id": 25,
        "name": "Snowball",
        "age": 2,
        "type": "rabbit",
        "asset": "assets/rabbit5.jpg",
        "breed": "Lionhead"
      },
    ];

    expect(allUsers.length, 25);
  });
}
