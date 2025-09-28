import 'package:flutter/material.dart';
import '../../models/user_model.dart';  // مسار نسبي صحيح
import '../customer/home_screen.dart';  // مسار نسبي صحيح

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // بيانات المستخدمين التجريبية
  final List<UserModel> _users = [
    UserModel(
      id: '1',
      name: 'علي حسين',
      email: 'customer@test.com',
      phone: '07701234567',
      userType: 'customer',
      walletBalance: 150000,
      points: 150,
    ),
    UserModel(
      id: '2',
      name: 'أحمد الفني',
      email: 'tech@test.com',
      phone: '07707654321',
      userType: 'technician',
      walletBalance: 75000,
      points: 75,
    ),
  ];

  void _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showMessage('يرجى ملء جميع الحقول', Colors.orange);
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = _users.firstWhere(
        (user) => user.email == _emailController.text.trim(),
      );

      if (_passwordController.text != '123456') {
        throw Exception('كلمة المرور غير صحيحة');
      }

      // الانتقال للشاشة الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
      );

    } catch (e) {
      _showMessage('بيانات الدخول غير صحيحة', Colors.red);
      setState(() => _isLoading = false);
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.build, size: 100, color: Colors.green),
            const SizedBox(height: 24),
            const Text('صيانتي', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: const Text('تسجيل الدخول'),
                  ),
            const SizedBox(height: 20),
            const Text('test@test.com / 123456'),
          ],
        ),
      ),
    );
  }
}