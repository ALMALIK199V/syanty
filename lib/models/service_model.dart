class ServiceRequest {
  final String id;
  final String userId;
  final String userName;
  final String deviceType;
  final String brand;
  final String model;
  final String issueDescription;
  final String serviceType;
  final String status;
  final double cost;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? technicianId;
  final String? technicianName;
  final bool hasWarranty;
  final int? warrantyDays;
  final String? customerAddress;
  final double? customerLat;
  final double? customerLng;
  final List<String>? images;

  ServiceRequest({
    required this.id,
    required this.userId,
    required this.userName,
    required this.deviceType,
    required this.brand,
    required this.model,
    required this.issueDescription,
    required this.serviceType,
    required this.status,
    required this.cost,
    required this.createdAt,
    this.updatedAt,
    this.technicianId,
    this.technicianName,
    this.hasWarranty = false,
    this.warrantyDays,
    this.customerAddress,
    this.customerLat,
    this.customerLng,
    this.images,
  });

  ServiceRequest copyWith({
    String? status,
    double? cost,
    DateTime? updatedAt,
    String? technicianId,
    String? technicianName,
  }) {
    return ServiceRequest(
      id: id,
      userId: userId,
      userName: userName,
      deviceType: deviceType,
      brand: brand,
      model: model,
      issueDescription: issueDescription,
      serviceType: serviceType,
      status: status ?? this.status,
      cost: cost ?? this.cost,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      technicianId: technicianId ?? this.technicianId,
      technicianName: technicianName ?? this.technicianName,
      hasWarranty: hasWarranty,
      warrantyDays: warrantyDays,
      customerAddress: customerAddress,
      customerLat: customerLat,
      customerLng: customerLng,
      images: images,
    );
  }
}