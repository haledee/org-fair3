import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:org_fair/main.dart';
import 'package:org_fair/config.dart';
import 'package:org_fair/data/event_repository.dart';
import 'package:org_fair/data/orgs.dart';

void main() {
  testWidgets('CICT Org Fair app loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame, passing the required repository and events.
    await tester.pumpWidget(
      OrgFairApp(
        repository: OrgRepository(),
        events: EventRepository(createEventSource(http.Client())),
      ),
    );

    // Verify that the app builds and renders the root widget without throwing errors.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}