import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _imageUrl;

  Future<void> _pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      final ref = FirebaseStorage.instance.ref().child("uploads/${file.name}");
      await ref.putFile(File(file.path));
      final url = await ref.getDownloadURL();
      setState(() => _imageUrl = url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imageUrl != null
            ? Image.network(_imageUrl!)
            : Placeholder(fallbackHeight: 200),
        ElevatedButton(onPressed: _pickImage, child: Text("Upload Photo")),
      ],
    );
  }
}
