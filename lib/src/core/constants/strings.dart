// نصوص التطبيق بالعربية
class AppStrings {
  // نصوص عامة
  static const String appName = 'صيانتي';
  static const String welcome = 'مرحباً بك في صيانتي';
  static const String loading = 'جاري التحميل...';
  static const String retry = 'إعادة المحاولة';
  static const String error = 'حدث خطأ';
  static const String success = 'تم بنجاح';
  static const String confirm = 'تأكيد';
  static const String cancel = 'إلغاء';
  static const String save = 'حفظ';
  static const String next = 'التالي';
  static const String back = 'السابق';
  static const String done = 'تم';
  
  // نصوص المصادقة
  static const String login = 'تسجيل الدخول';
  static const String register = 'إنشاء حساب';
  static const String email = 'البريد الإلكتروني';
  static const String phone = 'رقم الهاتف';
  static const String password = 'كلمة المرور';
  static const String confirmPassword = 'تأكيد كلمة المرور';
  static const String forgotPassword = 'نسيت كلمة المرور؟';
  static const String dontHaveAccount = 'ليس لديك حساب؟';
  static const String alreadyHaveAccount = 'لديك حساب بالفعل؟';
  
  // نصوص خدمات الصيانة
  static const String requestService = 'طلب خدمة صيانة';
  static const String deviceType = 'نوع الجهاز';
  static const String brand = 'الشركة المصنعة';
  static const String model = 'الموديل';
  static const String issueDescription = 'وصف المشكلة';
  static const String serviceType = 'نوع الخدمة';
  static const String addWarranty = 'إضافة ضمان';
  static const String warrantyInfo = 'ضمان شامل لمدة 30 يوم بسعر إضافي';
  static const String estimatedCost = 'التكلفة المقدرة';
  static const String finalCost = 'التكلفة النهائية';
  static const String trackRequest = 'تتبع الطلب';
  static const String requestHistory = 'سجل الطلبات';
  
  // نصوص حالة الطلب
  static const String requestCreated = 'تم إنشاء الطلب';
  static const String underReview = 'جاري المراجعة';
  static const String technicianAssigned = 'تم تعيين فني';
  static const String devicePickedUp = 'تم استلام الجهاز';
  static const String underDiagnosis = 'جاري التشخيص';
  static const String diagnosisComplete = 'تم الانتهاء من التشخيص';
  static const String waitingCostApproval = 'بانتظار موافقتك على السعر';
  static const String costApproved = 'تمت الموافقة على السعر';
  static const String underRepair = 'جاري الإصلاح';
  static const String repairComplete = 'تم الإصلاح';
  static const String qualityCheck = 'جاري الفحص النهائي';
  static const String readyForDelivery = 'جاهز للتسليم';
  static const String delivered = 'تم التسليم';
  
  // نصوص الدفع
  static const String payment = 'الدفع';
  static const String paymentMethods = 'طرق الدفع';
  static const String onlinePayment = 'دفع إلكتروني';
  static const String cashOnDelivery = 'دفع عند الاستلام';
  static const String wallet = 'المحفظة';
  static const String points = 'النقاط';
  static const String discountCoupon = 'كوبون خصم';
  static const String totalAmount = 'المبلغ الإجمالي';
  static const String payNow = 'ادفع الآن';
  
  // نصوص المحادثة
  static const String chat = 'محادثة';
  static const String typeMessage = 'اكتب رسالة...';
  static const String send = 'إرسال';
  static const String technicalAdvice = 'استشارة فنية';
  static const String onlineConsultation = 'استشارة أونلاين';
  
  // نصوص الملف الشخصي
  static const String profile = 'الملف الشخصي';
  static const String editProfile = 'تعديل الملف الشخصي';
  static const String myRequests = 'طلباتي';
  static const String walletBalance = 'رصيد المحفظة';
  static const String myPoints = 'نقاطي';
  static const String settings = 'الإعدادات';
  static const String logout = 'تسجيل الخروج';
  
  // نصوص الإشعارات
  static const String notifications = 'الإشعارات';
  static const String newRequest = 'طلب جديد';
  static const String statusUpdated = 'تم تحديث الحالة';
  static const String newMessage = 'رسالة جديدة';
  static const String paymentReceived = 'تم استلام الدفع';
  
  // نصوص الأخطاء
  static const String errorEmptyField = 'هذا الحقل مطلوب';
  static const String errorInvalidEmail = 'بريد إلكتروني غير صالح';
  static const String errorShortPassword = 'كلمة المرور قصيرة جداً';
  static const String errorPasswordMismatch = 'كلمات المرور غير متطابقة';
  static const String errorInvalidPhone = 'رقم هاتف غير صالح';
  static const String errorNetwork = 'خطأ في الاتصال بالإنترنت';
  static const String errorServer = 'خطأ في الخادم';
  static const String errorUnauthorized = 'غير مصرح بالدخول';
}