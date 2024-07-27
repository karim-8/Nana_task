import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nana_mobile_task/core/injection/injector.dart';
import 'package:nana_mobile_task/core/utils/resources/observer.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';
import 'package:nana_mobile_task/features/products/presentation/user_interface/products/screens/products_screen.dart';
import 'products/product_use_case_test.mocks.dart';

class MockCounterCubit extends MockCubit<ProductsState>
    implements ProductsCubit {}

class MockCounterState extends Fake implements ProductsStateBase {}

void main() {
  group('Products Screen', () {
    setUpAll(() {
      HttpOverrides.global = null;
      WidgetsFlutterBinding.ensureInitialized();
      Injector.init();
      Bloc.observer = Observer();
      registerFallbackValue(MockCounterState());
    });

    Widget createWidgetUnderTest() {
      return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsCubit>(
            create: (BuildContext ctx) =>
                ProductsCubit(repository: MockMockProductsRepositoryBase()),
          ),
        ],
        child: const MaterialApp(
          home: ProductsScreen(),
        ),
      );
    }

    testWidgets(
      "App bar widget test",
      (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        expect(find.byKey(const Key('appBarKey')), findsOneWidget);
      },
    );

    testWidgets(
      "Grid Items widget test",
      (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        expect(find.byKey(const Key('MockImage')), findsWidgets);
      },
    );

    testWidgets(
      "Snacks Section widget test",
      (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        expect(find.text("Snacks Product"), findsWidgets);
      },
    );

    testWidgets(
      "Most use product Section widget test",
      (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        expect(find.text("Most use product"), findsWidgets);
      },
    );

    testWidgets(
      "Recommendation Section widget test",
      (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        expect(find.text("Recommendation"), findsWidgets);
      },
    );
  });
}
