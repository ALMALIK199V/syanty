import 'package:equatable/equatable.dart';

// أنواع الرسائل
enum MessageType {
  text,     // نص
  image,    // صورة
  file,     // ملف
  system,   // نظام
  quote,    // عرض سعر
  status    // حالة الطلب
}

// نموذج المحادثة
class ChatModel extends Equatable {
  final String id;
  final String requestId;
  final String senderId;
  final String senderName;
  final MessageType type;
  final String message;
  final String? imageUrl;
  final String? fileUrl;
  final String? fileName;
  final double? quotedPrice;
  final String? statusUpdate;
  final DateTime timestamp;
  final bool isRead;

  const ChatModel({
    required this.id,
    required this.requestId,
    required this.senderId,
    required this.senderName,
    required this.type,
    required this.message,
    this.imageUrl,
    this.fileUrl,
    this.fileName,
    this.quotedPrice,
    this.statusUpdate,
    required this.timestamp,
    this.isRead = false,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] ?? '',
      requestId: map['requestId'] ?? '',
      senderId: map['senderId'] ?? '',
      senderName: map['senderName'] ?? '',
      type: _parseMessageType(map['type']),
      message: map['message'] ?? '',
      imageUrl: map['imageUrl'],
      fileUrl: map['fileUrl'],
      fileName: map['fileName'],
      quotedPrice: map['quotedPrice']?.toDouble(),
      statusUpdate: map['statusUpdate'],
      timestamp: DateTime.parse(map['timestamp']),
      isRead: map['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requestId': requestId,
      'senderId': senderId,
      'senderName': senderName,
      'type': _messageTypeToString(type),
      'message': message,
      'imageUrl': imageUrl,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'quotedPrice': quotedPrice,
      'statusUpdate': statusUpdate,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  static MessageType _parseMessageType(String type) {
    switch (type) {
      case 'image': return MessageType.image;
      case 'file': return MessageType.file;
      case 'system': return MessageType.system;
      case 'quote': return MessageType.quote;
      case 'status': return MessageType.status;
      default: return MessageType.text;
    }
  }

  static String _messageTypeToString(MessageType type) {
    switch (type) {
      case MessageType.image: return 'image';
      case MessageType.file: return 'file';
      case MessageType.system: return 'system';
      case MessageType.quote: return 'quote';
      case MessageType.status: return 'status';
      default: return 'text';
    }
  }

  @override
  List<Object?> get props => [
    id,
    requestId,
    senderId,
    senderName,
    type,
    message,
    imageUrl,
    fileUrl,
    fileName,
    quotedPrice,
    statusUpdate,
    timestamp,
    isRead,
  ];
}