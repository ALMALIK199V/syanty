import 'package:equatable/equatable.dart';

// أنواع الخدمات
enum ServiceType { delivery, online, onSite }

// حالات الطلب
enum RequestStatus {
  pending,           // بانتظار المراجعة
  accepted,          // تم القبول
  assigned,          // تم التعيين
  pickedUp,          // تم الاستلام
  underDiagnosis,    // جاري التشخيص
  diagnosisCompleted,// تم التشخيص
  waitingApproval,   // بانتظار الموافقة
  approved,          // تمت الموافقة
  underRepair,       // جاري الإصلاح
  repaired,          // تم الإصلاح
  qualityCheck,      // جاري الفحص النهائي
  readyForDelivery,  // جاهز للتسليم
  delivered,         // تم التسليم
  completed,         // مكتمل
  cancelled,         // ملغي
  rejected           // مرفوض
}

// نموذج طلب الصيانة
class ServiceRequestModel extends Equatable {
  final String id;
  final String userId;
  final String requestNumber;
  final String deviceType;
  final String brand;
  final String model;
  final String issueDescription;
  final ServiceType serviceType;
  final bool hasWarranty;
  final double warrantyCost;
  final double estimatedCost;
  final double finalCost;
  final RequestStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? assignedTechnicianId;
  final String? assignedDeliveryId;
  final String? diagnosisReport;
  final String? repairReport;
  final int? warrantyDays;
  final bool? customerApproved;
  final DateTime? approvalDeadline;
  final String? customerAddress;
  final double? customerLat;
  final double? customerLng;
  final List<String>? images;
  final bool? hasNewIssue;
  final double? additionalCost;
  final bool? additionalCostApproved;

  const ServiceRequestModel({
    required this.id,
    required this.userId,
    required this.requestNumber,
    required this.deviceType,
    required this.brand,
    required this.model,
    required this.issueDescription,
    required this.serviceType,
    required this.hasWarranty,
    required this.warrantyCost,
    required this.estimatedCost,
    required this.finalCost,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.assignedTechnicianId,
    this.assignedDeliveryId,
    this.diagnosisReport,
    this.repairReport,
    this.warrantyDays,
    this.customerApproved,
    this.approvalDeadline,
    this.customerAddress,
    this.customerLat,
    this.customerLng,
    this.images,
    this.hasNewIssue,
    this.additionalCost,
    this.additionalCostApproved,
  });

  // تحويل من Map إلى ServiceRequestModel
  factory ServiceRequestModel.fromMap(Map<String, dynamic> map) {
    return ServiceRequestModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      requestNumber: map['requestNumber'] ?? '',
      deviceType: map['deviceType'] ?? '',
      brand: map['brand'] ?? '',
      model: map['model'] ?? '',
      issueDescription: map['issueDescription'] ?? '',
      serviceType: _parseServiceType(map['serviceType']),
      hasWarranty: map['hasWarranty'] ?? false,
      warrantyCost: (map['warrantyCost'] ?? 0).toDouble(),
      estimatedCost: (map['estimatedCost'] ?? 0).toDouble(),
      finalCost: (map['finalCost'] ?? 0).toDouble(),
      status: _parseStatus(map['status']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      assignedTechnicianId: map['assignedTechnicianId'],
      assignedDeliveryId: map['assignedDeliveryId'],
      diagnosisReport: map['diagnosisReport'],
      repairReport: map['repairReport'],
      warrantyDays: map['warrantyDays'],
      customerApproved: map['customerApproved'],
      approvalDeadline: map['approvalDeadline'] != null ? DateTime.parse(map['approvalDeadline']) : null,
      customerAddress: map['customerAddress'],
      customerLat: map['customerLat']?.toDouble(),
      customerLng: map['customerLng']?.toDouble(),
      images: map['images'] != null ? List<String>.from(map['images']) : null,
      hasNewIssue: map['hasNewIssue'],
      additionalCost: map['additionalCost']?.toDouble(),
      additionalCostApproved: map['additionalCostApproved'],
    );
  }

  // تحويل ServiceRequestModel إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'requestNumber': requestNumber,
      'deviceType': deviceType,
      'brand': brand,
      'model': model,
      'issueDescription': issueDescription,
      'serviceType': _serviceTypeToString(serviceType),
      'hasWarranty': hasWarranty,
      'warrantyCost': warrantyCost,
      'estimatedCost': estimatedCost,
      'finalCost': finalCost,
      'status': _statusToString(status),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'assignedTechnicianId': assignedTechnicianId,
      'assignedDeliveryId': assignedDeliveryId,
      'diagnosisReport': diagnosisReport,
      'repairReport': repairReport,
      'warrantyDays': warrantyDays,
      'customerApproved': customerApproved,
      'approvalDeadline': approvalDeadline?.toIso8601String(),
      'customerAddress': customerAddress,
      'customerLat': customerLat,
      'customerLng': customerLng,
      'images': images,
      'hasNewIssue': hasNewIssue,
      'additionalCost': additionalCost,
      'additionalCostApproved': additionalCostApproved,
    };
  }

  // تحويل String إلى ServiceType
  static ServiceType _parseServiceType(String type) {
    switch (type) {
      case 'online': return ServiceType.online;
      case 'onSite': return ServiceType.onSite;
      default: return ServiceType.delivery;
    }
  }

  // تحويل ServiceType إلى String
  static String _serviceTypeToString(ServiceType type) {
    switch (type) {
      case ServiceType.online: return 'online';
      case ServiceType.onSite: return 'onSite';
      default: return 'delivery';
    }
  }

  // تحويل String إلى RequestStatus
  static RequestStatus _parseStatus(String status) {
    switch (status) {
      case 'accepted': return RequestStatus.accepted;
      case 'assigned': return RequestStatus.assigned;
      case 'pickedUp': return RequestStatus.pickedUp;
      case 'underDiagnosis': return RequestStatus.underDiagnosis;
      case 'diagnosisCompleted': return RequestStatus.diagnosisCompleted;
      case 'waitingApproval': return RequestStatus.waitingApproval;
      case 'approved': return RequestStatus.approved;
      case 'underRepair': return RequestStatus.underRepair;
      case 'repaired': return RequestStatus.repaired;
      case 'qualityCheck': return RequestStatus.qualityCheck;
      case 'readyForDelivery': return RequestStatus.readyForDelivery;
      case 'delivered': return RequestStatus.delivered;
      case 'completed': return RequestStatus.completed;
      case 'cancelled': return RequestStatus.cancelled;
      case 'rejected': return RequestStatus.rejected;
      default: return RequestStatus.pending;
    }
  }

  // تحويل RequestStatus إلى String
  static String _statusToString(RequestStatus status) {
    switch (status) {
      case RequestStatus.accepted: return 'accepted';
      case RequestStatus.assigned: return 'assigned';
      case RequestStatus.pickedUp: return 'pickedUp';
      case RequestStatus.underDiagnosis: return 'underDiagnosis';
      case RequestStatus.diagnosisCompleted: return 'diagnosisCompleted';
      case RequestStatus.waitingApproval: return 'waitingApproval';
      case RequestStatus.approved: return 'approved';
      case RequestStatus.underRepair: return 'underRepair';
      case RequestStatus.repaired: return 'repaired';
      case RequestStatus.qualityCheck: return 'qualityCheck';
      case RequestStatus.readyForDelivery: return 'readyForDelivery';
      case RequestStatus.delivered: return 'delivered';
      case RequestStatus.completed: return 'completed';
      case RequestStatus.cancelled: return 'cancelled';
      case RequestStatus.rejected: return 'rejected';
      default: return 'pending';
    }
  }

  // نسخة جديدة مع تحديث الحقول
  ServiceRequestModel copyWith({
    String? deviceType,
    String? brand,
    String? model,
    String? issueDescription,
    ServiceType? serviceType,
    bool? hasWarranty,
    double? warrantyCost,
    double? estimatedCost,
    double? finalCost,
    RequestStatus? status,
    DateTime? updatedAt,
    String? assignedTechnicianId,
    String? assignedDeliveryId,
    String? diagnosisReport,
    String? repairReport,
    int? warrantyDays,
    bool? customerApproved,
    DateTime? approvalDeadline,
    bool? hasNewIssue,
    double? additionalCost,
    bool? additionalCostApproved,
  }) {
    return ServiceRequestModel(
      id: id,
      userId: userId,
      requestNumber: requestNumber,
      deviceType: deviceType ?? this.deviceType,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      issueDescription: issueDescription ?? this.issueDescription,
      serviceType: serviceType ?? this.serviceType,
      hasWarranty: hasWarranty ?? this.hasWarranty,
      warrantyCost: warrantyCost ?? this.warrantyCost,
      estimatedCost: estimatedCost ?? this.estimatedCost,
      finalCost: finalCost ?? this.finalCost,
      status: status ?? this.status,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      assignedTechnicianId: assignedTechnicianId ?? this.assignedTechnicianId,
      assignedDeliveryId: assignedDeliveryId ?? this.assignedDeliveryId,
      diagnosisReport: diagnosisReport ?? this.diagnosisReport,
      repairReport: repairReport ?? this.repairReport,
      warrantyDays: warrantyDays ?? this.warrantyDays,
      customerApproved: customerApproved ?? this.customerApproved,
      approvalDeadline: approvalDeadline ?? this.approvalDeadline,
      customerAddress: customerAddress,
      customerLat: customerLat,
      customerLng: customerLng,
      images: images,
      hasNewIssue: hasNewIssue ?? this.hasNewIssue,
      additionalCost: additionalCost ?? this.additionalCost,
      additionalCostApproved: additionalCostApproved ?? this.additionalCostApproved,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    requestNumber,
    deviceType,
    brand,
    model,
    issueDescription,
    serviceType,
    hasWarranty,
    warrantyCost,
    estimatedCost,
    finalCost,
    status,
    createdAt,
    updatedAt,
    assignedTechnicianId,
    assignedDeliveryId,
    diagnosisReport,
    repairReport,
    warrantyDays,
    customerApproved,
    approvalDeadline,
    customerAddress,
    customerLat,
    customerLng,
    images,
    hasNewIssue,
    additionalCost,
    additionalCostApproved,
  ];
}