import 'package:flutter/material.dart';

class PersnolprofilePage extends StatelessWidget {
  const PersnolprofilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.deepPurple),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 80, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 50),
              _buildProfileInfo(Icons.person, "Name", "Abdul Hanan"),
              const SizedBox(height: 25),
              _buildProfileInfo(Icons.contact_page, "Contact No.", "0312 3456789"),
              const SizedBox(height: 25),
              _buildProfileInfo(Icons.email, "E-mail", "test@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.deepPurple),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
