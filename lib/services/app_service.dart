import '../models/user_model.dart';
import '../models/service_model.dart';
import '../models/chat_model.dart';

class AppService {
  static final AppService _instance = AppService._internal();
  factory AppService() => _instance;
  AppService._internal();

  // بيانات التطبيق الحقيقية
  UserModel? _currentUser;
  final List<ServiceRequest> _serviceRequests = [];
  final List<ChatMessage> _chatMessages = [];

  // المستخدم الحالي
  UserModel? get currentUser => _currentUser;
  set currentUser(UserModel? user) => _currentUser = user;

  // إدارة طلبات الصيانة
  List<ServiceRequest> get serviceRequests => _serviceRequests;
  
  void addServiceRequest(ServiceRequest request) {
    _serviceRequests.add(request);
    _notifyListeners();
  }

  void updateRequestStatus(String requestId, String newStatus) {
    final index = _serviceRequests.indexWhere((req) => req.id == requestId);
    if (index != -1) {
      _serviceRequests[index] = _serviceRequests[index].copyWith(status: newStatus);
      _notifyListeners();
    }
  }

  List<ServiceRequest> getUserRequests(String userId) {
    return _serviceRequests.where((req) => req.userId == userId).toList();
  }

  // إدارة المحادثات
  List<ChatMessage> getChatMessages(String requestId) {
    return _chatMessages.where((msg) => msg.requestId == requestId).toList();
  }

  void sendMessage(ChatMessage message) {
    _chatMessages.add(message);
    _notifyListeners();
  }

  // الدفع والمحفظة
  void addToWallet(double amount) {
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(
        walletBalance: _currentUser!.walletBalance + amount
      );
      _notifyListeners();
    }
  }

  void deductFromWallet(double amount) {
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(
        walletBalance: _currentUser!.walletBalance - amount
      );
      _notifyListeners();
    }
  }

  // الإشعارات
  void _notifyListeners() {
    // سيتم ربطه بـ Provider لاحقاً
  }
}