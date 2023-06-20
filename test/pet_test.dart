import 'package:flutter_test/flutter_test.dart';
import 'package:pa/models/per_card.dart';

/// We have two test cases: one for the fromJson() method to ensure it correctly creates a
/// Pet object from valid JSON, and another for the toJson() method to verify it returns a
/// valid JSON map representation of the Pet object.
void main() {
  group('Pet', () {
    const petJson = {
      'id': 1,
      'asset': 'assets/cat1.jpg',
      'name': 'Andy',
      'age': 29,
      'price': 200,
      'breed': 'Persian',
      'type': 'cat',
    };

    test('fromJson() should create a Pet object from valid JSON', () {
      final pet = Pet.fromJson(petJson);

      expect(pet.id, equals(1));
      expect(pet.imageAsset, equals('assets/cat1.jpg'));
      expect(pet.name, equals('Andy'));
      expect(pet.age, equals(29));
      expect(pet.price, equals(200));
      expect(pet.breed, equals('Persian'));
      expect(pet.type, equals('cat'));
    });

    test(
        'toJson() should return a valid JSON map representation of the Pet object',
        () {
      final pet = Pet(
        id: 1,
        imageAsset: 'assets/cat1.jpg',
        name: 'Andy',
        age: 29,
        price: 200,
        breed: 'Persian',
        type: 'cat',
      );

      final petJson = pet.toJson();

      expect(petJson['id'], equals(1));
      expect(petJson['asset'], equals('assets/cat1.jpg'));
      expect(petJson['name'], equals('Andy'));
      expect(petJson['age'], equals(29));
      expect(petJson['price'], equals(200));
      expect(petJson['breed'], equals('Persian'));
      expect(petJson['type'], equals('cat'));
    });
  });
}
