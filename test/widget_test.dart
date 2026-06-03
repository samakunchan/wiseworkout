import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/onboarding/screens/onboarding_screen.dart';
import 'package:wiseworkout/main.dart';

void main() {
  setUp(() async {
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.withData(<String, String>{});
    await kGetIt.reset();
    setupLocator();
  });

  testWidgets('App launches with OnboardingScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(OnboardingScreen), findsOneWidget);
  });
}
