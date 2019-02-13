import 'package:flutter/material.dart';
import '../../../models/appTypes.dart';
import '../tabsUtils.dart';
import '../../singleChatPage/chat.dart';
import '../../../themeData.dart';
import '../../../utils/iconTypes.dart';

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
              color: getColorFromTab(context, AppTabs.CHATS),
            ),
          ],
          expandedHeight: MediaQuery.of(context).size.height / 5,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
              ),
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
        lastMessage = "He encontrado a tu perro!";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
        bottom: BorderSide(color: Theme.of(context).primaryColor.withAlpha(70)),
        top: index == 0
            ? BorderSide(color: Theme.of(context).primaryColor.withAlpha(70))
            : BorderSide(color: Colors.transparent),
      )),
      child: Material(
        color: MyTheme.of(context).kChatsCards,
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
            leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1.0,
                            color: MyTheme.of(context).kPrimaryColor))),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/perro2.jpg"),
                  radius: 30.0,
                )),
            title: Text(name),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.done, color: MyTheme.of(context).kPrimaryColor),
                SizedBox(
                  width: 5.0,
                ),
                Text(lastMessage),
              ],
            ),
            trailing: Icon(
              getTypeIcon(type),
              color: MyTheme.of(context).kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
