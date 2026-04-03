import 'package:flutter/material.dart';
import 'userdata.dart';

class PersnolprofilePage extends StatefulWidget {
  const PersnolprofilePage({super.key});

  @override
  State<PersnolprofilePage> createState() => _PersnolprofilePageState();
}

class _PersnolprofilePageState extends State<PersnolprofilePage> {
  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _contactController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: UserData.name);
    _contactController = TextEditingController(text: UserData.contact);
    _emailController = TextEditingController(text: UserData.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      if (_isEditing) {
        // Save data to UserData when switching back from edit mode
        UserData.name = _nameController.text;
        UserData.contact = _contactController.text;
        UserData.email = _emailController.text;
      }
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
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
        actions: [
          IconButton(
            onPressed: _toggleEdit,
            icon: Icon(_isEditing ? Icons.check : Icons.edit,
                color: Colors.deepPurple),
          )
        ],
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
              _buildProfileInfo(
                  Icons.person, "Name", _nameController, _isEditing),
              const SizedBox(height: 25),
              _buildProfileInfo(
                  Icons.contact_page, "Contact No.", _contactController, _isEditing),
              const SizedBox(height: 25),
              _buildProfileInfo(
                  Icons.email, "E-mail", _emailController, _isEditing),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(IconData icon, String title,
      TextEditingController controller, bool isEditing) {
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
          Expanded(
            child: Column(
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
                isEditing
                    ? TextField(
                        controller: controller,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      )
                    : Text(
                        controller.text,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
