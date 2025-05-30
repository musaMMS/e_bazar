import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Home/Home_screen.dart';
import 'CreateAn_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ইমেইল ও পাসওয়ার্ড দিন")),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("কিছু সমস্যা হয়েছে")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.08;
    double fieldVerticalPadding = screenWidth * 0.03;
    double buttonFontSize = screenWidth * 0.045;
    double buttonHeight = screenHeight * 0.065;
    double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Bubbles.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Text(
                  "Welcome\nBack!",
                  style: TextStyle(
                    fontSize: titleFontSize.clamp(24, 36),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                _buildTextField("Email", _emailController, screenWidth, fieldVerticalPadding),
                _buildTextField("Password", _passwordController, screenWidth, fieldVerticalPadding,
                    isPassword: true),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: buttonHeight.clamp(45, 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _login,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: buttonFontSize.clamp(14, 18),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                /// Forgot password and Create Account Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // TODO: Forgot password
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: buttonFontSize.clamp(14, 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text("|", style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CreateAccountScreen()),
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: buttonFontSize.clamp(14, 18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller,
      double screenWidth, double fieldVerticalPadding,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: (screenWidth * 0.04).clamp(14, 18),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: fieldVerticalPadding,
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}

