import 'package:flutter/material.dart';
import '../widgets/chips.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import './imagePreview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './uploadPage_vm.dart';

class InfoCard extends StatefulWidget {
  final GlobalKey formKey;
  final TempCardModel card;
  InfoCard({@required this.formKey,@required this.card,});

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  TextEditingController _controller;

  bool infoTagsSelected;

  OverlayEntry _overlayEntry;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    infoTagsSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 20.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Material(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Optional", style: TextStyle(color: Colors.grey[600])),
                SizedBox(
                  height: padding,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.card.images.length < 5
                        ? ([]
                          ..add(Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.grey.shade200,
                                onTap: () => _getImage(),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.grey,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ))
                          ..addAll(_makeImages()))
                        : _makeImages(),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: padding / 2,
        ),
        Material(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Information",
                      style: TextStyle(color: Colors.grey[600])),
                  SizedBox(
                    height: padding,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Title"),
                    validator: (str) => str.length < 2 ? "Title invalid" : null,
                    onSaved: (str) => widget.card.title = str,
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  TextFormField(
                    maxLines: 20,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(labelText: "Description"),
                    validator: (str) =>
                        str.length < 10 ? "Description must be longer" : null,
                    onSaved: (str) => widget.card.description = str,
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Location"),
                    validator: (str) => str.length < 2 ? "Location invalid" : null,
                    onSaved: (str) => widget.card.location = str,
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  Divider(),
                  SizedBox(
                    height: padding,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Tags", style: TextStyle(color: Colors.grey[600])),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            infoTagsSelected = !infoTagsSelected;
                          });
                        },
                        iconSize: 20,
                        color: Colors.grey,
                        icon: Icon(infoTagsSelected ? FontAwesomeIcons.solidQuestionCircle : FontAwesomeIcons.questionCircle,)
                      )
                    ],
                  ),
                  SizedBox(
                    height: padding/2,
                  ),
                  (infoTagsSelected) ? Text(
                    "A tag is a keyword or label that categorizes your post with other, similar posts. Better your tags describes your post, more helpful will be for the searching system",
                    style: TextStyle(color: Colors.grey[600])
                  ) : Container(),
                  SizedBox(
                    height: padding/2,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 10.0,
                    children: []
                      ..addAll(_makeTags())
                      ..add(
                        TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(labelText: "Add tag"),
                          validator: (str) {
                            if(widget.card.tags == null || widget.card.tags.isEmpty){
                              return "Tags can't be empty";
                            } else return null;
                          },
                          onFieldSubmitted: (str) {
                            _controller.clear();
                            if (str.isNotEmpty &&
                                !widget.card.tags.contains(str)) {
                              setState(() {
                                widget.card.tags?.add(str);
                              });
                            }
                          },
                        ),
                      ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _makeImages() {
    List<Widget> list = [];
    for (int i = 0; i < widget.card.images.length; ++i) {
      list.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: UploadImageIcon(
            image: widget.card.images[i],
            removeImage: (image){
              setState(() {
                widget.card.images.remove(image);
              });
            },)
          ));
    }
    return list;
  }

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image == null) return;
    widget.card.images.add(image);
    setState(() {});
  }

  List<Widget> _makeTags() {
    List<Widget> list = [];
    if (widget.card.tags == null) {
      //widget.card.tags = [];
    }
    if (widget.card.tags.isEmpty) {
      return list;
    }
    for (int i = 0; i < widget.card.tags.length; ++i) {
      list.add(Tag(
        tag: (widget.card.tags[i].length < 20)
            ? widget.card.tags[i]
            : "" + widget.card.tags[i].substring(0, 15) + "...",
        context: context,
        onDeleted: () {
          setState(() {
            widget.card.tags.remove(widget.card.tags[i]);
          });
        },
      ));
    }
    return list;
  }
}