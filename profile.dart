import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text("My Profile")),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.indigo,
                        child: Text(
                          "MV",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),

                      SizedBox(height: 15),
                      Text(
                        "MAHI VARSHNI",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("STUDENT"),
                      SizedBox(height: 20),

                      ContactRow(
                        icon: Icons.email,
                        text: "mahivarshni@example.com",
                      ),
                      SizedBox(height: 12),

                      ContactRow(icon: Icons.phone, text: "+91 8210000000"),
                      SizedBox(height: 12),

                      ContactRow(
                        icon: Icons.location_on,
                        text: "Chennai, India",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.indigo),
        const SizedBox(width: 12),
        Expanded(child: Text(text, softWrap: true)),
      ],
    );
  }
}
