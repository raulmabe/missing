import 'package:flutter/material.dart';
import '../../../models/appTypes.dart';
import '../../../utils/globalUtils.dart';
import '../../singleChatPage/chat.dart';
import '../../../themeData.dart';
import 'dart:math';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Theme.of(context).canvasColor,
          pinned: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                color: MyTheme.of(context).iconsColor),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Chats",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildBuilderDelegate(
              (context, index) => ChatItem(AppTypes.PETS, index)),
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final AppTypes type;
  final int index;
  final String name, lastMessage;

  ChatItem(this.type, this.index)
      : name = "Alicia Sanchez",
        lastMessage = "He encontrado a tu perro!ghfdhgdfgherthrthrthrt";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
        bottom: BorderSide(color: Colors.grey.shade300),
        top: index == 0
            ? BorderSide(color: Colors.grey.shade300)
            : BorderSide(color: Colors.transparent),
      )),
      child: Material(
        color: Theme.of(context).canvasColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chat(name),
              ),
            );
          },
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/perro2.jpg"),
                    radius: 30.0,
                  ),
                  Transform.translate(
                    offset: Offset(5, 5),
                                      child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: getColorByState(context, new Random().nextBool()), 
                          shape: BoxShape.circle),
                      child: Icon(
                        getIconByType(type, true),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(name),
              subtitle: Container(child: Text(lastMessage)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.done, color: Colors.grey),
                  Text(
                    "12:39",
                    style: Theme.of(context).textTheme.subtitle,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
