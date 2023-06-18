import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pa/widgets/pet_avatar.dart';

void main() {
  testWidgets('PetAvatar widget test', (WidgetTester tester) async {
    // Define test data
    final backgroundColor = Colors.blue;
    final backgroundImage = AssetImage('assets/cat.jpg');

    // Build the PetAvatar widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PetAvatar(
            avatars: [],
            backgroundColor: backgroundColor,
            backgroundImage: backgroundImage,
          ),
        ),
      ),
    );

    // Find the CircleAvatars
    final backgroundAvatarFinder = find.byType(CircleAvatar).first;
    final foregroundAvatarFinder = find.byType(CircleAvatar).last;

    // Verify the background CircleAvatar
    final backgroundAvatar =
        tester.widget<CircleAvatar>(backgroundAvatarFinder);
    expect(backgroundAvatar.backgroundColor, equals(backgroundColor));

    // Verify the foreground CircleAvatar
    final foregroundAvatar =
        tester.widget<CircleAvatar>(foregroundAvatarFinder);
    expect(foregroundAvatar.backgroundImage, equals(backgroundImage));
  });
}
