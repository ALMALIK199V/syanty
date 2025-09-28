import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:saianati_app/src/data/models/user_model.dart';
import 'package:saianati_app/src/data/models/service_request_model.dart';
import 'package:saianati_app/src/data/models/chat_model.dart';

// مصدر بيانات Firebase
class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // 🔐 المصادقة
  Future<UserModel> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await _getUserModel(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw InvalidCredentialsException();
      }
      throw ServerException();
    }
  }

  Future<UserModel> registerWithEmailAndPassword(
    String name, String email, String phone, String password, String userType) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        type: UserType.customer, // افتراضيًا عميل
        joinedAt: DateTime.now(),
        walletBalance: 0,
        points: 0,
        isActive: true,
      );
      
      await _firestore.collection('users').doc(userModel.id).set(userModel.toMap());
      return userModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyExistsException();
      }
      throw ServerException();
    }
  }

  Future<String> loginWithPhone(String phone) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          throw ServerException();
        },
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return 'verificationId';
    } catch (e) {
      throw ServerException();
    }
  }

  Future<UserModel> verifyPhoneCode(String verificationId, String code) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );
      
      final userCredential = await _auth.signInWithCredential(credential);
      return await _getUserModel(userCredential.user!.uid);
    } catch (e) {
      throw InvalidCredentialsException();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      return await _getUserModel(user.uid);
    }
    return null;
  }

  Future<void> updateProfile(String name, String phone, String? avatar) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'name': name,
          'phone': phone,
          if (avatar != null) 'avatar': avatar,
        });
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> updatePassword(String oldPassword, String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } catch (e) {
      throw InvalidCredentialsException();
    }
  }

  // 📱 إدارة طلبات الصيانة
  Future<String> createServiceRequest(ServiceRequestModel request) async {
    try {
      final docRef = await _firestore.collection('service_requests').add(request.toMap());
      return docRef.id;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<ServiceRequestModel>> getUserRequests(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('service_requests')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();
      
      return snapshot.docs.map((doc) {
        return ServiceRequestModel.fromMap({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> updateRequestStatus(String requestId, String status) async {
    try {
      await _firestore.collection('service_requests').doc(requestId).update({
        'status': status,
        'updatedAt': DateTime.now(),
      });
    } catch (e) {
      throw ServerException();
    }
  }

  // 💬 إدارة المحادثات
  Future<void> sendMessage(ChatModel message) async {
    try {
      await _firestore
          .collection('service_requests')
          .doc(message.requestId)
          .collection('chats')
          .add(message.toMap());
    } catch (e) {
      throw ServerException();
    }
  }

  Stream<List<ChatModel>> getChatStream(String requestId) {
    return _firestore
        .collection('service_requests')
        .doc(requestId)
        .collection('chats')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatModel.fromMap({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    });
  }

  // 🛠️ أدوات مساعدة
  Future<UserModel> _getUserModel(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserModel.fromMap({
        'id': doc.id,
        ...doc.data()!,
      });
    }
    throw ServerException();
  }
}