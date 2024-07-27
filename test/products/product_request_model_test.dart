import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nana_mobile_task/features/products/data/model/empty_model.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';

void main() {
  group('Info Model Testing', () {
    test('Testing Info Model', () {
      // Arrange
      const info = Info(count: 10, pages: 1, next: "nextUrl");
      // Act
      final updatedInfo = info.copyWith(next: "newNextUrl");
      // Assert
      expect(updatedInfo.count, 10);
      expect(updatedInfo.pages, 1);
      expect(updatedInfo.next, "newNextUrl");
    });

    test('Testing Info Model From Json', () {
      // Arrange
      final json = {'count': 10, 'pages': 1, 'next': 'nextUrl'};
      // Act
      final info = Info.fromJson(json);
      // Assert
      expect(info.count, 10);
      expect(info.pages, 1);
      expect(info.next, 'nextUrl');
    });

    test('Testing Info Model To JSON', () {
      // Arrange
      const info = Info(count: 10, pages: 1, next: 'nextUrl');
      // Act
      final json = info.toJson();
      // Assert
      expect(json['count'], 10);
      expect(json['pages'], 1);
      expect(json['next'], 'nextUrl');
    });
  });

  group('ProductsRequestModel Testing', () {
    const Info testInfo = Info(count: 10, pages: 1, next: 'nextUrl');
    final Results testResult = Results(
      id: 1,
      name: 'Test Name',
      status: 'Alive',
      species: 'Human',
      type: 'Type',
      gender: 'Male',
      origin: const Origin(name: 'Earth', url: 'earth_url'),
      location: const Origin(name: 'City', url: 'city_url'),
      image: 'image_url',
      episode: const ['episode1', 'episode2'],
      url: 'result_url',
      created: '2024-01-01T00:00:00Z',
    );
    final ProductsRequestModel testModel = ProductsRequestModel(
      info: testInfo,
      results: [testResult],
    );

    test('Test subclass of Equatable', () {
      expect(testModel, isA<Equatable>());
    });

    test('Test fromJson', () {
      final jsonMap = {
        'info': {'count': 10, 'pages': 1, 'next': 'nextUrl'},
        'results': [
          {
            'id': 1,
            'name': 'Test Name',
            'status': 'Alive',
            'species': 'Human',
            'type': 'Type',
            'gender': 'Male',
            'origin': {'name': 'Earth', 'url': 'earth_url'},
            'location': {'name': 'City', 'url': 'city_url'},
            'image': 'image_url',
            'episode': ['episode1', 'episode2'],
            'url': 'result_url',
            'created': '2024-01-01T00:00:00Z',
          }
        ],
      };

      final result = ProductsRequestModel.fromJson(jsonMap);

      expect(result, testModel);
    });

    test('Test toJson', () {
      final result = testModel.toJson();
      final expectedJsonMap = {
        'info': {'count': 10, 'pages': 1, 'next': 'nextUrl'},
        'results': [
          {
            'id': 1,
            'name': 'Test Name',
            'status': 'Alive',
            'species': 'Human',
            'type': 'Type',
            'gender': 'Male',
            'origin': {'name': 'Earth', 'url': 'earth_url'},
            'location': {'name': 'City', 'url': 'city_url'},
            'image': 'image_url',
            'episode': ['episode1', 'episode2'],
            'url': 'result_url',
            'created': '2024-01-01T00:00:00Z',
          }
        ],
      };
      expect(result, expectedJsonMap);
    });

    test('Test copyWith', () {
      final updatedModel = testModel.copyWith(
        info: const Info(count: 20, pages: 2, next: 'updatedUrl'),
      );

      expect(updatedModel.info?.count, 20);
      expect(updatedModel.info?.pages, 2);
      expect(updatedModel.info?.next, 'updatedUrl');
      expect(updatedModel.results, testModel.results);
    });

    test('Test Props', () {
      expect(testModel.props, [
        testInfo,
        [testResult]
      ]);
    });
  });

  group('Test Origin Model', () {
    const testName = 'Earth';
    const testUrl = 'earth_url';

    const Origin testOrigin = Origin(name: testName, url: testUrl);

    test('Test Equatable', () {
      expect(testOrigin, isA<Equatable>());
    });

    test('Test fromJson', () {
      final jsonMap = {
        'name': testName,
        'url': testUrl,
      };

      final result = Origin.fromJson(jsonMap);

      expect(result, testOrigin);
    });

    test('Test toJson', () {
      final result = testOrigin.toJson();
      final expectedJsonMap = {
        'name': testName,
        'url': testUrl,
      };

      expect(result, expectedJsonMap);
    });

    test('Test copyWith', () {
      final updatedOrigin = testOrigin.copyWith(name: 'Mars');

      expect(updatedOrigin.name, 'Mars');
      expect(updatedOrigin.url, testUrl);
    });

    test('Test props', () {
      expect(testOrigin.props, [testName, testUrl]);
    });
  });

  group('Test Results Model', () {
    const testId = 1;
    const testName = 'Test Name';
    const testStatus = 'Alive';
    const testSpecies = 'Human';
    const testType = 'Type';
    const testGender = 'Male';
    const testImage = 'test_image_url';
    const testUrl = 'test_url';
    const testCreated = '2024-01-01T00:00:00Z';
    final testEpisode = <String>['Episode 1', 'Episode 2'];
    const testOrigin = Origin(name: 'Origin Name', url: 'origin_url');
    const testLocation = Origin(name: 'Location Name', url: 'location_url');

    final Results testResults = Results(
      id: testId,
      name: testName,
      status: testStatus,
      species: testSpecies,
      type: testType,
      gender: testGender,
      origin: testOrigin,
      location: testLocation,
      image: testImage,
      episode: testEpisode,
      url: testUrl,
      created: testCreated,
    );

    test('Test Equatable', () {
      expect(testResults, isA<Equatable>());
    });

    test('fromJson should return a valid model', () {
      final jsonMap = {
        'id': testId,
        'name': testName,
        'status': testStatus,
        'species': testSpecies,
        'type': testType,
        'gender': testGender,
        'origin': testOrigin.toJson(),
        'location': testLocation.toJson(),
        'image': testImage,
        'episode': testEpisode,
        'url': testUrl,
        'created': testCreated,
      };

      final result = Results.fromJson(jsonMap);

      expect(result, testResults);
    });

    test('Test toJson', () {
      final result = testResults.toJson();
      final expectedJsonMap = {
        'id': testId,
        'name': testName,
        'status': testStatus,
        'species': testSpecies,
        'type': testType,
        'gender': testGender,
        'origin': testOrigin.toJson(),
        'location': testLocation.toJson(),
        'image': testImage,
        'episode': testEpisode,
        'url': testUrl,
        'created': testCreated,
      };

      expect(result, expectedJsonMap);
    });

    test('Test copyWith', () {
      final updatedResults = testResults.copyWith(name: 'Updated Name');

      expect(updatedResults.name, 'Updated Name');
      expect(updatedResults.id, testId);
      expect(updatedResults.status, testStatus);
      expect(updatedResults.species, testSpecies);
      expect(updatedResults.type, testType);
      expect(updatedResults.gender, testGender);
      expect(updatedResults.origin, testOrigin);
      expect(updatedResults.location, testLocation);
      expect(updatedResults.image, testImage);
      expect(updatedResults.episode, testEpisode);
      expect(updatedResults.url, testUrl);
      expect(updatedResults.created, testCreated);
    });

    test('Test props', () {
      expect(testResults.props, [
        testId,
        testName,
        testStatus,
        testSpecies,
        testType,
        testGender,
        testOrigin,
        testLocation,
        testImage,
        testEpisode,
        testUrl,
        testCreated,
      ]);
    });

    group('EmptyModel', () {
      const testStatus = 200;
      const testSuccess = true;

      const EmptyModel testEmptyModel = EmptyModel(
        status: testStatus,
        success: testSuccess,
      );

      test('should create an instance of EmptyModel', () {
        expect(testEmptyModel.status, testStatus);
        expect(testEmptyModel.success, testSuccess);
      });

      test('fromJson should return a valid model', () {
        final jsonMap = {
          'status': testStatus,
          'success': testSuccess,
        };

        final result = EmptyModel.fromJson(jsonMap);

        expect(result.status, testStatus);
        expect(result.success, testSuccess);
      });
    });
  });
}
