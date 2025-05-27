import 'package:dsdsoft_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool obscurePassword = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  shape: const CircleBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Welcome Text
              Text(
                "Welcome Back!",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1F5322),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please log in to access your account\nand continue where you left off.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 32),

              // Email Field
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration("Email", "example@gmail.com"),
              ),
              const SizedBox(height: 20),

              // Password Field
              StatefulBuilder(
                builder: (context, setState) {
                  return TextField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: _inputDecoration(
                      "Password",
                      "********",
                    ).copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => setState(() {
                          obscurePassword = !obscurePassword;
                        }),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),

              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, // Add logic
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F5322),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Center(child: Text("Or continue with")),
              const SizedBox(height: 16),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton("assets/icons/google.png"),
                  const SizedBox(width: 16),
                  _socialButton("assets/icons/apple.png"),
                ],
              ),
              const Spacer(),

              // Sign Up Prompt
              Center(
                child: GestureDetector(
                  onTap: () => context.push('/signup'),
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an Account? ",
                      style: TextStyle(color: Colors.black87),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    );
  }

  Widget _socialButton(String assetPath) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.grey.shade200,
      child: Image.asset(assetPath, width: 24, height: 24),
    );
  }
}
