// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travel_app_ui/screens/login/login.dart';
// import 'package:travel_app_ui/utils/config.dart';
// import 'package:http/http.dart' as http;

// class MockSharedPreferences extends Mock implements SharedPreferences {}

// class MockHttpClient extends Mock implements http.Client {}

// void main() {
//   group('LoginScreen', () {
//     late LoginScreen loginScreen;
//     late MockSharedPreferences mockSharedPreferences;
//     late MockHttpClient mockHttpClient;

//     setUp(() {
//       mockSharedPreferences = MockSharedPreferences();
//       mockHttpClient = MockHttpClient();

//       loginScreen = LoginScreen();
//     });

//     testWidgets('should display the Login Screen', (WidgetTester tester) async {
//       await tester.pumpWidget(loginScreen);
//       expect(find.text('Login'), findsOneWidget);
//     });

//     testWidgets('should display an error message if email and password are not entered', (WidgetTester tester) async {
//       await tester.pumpWidget(loginScreen);

//       // Tap the login button
//       await tester.tap(find.text('Login').last);
//       await tester.pump();

//       expect(find.text('Please enter your email and password'), findsOneWidget);
//     });

//     testWidgets('should navigate to HomePage when login is successful', (WidgetTester tester) async {
     
//       when(mockHttpClient.post(Uri.parse(login),
//               headers: {"Content-Type": "application/json"},
//               body: anyNamed('body')))
//           .thenAnswer((_) async => http.Response('{"status": true, "token": "123"}', 200));

      
//       when(mockSharedPreferences.setString('token', '123')).thenAnswer((_) async => true);

      
//       loginScreen.prefs = mockSharedPreferences;
//       loginScreen.client = mockHttpClient;

//       await tester.pumpWidget(loginScreen);

//       // Enter email and password
//       await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
//       await tester.enterText(find.byType(TextFormField).last, 'password');

//       // Tap the login button
//       await tester.tap(find.text('Login').last);
//       await tester.pumpAndSettle();

//       // Verify that we navigate to HomePage
//       expect(find.byType(HomePage), findsOneWidget);
//     });
//   });
// }
