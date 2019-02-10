import 'package:flutter/material.dart';
import '../../models/appTypes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../singleChatPage/chat.dart';
import '../../themeData.dart';

class ChatsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Chats",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.0
          )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).primaryColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return ChatItem(AppTypes.PETS, index);
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {

  final AppTypes type;
  final int index;
  String name, lastMessage;

  ChatItem(this.type, this.index){
    name = "Alicia Sanchez";
    lastMessage = "He encontrado a tu perro!";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: Theme.of(context).primaryColor.withAlpha(70)),
          top: index == 0 ? BorderSide(color: Theme.of(context).primaryColor.withAlpha(70)) : BorderSide(color: Colors.transparent),
        )
      ),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1.0, color: MyTheme.of(context).kPrimaryColor)
                )
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/perro2.jpg"),
                radius: 30.0,
              )
            ),
            title: Text(
              name
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.done, color: MyTheme.of(context).kPrimaryColor),
                SizedBox(width: 5.0,),
                Text(
                  lastMessage
                ),
              ],
            ),
            trailing: Builder(
              builder: (context){
                switch(type){
                  case AppTypes.PETS: return Icon(
                      Icons.pets,
                      color: MyTheme.of(context).kPrimaryColor,
                    );
                  case AppTypes.PEOPLE: return Icon(
                      Icons.face,
                      color: Theme.of(context).primaryColor,
                    );
                  case AppTypes.THINGS: return Icon(
                      FontAwesomeIcons.archive,
                      color: Theme.of(context).primaryColor,
                    );
                  default: return null;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}