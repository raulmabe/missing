import 'package:flutter/material.dart';
import '../../widgets/myRadioButtons.dart';
import '../../../themeData.dart';
import '../../../types.dart';
import '../../../viewModels/cardViewModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


typedef bool2void = Function(bool);

class GeneralCard extends StatefulWidget {

  final int2void onCategoryChanged;
  final bool2void onBoolChanged;
  final CardViewModel card;

  GeneralCard({this.card, this.onBoolChanged, this.onCategoryChanged});

  @override
  _GeneralCardState createState() => _GeneralCardState();
}

class _GeneralCardState extends State<GeneralCard> {

  @override
  Widget build(BuildContext context) {
    const double padding = 20.0;
    return Material(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Category", style: TextStyle(color: Colors.grey[600])),
              SizedBox(
                height: padding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: Theme.of(context).primaryColorLight,
                    onTap: widget.onCategoryChanged,
                    type: AppType.values[0],
                    isSelected: widget.card.type == AppType.values[0],
                    size: 50,
                  ),
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: Theme.of(context).primaryColorLight,
                    onTap: widget.onCategoryChanged,
                    type: AppType.values[1],
                    isSelected: widget.card.type == AppType.values[1],
                    size: 50,
                  ),
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: Theme.of(context).primaryColorLight,
                    onTap: widget.onCategoryChanged,
                    type: AppType.values[2],
                    isSelected: widget.card.type == AppType.values[2],
                    size: 50,
                  ),
                ],
              ),
              SizedBox(
                height: padding,
              ),
              Divider(
                color: Theme.of(context).primaryColor.withOpacity(.5),
              ),
              SizedBox(
                height: padding,
              ),
              Text("Status", style: TextStyle(color: Colors.grey[600])),
              SizedBox(
                height: padding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildToggle(true),
                  _buildToggle(false),
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildToggle(bool missing) {
    bool selected = !(missing ^ (widget.card.missing ?? true));
    return Material(
      color: selected
          ? (missing
              ? MyTheme.of(context).missingColor
              : MyTheme.of(context).foundColor)
          : Colors.white,
          shape: RoundedRectangleBorder(side: BorderSide(color: selected ? (missing ? MyTheme.of(context).missingColor : MyTheme.of(context).foundColor) : Colors.grey,),
            borderRadius: BorderRadius.circular(5.0)
          ),
      child: InkWell(
        splashColor: selected ? (missing ? MyTheme.of(context).missingColor.withOpacity(0.5) : MyTheme.of(context).foundColor.withOpacity(.5)) : Colors.grey,
        onTap: () => widget.onBoolChanged(missing),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            missing ? FontAwesomeIcons.search : FontAwesomeIcons.mapMarkedAlt,
            color: selected
                ? Colors.white
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}