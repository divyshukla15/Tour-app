import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/mocks/mock_location.dart';

void main(){
  test('test fetchAny',(){
    final mockLocation =MockLocation.fetchAny();
    expect(mockLocation, isNotNull);
    expect(mockLocation.name,isNotEmpty);
  });
}