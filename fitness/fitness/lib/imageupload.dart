import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ImageInput extends StatefulWidget 
{
  @override
  State<StatefulWidget> createState() {
    return _ImageInput();
  }
}
class _ImageInput extends State<ImageInput> 
{
  // To store the file provided by the image_picker
  File _imageFile;
  // To track the file uploading state
  bool _isUploading = false;
  String baseUrl = 'null';
  void _getImage(BuildContext context, ImageSource source) async 
  {
    File image = await ImagePicker.pickImage(source: source);
    setState(() 
    {
      _imageFile = image;
    });
    Navigator.pop(context);
  }
  Future<Map<String, dynamic>> _uploadImage(File image) async {
    setState(() {
      _isUploading = true;
    });
    
    final mimeTypeData =
        lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
    
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(baseUrl));
  
    final file = await http.MultipartFile.fromPath('image', image.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUploadRequest.fields['ext'] = mimeTypeData[1];
    imageUploadRequest.files.add(file);
    try 
    {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) 
      {
        return null;
      }
      final Map<String, dynamic> responseData = json.decode(response.body);
      _resetState();
      return responseData;
    } 
    catch (e) 
    {
      print(e);
      return null;
    }
  }
  void _startUploading() async 
  {
    final Map<String, dynamic> response = await _uploadImage(_imageFile);
    print(response);
    if (response == null || response.containsKey("error")) 
    {
      Fluttertoast.showToast(
          msg: "Image Uploaded Successfully!!!", 
          toastLength: Toast.LENGTH_LONG, 
          gravity: ToastGravity.BOTTOM);
    } 
    else 
    {
      Fluttertoast.showToast(
          msg: "Image Uploaded Successfully!!!", 
          toastLength: Toast.LENGTH_LONG, 
          gravity: ToastGravity.BOTTOM);
    }
  }
  void _resetState() 
  {
    setState(() {
      _isUploading = false;
      _imageFile = null;
    });
  }

  void _openImagePickerModal(BuildContext context) 
  {
    final flatButtonColor = Colors.green;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) 
        {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Camera'),
                  onPressed: () 
                  {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Gallery'),
                  onPressed: () 
                  {
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _buildUploadBtn() 
  {
    Widget btnWidget = Container();
    if (_isUploading) 
    {
      // File is being uploaded then show a progress indicator
      btnWidget = Container(
          margin: EdgeInsets.only(top: 10.0),
          child: CircularProgressIndicator());
    } 
    else if (!_isUploading && _imageFile != null) 
    {
      // If image is picked by the user then show a upload btn
      btnWidget = Container(
        margin: EdgeInsets.only(top: 10.0),
        child: RaisedButton(
          child: Text('Upload'),
          onPressed: () {
            _startUploading();
          },
          color: Colors.greenAccent,
          textColor: Colors.green,
        ),
      );
    }
    return btnWidget;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
            child: Text(
              "Personal Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: OutlineButton(
              onPressed: () => _openImagePickerModal(context),
              borderSide:
                  BorderSide(color: Theme.of(context).accentColor, width: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.camera_alt),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Add Image'),
                ],
              ),
            ),
          ),
          _imageFile == null
              ? Text('Pick an image to show off your progress!')
              : Image.file(
                  _imageFile,
                  fit: BoxFit.cover,
                  height: 350.0,
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                ),
          _buildUploadBtn(),
        ],
      ),
    );
  }
}
