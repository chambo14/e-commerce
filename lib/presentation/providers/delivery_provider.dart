import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/mock/mock_data.dart';
import '../../domain/entities/delivery_location.dart';

final deliveryLocationsProvider = FutureProvider<List<DeliveryLocation>>((ref) async {
  // TODO: remplacer par appel API
  await Future.delayed(const Duration(milliseconds: 400));
  return MockData.deliveryLocations;
});

final selectedDeliveryLocationProvider =
    StateProvider<DeliveryLocation?>((ref) => null);
