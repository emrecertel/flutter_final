import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'utils/cache_helper.dart';

class PhotoCacheScreen extends StatefulWidget {
  @override
  _PhotoCacheScreenState createState() => _PhotoCacheScreenState();
}

class _PhotoCacheScreenState extends State<PhotoCacheScreen> {
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    String? imagePath = CacheHelper.getData(key: 'cachedImage');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final name = DateTime.now().toIso8601String();
      final file = File('${directory.path}/$name.png');
      final newImage = await File(pickedFile.path).copy(file.path);

      CacheHelper.saveData(key: 'cachedImage', value: newImage.path);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Başarıyla belleğe eklendi")));
      setState(() {
        _image = newImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotoğraf Cache Sistemi'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
