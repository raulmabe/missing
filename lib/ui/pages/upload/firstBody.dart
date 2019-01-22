import 'package:flutter/material.dart';
import '../../../types.dart';
import '../../widgets/myRadioButtons.dart';

class FirstBody extends StatefulWidget {
  @override
  _FirstBodyState createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
  List<bool> categories;
  bool missing;

  GlobalKey formKey = GlobalKey<FormState>();

  _FirstBodyState() {
    categories = [false, false, true];
    missing = true;
  }

  void onChangedCategory(int i) {
    setState(() {
      for (int j = 0; j < categories.length; ++j) {
        if (j == i)
          categories[i] = true;
        else
          categories[j] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new CustomRadio(
                  onTap: onChangedCategory,
                  type: AppType.values[0],
                  isSelected: categories[0],
                ),
                new CustomRadio(
                  onTap: onChangedCategory,
                  type: AppType.values[1],
                  isSelected: categories[1],
                ),
                new CustomRadio(
                  onTap: onChangedCategory,
                  type: AppType.values[2],
                  isSelected: categories[2],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: makeChoices(),
            ),
            TextFormField(
              validator: (txt) => txt.length < 3 ? "Title is too short" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                hintText: "Llaves",
                labelText: "Title",
                labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              validator: (txt) =>
                  txt.length < 10 ? "Description is too short" : null,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                hintText: "Explain yourself",
                labelText: "Description",
                labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> makeChoices() {
    List<Widget> list = [];
    list.add(Material(
      color: missing ? Colors.redAccent : Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        onTap: () {
          setState(() {
            missing = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              "Missing",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    ));
    list.add(Material(
      color: !missing ? Colors.greenAccent : Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        onTap: () {
          setState(() {
            missing = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              "Found",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    ));
    return list;
  }
}
