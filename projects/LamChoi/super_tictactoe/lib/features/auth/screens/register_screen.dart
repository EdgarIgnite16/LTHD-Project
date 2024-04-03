import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/contants/images.dart';
import 'package:todo_app/contants/widgets.dart';
import 'package:todo_app/features/auth/controllers/register_controller.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegisterController _signUpController = RegisterController();

  bool _isPasswordShow = false;
  bool _isRePasswordShow = false;

  final TextEditingController _usernameControllers = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListViewSignUp(),
    );
  }

  Widget _buildListViewSignUp() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(iBannerLogin),
          ),
          _buildUsernameFormField(),
          render20pxSpaceVertical(),
          _buildEmailFormField(),
          render20pxSpaceVertical(),
          _buildPasswordFormField(),
          render20pxSpaceVertical(),
          _buildRePasswordFormField(),
          render20pxSpaceVertical(),
          _buildSignUpElevatedButton(),
          render20pxSpaceVertical(),
          _buildBackToSignInElevatedButton(),
        ],
      ),
    );
  }

  Widget _buildUsernameFormField() {
    return TextFormField(
      controller: _usernameControllers,
      validator: (username) => username!.isEmpty ? 'Không được để trống' : _checkValidUsername(username),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        labelText: 'Tên tài khoản',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      validator: (email) => email!.isEmpty ? 'Không được để trống' : _checkValidEmail(email),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordShow,
      validator: (password) => password!.isEmpty ? 'Không được để trống' : _checkValidPassword(),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _isPasswordShow = !_isPasswordShow;
            });
          },
          icon: _isPasswordShow ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
        labelText: 'Mật khẩu',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildRePasswordFormField() {
    return TextFormField(
      controller: _rePasswordController,
      obscureText: !_isRePasswordShow,
      validator: (rePassword) => rePassword!.isEmpty ? 'Không dược để trống' : _checkValidPassword(),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        labelText: 'Nhập lại mật khẩu',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isRePasswordShow =! _isRePasswordShow;
            });
          },
          icon: _isRePasswordShow ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildSignUpElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          bool validate = _formKey.currentState!.validate();
          if (validate) {
            _signup();
          }
        });
      },
      child: Text(
        "Đăng ký",
        style: TextStyle(color: Colors.red),
      ),
    );
  }


  Widget _buildBackToSignInElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Trở về đăng nhập",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameControllers.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  String? _checkValidPassword() {
    String password = _passwordController.text;
    String rePassword= _rePasswordController.text;

    if (password.length < 6) {
      return 'Mật khẩu tối thiểu 6 kí tự';
    } else if (password != rePassword) {
      return 'Mật khẩu không trùng khớp';
    }
    return null;
  }

  String? _checkValidEmail(String? email) {
    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return !emailRegex.hasMatch(email ?? '') ? "Email không hợp lệ" : null;
  }


  String? _checkValidUsername(String? username) {
    RegExp usernameRegex = RegExp(r'[!@#$%^&*(),?":{}|<>]');
    return usernameRegex.hasMatch(username ?? '') ? "Tên không hợp lệ" : null;
  }

  void _signup() async {
    String username = _usernameControllers.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? signupUser = await _signUpController.signup(username, email, password);

    if(signupUser == null) {
      print('Tai khoan da ton tai');
    } else {
      setState(() {
        Navigator.pop(context);
      });
    }
  }
}
