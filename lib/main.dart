import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthScreen());
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF1A237E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthCard(child: LoginForm()),
                  SizedBox(width: 20),
                  AuthCard(child: SignUpForm()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatelessWidget {
  final Widget child;
  const AuthCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 6),
        Center(
          child: Text(
            "Enter your credential to login",
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ),
        SizedBox(height: 30),
        inputField(Icons.person, "Username"),
        SizedBox(height: 12),
        inputField(Icons.lock, "Password", obscure: true),
        SizedBox(height: 30),
        mainButton("Login", () {}),
        SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? "),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 6),
        Center(
          child: Text(
            "Create your account",
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ),
        SizedBox(height: 30),
        inputField(Icons.person, "Username"),
        SizedBox(height: 12),
        inputField(Icons.email, "Email"),
        SizedBox(height: 12),
        inputField(Icons.lock, "Password", obscure: true),
        SizedBox(height: 12),
        inputField(Icons.lock, "Confirm Password", obscure: true),
        SizedBox(height: 30),
        mainButton("Sign up", () {}),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.shade400)),
            SizedBox(width: 10),
            Text("Or", style: TextStyle(color: Colors.grey[600])),
            SizedBox(width: 10),
            Expanded(child: Divider(color: Colors.grey.shade400)),
          ],
        ),
        SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.indigo,
            side: BorderSide(color: Colors.indigo),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
          child: Text(
            "Sign In with Google",
            style: TextStyle(fontSize: 16, color: Colors.indigo),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? "),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget inputField(IconData icon, String hint, {bool obscure = false}) {
  return TextField(
    obscureText: obscure,
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.grey),
      hintText: hint,
      filled: true,
      fillColor: Color(0xFFE3F2FD),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16),
    ),
  );
}

Widget mainButton(String text, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
    ),
  );
}
