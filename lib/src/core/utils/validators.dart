// أدوات التحقق من صحة البيانات
class Validators {
  // التحقق من البريد الإلكتروني
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorEmptyField;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.errorInvalidEmail;
    }
    return null;
  }
  
  // التحقق من كلمة المرور
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorEmptyField;
    }
    if (value.length < 6) {
      return AppStrings.errorShortPassword;
    }
    return null;
  }
  
  // التحقق من تأكيد كلمة المرور
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.errorEmptyField;
    }
    if (password != confirmPassword) {
      return AppStrings.errorPasswordMismatch;
    }
    return null;
  }
  
  // التحقق من رقم الهاتف العراقي
  static String? validateIraqiPhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorEmptyField;
    }
    final phoneRegex = RegExp(r'^(\+964|0)?7[0-9]{9}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'\s+'), ''))) {
      return AppStrings.errorInvalidPhone;
    }
    return null;
  }
  
  // التحقق من الحقول النصية
  static String? validateText(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال $fieldName';
    }
    if (value.length < 2) {
      return '$fieldName يجب أن يكون على الأقل حرفين';
    }
    return null;
  }
  
  // التحقق من السعر
  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال السعر';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'يرجى إدخال سعر صحيح';
    }
    return null;
  }
}