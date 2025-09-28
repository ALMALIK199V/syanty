import 'package:flutter/material.dart';
import 'package:saianati_app/src/data/models/user_model.dart';

class CustomerHomeScreen extends StatelessWidget {
  final UserModel user;
  
  const CustomerHomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صيانتي'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معلومات المستخدم
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مرحباً، ${user.name}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(user.email),
                          Text('رصيد المحفظة: ${user.walletBalance} د.ع'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // الخدمات السريعة
            const Text(
              'الخدمات',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildServiceCard(
                  Icons.build_circle,
                  'طلب صيانة',
                  Colors.green,
                  () {
                    // TODO: الانتقال لشاشة طلب الصيانة
                  },
                ),
                _buildServiceCard(
                  Icons.track_changes,
                  'تتبع الطلب',
                  Colors.blue,
                  () {
                    // TODO: الانتقال لشاشة التتبع
                  },
                ),
                _buildServiceCard(
                  Icons.history,
                  'طلباتي',
                  Colors.orange,
                  () {
                    // TODO: الانتقال لسجل الطلبات
                  },
                ),
                _buildServiceCard(
                  Icons.chat,
                  'المحادثات',
                  Colors.purple,
                  () {
                    // TODO: الانتقال للمحادثات
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}