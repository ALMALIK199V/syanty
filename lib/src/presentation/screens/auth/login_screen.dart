import 'package:flutter/material.dart';
import 'package:saianati_app/src/data/models/user_model.dart';
import 'package:saianati_app/src/presentation/screens/customer/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // بيانات تسجيل الدخول التجريبية
  final _mockDataSource = MockDataSource();

  void _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showError('يرجى ملء جميع الحقول');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _mockDataSource.loginWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text,
      );

      // الانتقال للشاشة الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CustomerHomeScreen(user: user)),
      );
      
    } catch (e) {
      _showError(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 80),
            
            // شعار التطبيق
            const Icon(
              Icons.build_circle,
              size: 100,
              color: Colors.green,
            ),
            
            const SizedBox(height: 24),
            const Text(
              'مرحباً بعودتك!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'سجل الدخول إلى حسابك',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            
            const SizedBox(height: 40),
            
            // حقل البريد الإلكتروني
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            
            const SizedBox(height: 16),
            
            // حقل كلمة المرور
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            
            const SizedBox(height: 24),
            
            // زر تسجيل الدخول
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
            
            const SizedBox(height: 20),
            
            // معلومات الحساب التجريبي
            Card(
              color: Colors.blue[50],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'بيانات اختبار:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('البريد: test@test.com'),
                    Text('كلمة المرور: 123456'),
                    SizedBox(height: 8),
                    Text('البريد: tech@test.com'),
                    Text('كلمة المرور: 123456'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}