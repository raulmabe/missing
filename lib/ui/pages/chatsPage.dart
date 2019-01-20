import 'package:flutter/material.dart';
import './body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './chat.dart';
import '../../themeData.dart';

class ChatsPage extends StatelessWidget {

  ChatsPage(){

  }

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
            return ChatItem(Type.PETS);
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {

  final Type type;
  String name, lastMessage;

  ChatItem(this.type){
    name = "Alicia Sanchez";
    lastMessage = "He encontrado a tu perro!";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
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
                  case Type.PETS: return Icon(
                      Icons.pets,
                      color: MyTheme.of(context).kPrimaryColor,
                    );
                  case Type.PEOPLE: return Icon(
                      Icons.face,
                      color: Theme.of(context).primaryColor,
                    );
                  case Type.THINGS: return Icon(
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