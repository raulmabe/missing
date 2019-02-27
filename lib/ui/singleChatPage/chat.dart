import 'package:flutter/material.dart';
import 'dart:math';
import '../../themeData.dart';

class Chat extends StatefulWidget {
  final String name;

  Chat(this.name);

  @override
  _ChatState createState() => _ChatState(name);
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  TextEditingController _textController = new TextEditingController();
  final List<BubbleMessage> _messages = <BubbleMessage>[];
  bool _isWriting = false;
  FocusNode _focusNode = FocusNode();

  String name;

  _ChatState(this.name);

  @override
  void initState() {
    super.initState();
  }

  void _submitMessage(String text) {
    FocusScope.of(context).requestFocus(_focusNode);
    if (text.length == 0) return;
    _textController.clear();
    _isWriting = false;
    BubbleMessage msg = new BubbleMessage(
      message: text,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 200)),
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
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: 1.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 24.0,
                backgroundImage: AssetImage("assets/perro2.jpg"),
              ),
            ],
          ),
          SizedBox(
            width: 12.0,
          )
        ],
        title: Text(name, style: Theme.of(context).textTheme.headline),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: MyTheme.of(context).iconsColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: EdgeInsets.all(6),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
            top: BorderSide(color: Colors.grey.withOpacity(.3))
          )
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  autocorrect: false,
                  cursorColor: Colors.grey,
                  controller: _textController,
                  onSubmitted: _submitMessage,
                  onChanged: (str) {
                    setState(() {
                      _isWriting = str.length > 0;
                    });
                  },
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message"),
                ),
              ),
              SizedBox(
                width: 18,
                height: 18,
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: _isWriting
                      ? () => _submitMessage(_textController.text)
                      : null,
                  icon: Icon(
                    Icons.send,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      
      /*
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100)),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
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
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: InputDecoration.collapsed(
                    hintText: "Send a message",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20.0)),
              ),
            ),
            IconButton(
              onPressed: _isWriting
                  ? () => _submitMessage(_textController.text)
                  : null,
              icon: Icon(Icons.send),
            )
          ],
        ),
      ),
      */
    );
  }
}

class BubbleMessage extends StatelessWidget {
  BubbleMessage(
      {this.message,
      this.time,
      this.delivered,
      this.isntMe,
      this.animationController});

  final String message, time;
  final bool delivered, isntMe;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final bg = isntMe
        ? MyTheme.of(context).kNotMyMessageColor
        : MyTheme.of(context).kGreen;
    final align = isntMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final textColor = isntMe ? null : Colors.white;
    final radius = isntMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            topRight: Radius.circular(10.0),
          );
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController, curve: Curves.bounceInOut),
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
                    Text(
                      message,
                      softWrap: true,
                      style: TextStyle(color: textColor, fontSize: 18.0),
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
