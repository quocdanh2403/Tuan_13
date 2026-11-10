
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterPage(),
    );
  }
}
 
// ----- 3 quy tắc kiểm tra: đúng trả về null, sai trả về thông báo lỗi -----
 
String? validateEmail(String? v) {
  final s = (v ?? '').trim();
  if (s.isEmpty) return 'Vui lòng nhập email';
  if (!RegExp(r'^[\w.\-]+@([\w\-]+\.)+\w{2,}$').hasMatch(s)) {
    return 'Email không đúng định dạng';
  }
  return null;
}
 
String? validatePhone(String? v) {
  final s = (v ?? '').trim();
  if (s.isEmpty) return 'Vui lòng nhập số điện thoại';
  if (!RegExp(r'^0\d{9}$').hasMatch(s)) {
    return 'Số điện thoại gồm 10 số, bắt đầu bằng 0';
  }
  return null;
}
 
String? validatePassword(String? v) {
  final s = v ?? '';
  if (s.isEmpty) return 'Vui lòng nhập mật khẩu';
  if (s.length < 6) return 'Mật khẩu tối thiểu 6 ký tự';
  return null;
}
 
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
 
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
 
class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
 
  void _submit() {
    // validate() chạy validator của cả 3 ô, đúng hết thì trả về true
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng ký thành công')),
      );
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng ký tài khoản')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          // chỉ báo lỗi sau khi người dùng bắt đầu nhập
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.phone,
                // chỉ cho gõ số, tối đa 10 số
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                ),
                validator: validatePhone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                validator: validatePassword,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Đăng ký'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
