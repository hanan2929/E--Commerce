import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



class AddpostPage extends StatefulWidget {
   AddpostPage ({super.key});

  @override
  State<AddpostPage> createState() => _AddpostPageState();
}

class _AddpostPageState extends State<AddpostPage> {
   final  postController = TextEditingController();

   bool loading = false;

  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add post",
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        ),
        centerTitle: true,
      ),

      backgroundColor: const Color(0xFFF3E5F5),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),

              TextFormField(
                maxLines: 5,
                controller: postController,
                decoration: InputDecoration(
                hintText: "Whats on your mind? ",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30
              ),

              ElevatedButton(
                onPressed: loading ? null : () async {
                  setState(() {
                    loading = true;
                  });

                  try {
                    await databaseRef.push().set({
                      'title': postController.text,
                      'date': DateTime.now().toString(),
                      'author': 'Admin',
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Post Added")),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: $e")),
                    );
                  } finally {
                    setState(() {
                      loading = false;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: loading
                    ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : Text(
                  "Post",
                  style: TextStyle(color: Colors.white),
                ),
              )

            ],
      )
      ),
    );
  }
}