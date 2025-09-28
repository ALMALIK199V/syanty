import 'package:intl/intl.dart';
import 'package:saianati_app/src/core/constants/app_constants.dart';

// أدوات مساعدة متنوعة
class Helpers {
  // تنسيق السعر بالدينار العراقي
  static String formatPrice(double price) {
    final formatter = NumberFormat('#,###');
    return '${formatter.format(price)} ${AppConstants.currencySymbol}';
  }
  
  // تنسيق التاريخ
  static String formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd - hh:mm a', 'ar').format(date);
  }
  
  // حساب الوقت المتبقي
  static String calculateTimeRemaining(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);
    
    if (difference.isNegative) {
      return 'انتهى الوقت';
    }
    
    if (difference.inDays > 0) {
      return '${difference.inDays} يوم';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ساعة';
    } else {
      return '${difference.inMinutes} دقيقة';
    }
  }
  
  // الحصول على اسم حالة الطلب
  static String getStatusText(String status) {
    return AppConstants.requestStatus[status] ?? 'غير معروف';
  }
  
  // الحصول على لون حسب حالة الطلب
  static Color getStatusColor(String status) {
    switch (status) {
      case 'completed':
      case 'delivered':
        return AppTheme.success;
      case 'cancelled':
      case 'rejected':
        return AppTheme.error;
      case 'waitingApproval':
        return AppTheme.warning;
      default:
        return AppTheme.info;
    }
  }
  
  // حساب تكلفة الضمان
  static double calculateWarrantyCost(double baseCost) {
    return baseCost * AppConstants.warrantyPercentage;
  }
  
  // التحقق من انتهاء المهلة
  static bool isDeadlinePassed(DateTime? deadline) {
    if (deadline == null) return false;
    return DateTime.now().isAfter(deadline);
  }
  
  // إنشاء رقم طلب عشوائي
  static String generateRequestNumber() {
    final now = DateTime.now();
    final random = DateTime.now().millisecond;
    return 'SA${now.year}${now.month}${now.day}${random}';
  }
}