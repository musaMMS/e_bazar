import 'package:e_bazar/Ui%20/splash_log_sing_/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Bubbles.png', // Ensure this image exists
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create\nAccount",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: (){},
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      child: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),

                ),
                _buildTextField("Email"),
                _buildTextField("Password", isPassword: true),

                const SizedBox(height: 15),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'BD', // Default country (Bangladesh)
                  onChanged: (phone) {
                    print(phone.completeNumber); // Get full phone number
                  },
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    // Handle form submission
                  },
                  child: Text("Done", style: TextStyle(fontSize: 16)),
                ),

                Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle cancel action
                    },
                    child: Text("Cancel", style: TextStyle(color: Colors.black54)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: isPassword ? Icon(Icons.visibility_off) : null,
        ),
      ),
    );
  }
}
