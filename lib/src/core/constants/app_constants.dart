// ثوابت التطبيق العامة
class AppConstants {
  // أوقات الانتظار
  static const int approvalDeadlineHours = 48; // مهلة الموافقة على السعر
  static const int reviewDeadlineDays = 15; // مهلة المراجعة
  
  // أنواع الخدمات
  static const List<String> serviceTypes = [
    'توصيل (تسليم واستلام)',
    'صيانة عن بعد',
    'صيانة في الموقع'
  ];
  
  // أنواع الأجهزة
  static const List<String> deviceTypes = [
    'هاتف محمول',
    'تابلت',
    'لابتوب',
    'كمبيوتر مكتبي',
    'طابعة',
    'كاميرا',
    'درون',
    'جهاز طبي'
  ];
  
  // حالات الطلب
  static const Map<String, String> requestStatus = {
    'pending': 'بانتظار المراجعة',
    'accepted': 'تم القبول',
    'assigned': 'تم التعيين',
    'pickedUp': 'تم الاستلام',
    'underDiagnosis': 'جاري التشخيص',
    'diagnosisCompleted': 'تم التشخيص',
    'waitingApproval': 'بانتظار الموافقة',
    'approved': 'تمت الموافقة',
    'underRepair': 'جاري الإصلاح',
    'repaired': 'تم الإصلاح',
    'qualityCheck': 'جاري الفحص النهائي',
    'readyForDelivery': 'جاهز للتسليم',
    'delivered': 'تم التسليم',
    'completed': 'مكتمل',
    'cancelled': 'ملغي',
    'rejected': 'مرفوض'
  };
  
  // أسعار الضمان (نسب مئوية)
  static const double warrantyPercentage = 0.15; // 15% زيادة للضمان
  
  // العملة
  static const String currency = 'دينار عراقي';
  static const String currencySymbol = 'د.ع';
}