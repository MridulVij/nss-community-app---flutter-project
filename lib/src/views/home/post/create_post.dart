// post section
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final TextEditingController _textEditingController = TextEditingController();
  File? _image;
  File? _video;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
      });
    }
  }

  Future<void> _post() async {
    final text = _textEditingController.text;

    // Send the text, image, and video to the backend API
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://your-backend-api.com/post'),
    );
    request.fields['text'] = text;
    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath('image', _image!.path),
      );
    }
    if (_video != null) {
      request.files.add(
        await http.MultipartFile.fromPath('video', _video!.path),
      );
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      // Post uploaded successfully
    } else {
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      // style: TextStyle(fontSize: 200),
                      maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Add Title',
                        //contentPadding: EdgeInsets.symmetric(vertical: 90),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      // style: TextStyle(fontSize: 200),
                      maxLines: 10,
                      minLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Add Description',
                        //contentPadding: EdgeInsets.symmetric(vertical: 90),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: _pickImage,
                            child: const Text('Add Photo'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: _pickVideo,
                            child: const Text('Add Video'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _image != null
                        ? Image.file(_image!)
                        : const SizedBox.shrink(),
                    const SizedBox(height: 16),
                    if (_video != null)
                      const SizedBox(
                        height: 200,
                        // problem
                        //child: VideoPlayer(_video!),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              //width: 1,
              height: 50,

              child: ElevatedButton(
                onPressed: _post,
                child: const Text(
                  'Post',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
