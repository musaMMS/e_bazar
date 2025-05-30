import 'package:e_bazar/Ui%20/splash_log_sing_/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();

  String _phone = '';

  // Email Validation Regex
  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  // Password Validation: min 6 char with at least one number and one letter (optional)
  bool isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool isAgeValid(String ageStr) {
    try {
      final age = int.parse(ageStr);
      return age >= 13 && age <= 120; // realistic age range
    } catch (e) {
      return false;
    }
  }

  Future<void> _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final age = _ageController.text.trim();

    if (email.isEmpty || password.isEmpty || _phone.isEmpty || age.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("সব তথ্য দিন")),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'phone': _phone,
          'age': age,
        },
      );

      if (response.user != null) {
        // সাইনআপের পরে অটো লগইন করানো:
        final loginResponse = await Supabase.instance.client.auth.signInWithPassword(
          email: email,
          password: password,
        );

        if (loginResponse.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("অ্যাকাউন্ট তৈরি হয়েছে এবং লগইন হয়েছে ✅")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("লগইন করতে সমস্যা হয়েছে")),
          );
        }
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ত্রুটি: ${e.message}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("সমস্যা হয়েছে!")),
      );
    }
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    super.dispose();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.08),
                  Text(
                    "Create\nAccount",
                    style: TextStyle(
                      fontSize: titleFontSize.clamp(24, 36),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Optional: Image picker logic
                      },
                      child: CircleAvatar(
                        radius: screenWidth * 0.12,
                        backgroundColor: Colors.blue.withOpacity(0.2),
                        child: Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.blue,
                          size: screenWidth * 0.08,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    hint: "Email",
                    controller: _emailController,
                    screenWidth: screenWidth,
                    fieldVerticalPadding: fieldVerticalPadding,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "ইমেইল দিন";
                      }
                      if (!emailRegex.hasMatch(value.trim())) {
                        return "সঠিক ইমেইল দিন";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildTextField(
                    hint: "Password",
                    controller: _passwordController,
                    screenWidth: screenWidth,
                    fieldVerticalPadding: fieldVerticalPadding,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "পাসওয়ার্ড দিন";
                      }
                      if (!isPasswordValid(value)) {
                        return "কমপক্ষে ৬ অক্ষর দিন";
                      }
                      return null;
                    }, keyboardType: TextInputType.visiblePassword,
                  ),
                  _buildTextField(
                    hint: "Age",
                    controller: _ageController,
                    screenWidth: screenWidth,
                    fieldVerticalPadding: fieldVerticalPadding,
                    inputType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "বয়স দিন";
                      }
                      if (!isAgeValid(value.trim())) {
                        return "সঠিক বয়স দিন (১৩ থেকে ১২০)";
                      }
                      return null;
                    }, keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(fontSize: (screenWidth * 0.04).clamp(14, 18)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: fieldVerticalPadding,
                      ),
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      setState(() {
                        _phone = phone.completeNumber;
                      });
                    },
                    validator: (phone) {
                      if (phone == null || phone.number.isEmpty) {
                        return "ফোন নম্বর দিন";
                      }
                      return null;
                    },
                  ),
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
                      onPressed: _isLoading ? null : _signUp,
                      child: _isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        "Done",
                        style: TextStyle(
                          fontSize: buttonFontSize.clamp(14, 18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: _isLoading ? null : () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: buttonFontSize.clamp(14, 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    required double screenWidth,
    required double fieldVerticalPadding,
    bool isPassword = false,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator, required TextInputType keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && !_isPasswordVisible,
        keyboardType: inputType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: (screenWidth * 0.04).clamp(14, 18)),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: fieldVerticalPadding),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
