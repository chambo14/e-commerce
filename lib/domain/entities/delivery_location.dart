class DeliveryLocation {
  final String id;
  final String name;
  final String address;
  final String city;
  final double deliveryFee;
  final String estimatedTime;

  const DeliveryLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.deliveryFee,
    required this.estimatedTime,
  });
}
