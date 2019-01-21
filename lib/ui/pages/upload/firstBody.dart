import 'package:flutter/material.dart';
import '../../../types.dart';
import '../../widgets/myRadioButtons.dart';

class FirstBody extends StatefulWidget {
  @override
  _FirstBodyState createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
  List<bool> categories;

  _FirstBodyState() {
    categories = [false, false, true];
  }

  void onChangedCategory(int i) {
    setState(() {
      for (int j = 0; j < categories.length; ++j) {
        if (j == i) categories[i] = true;
        else categories[j] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 100.0,),
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
          SizedBox(height: 80.0,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor
                )
              ),
              hintText: "Title"
            ),
          ),
          SizedBox(height: 40.0,),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor
                )
              ),
              hintText: "Description"
            ),
          )
        ],
      ),
    );
  }
}
