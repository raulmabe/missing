import 'package:flutter/material.dart';
import 'dart:math';
import '../../utils.dart';
import '../../themeData.dart';

class Chat extends StatefulWidget {

  final String name;

  Chat(this.name);

  @override
  _ChatState createState() => _ChatState(name);
}

class _ChatState extends State<Chat> with TickerProviderStateMixin{

  TextEditingController _textController = new TextEditingController();
  final List<BubbleMessage> _messages = <BubbleMessage>[];
  bool _isWriting = false;
  FocusNode _focusNode = FocusNode();

  String name;

  _ChatState(this.name);

  @override
  void initState(){
    super.initState();
  }

  void _submitMessage(String text) {
    FocusScope.of(context).requestFocus(_focusNode);
    if(text.length == 0) return;
    _textController.clear();
    _isWriting = false;
    BubbleMessage msg = new BubbleMessage(
      message: text,
      animationController: new AnimationController(
          vsync: this,
        duration: new Duration(milliseconds: 200)
      ),
      isntMe: new Random().nextBool(),
      delivered: true,
      time: "12:00",
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (BubbleMessage msg in _messages) {
      msg.animationController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              Utils.getFirstWord(name),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 2.0
              )
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0
                  )
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/perro2.jpg"),
              ),
            )
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemBuilder: (_, index) => _messages[index],
                  itemCount: _messages.length,
                  reverse: true,
                  padding: EdgeInsets.only(top: 6.0, bottom: 110.0, left: 6.0, right: 6.0),
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0 ),
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).primaryColorLight,
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            focusNode: _focusNode,
                            autocorrect: false,
                            autofocus: true,
                            cursorColor: Colors.white,
                            controller: _textController,
                            onSubmitted: _submitMessage,
                            onChanged: (String txt) {
                              setState(() {
                                _isWriting = txt.length > 0;
                              });
                            },
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: "Send a message",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                              )
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _isWriting ? () => _submitMessage(_textController.text)
                            : null,
                          icon: Icon(Icons.send),
                          color: Colors.white,
                          disabledColor: Colors.grey[350],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleMessage extends StatelessWidget {

  BubbleMessage({this.message, this.time, this.delivered, this.isntMe, this.animationController});

  final String message, time;
  final bool delivered, isntMe;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final bg = isntMe ? MyTheme.of(context).kNotMyMessageColor : MyTheme.of(context).kMyMessageColor;
    final align = isntMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final textColor = isntMe ? null : Colors.white;
    final radius = isntMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          );
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut
      ),
      axisAlignment: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: .5,
                        spreadRadius: 1.0,
                        color: Colors.black.withOpacity(.12))
                  ],
                  color: bg,
                  borderRadius: radius,
                ),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: <Widget>[
                    Text(message,
                      softWrap: true,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(time,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 13.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 16.0,
                      color: textColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}