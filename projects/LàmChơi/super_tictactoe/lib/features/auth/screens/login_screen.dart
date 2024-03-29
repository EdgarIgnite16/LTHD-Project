import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/contants/images.dart';
import 'package:todo_app/contants/widgets.dart';
import 'package:todo_app/features/auth/controllers/login_controller.dart';

class SigningScreen extends StatefulWidget {


  SigningScreen({super.key});

  @override
  State<SigningScreen> createState() => _SigningScreenState();
}

class _SigningScreenState extends State<SigningScreen> {
  final LoginController _loginController = LoginController();

  bool _isShow = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildListViewLogin(context),
      ),
    );
  }

  Widget _buildListViewLogin(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Image.asset(iBannerLogin),
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        render20pxSpaceVertical(),
        TextFormField(
          controller: _passwordController,
          obscureText: _isShow,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            labelText: 'Mật khẩu',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isShow = !_isShow;
                });
              },
              icon: _isShow
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
          ),
        ),
        render20pxSpaceVertical(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Nếu bạn không có tài khoản!!!"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/signup'
                    );
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  child: const Text(
                    "Tạo tài khoản",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent)),
              child: const Text(
                "Quên mật khẩu?",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: _signIn,
          child: const Text(
            'Đăng nhập',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _loginController.signing(email, password);
    if(user == null) {
      print('tai khoan khong tont tai');
    } else {
      String username = await _loginController.getUsername(email);
      setState(() {
        print(username);
        Navigator.pushReplacementNamed(context, '/home', arguments: username);
      });
    }
  }

  AppBar _buildLoginAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'Login',
        style: TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }
}
