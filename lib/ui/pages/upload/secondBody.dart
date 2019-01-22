import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class SecondBody extends StatefulWidget {
  @override
  _SecondBodyState createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  TextEditingController _textEditingController;
  FocusNode _focusNode = FocusNode();

  List images;
  List<String> tags;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    images = [];
    tags = [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextFormField(
                validator: (txt) =>
                    txt.length < 3 ? "Location is too short" : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintText: "Barcelona",
                  labelText: "Location",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Tags",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Wrap(
                spacing: 5.0,
                children: []
                  ..addAll(makeTags())
                  ..add(addTextField()),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Optional",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.start,
              runSpacing: 10.0,
              children: makeImages(),
            ),
            Flex(
              direction: Axis.vertical,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> makeImages() {
    List<Widget> list = [];
    for (int i = 0; i < 4; ++i) {
      if (images.length - 1 < i) {
        list.add(Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 3.0),
              borderRadius: BorderRadius.circular(5.0)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => getImage(),
              child: Icon(
                Icons.add_a_photo,
                color: Theme.of(context).primaryColor,
                size: 35.0,
              ),
            ),
          ),
        ));
      } else {
        list.add(Stack(
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: FileImage(images[i])),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3.0),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            Positioned(
              top: 20.0,
              bottom: 20.0,
              right: 20.0,
              left: 20.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(170), shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => deleteImage(images[i]),
                ),
              ),
            )
          ],
        ));
      }
    }
    return list;
  }

  void deleteImage(dynamic image) {
    if (images.contains(image)) {
      setState(() {
        images.remove(image);
      });
    }
  }

  void deleteTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  List<Widget> makeTags() {
    List<Widget> list = [];
    for (int i = 0; i < tags.length; ++i) {
      list.add(Chip(
        label: Text(tags[i]),
        onDeleted: () => deleteTag(tags[i]),
        backgroundColor: Theme.of(context).primaryColor.withAlpha(150),
      ));
    }
    return list;
  }

  void addNewTag(String tag) {
    FocusScope.of(context).requestFocus(_focusNode);
    setState(() {
      if (!tags.contains(tag) && tag.length > 0) tags.add(tag);
    });
    _textEditingController.clear();
  }

  Widget addTextField() {
    return TextField(
      controller: _textEditingController,
      focusNode: _focusNode,
      onSubmitted: addNewTag,
      decoration: InputDecoration(hintText: "raza / color / tamaño"),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    images.add(image);
    setState(() {});
  }
}
