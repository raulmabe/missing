import 'package:flutter/material.dart';
import '../../themeData.dart';
import '../widgets/myRadioButtons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './uploadPage_vm.dart';
import '../../utils/appType.dart';

class GeneralCard extends StatefulWidget {
  final TempCardModel card;
  final bool categoryError;
  final bool statusError;

  GeneralCard({Key key, this.card, this.categoryError, this.statusError})
      : super(key: key);

  @override
  _GeneralCardState createState() => _GeneralCardState();
}

class _GeneralCardState extends State<GeneralCard> {
  final String _errorStatusMssg = "Status must be assigned";
  final String _errorCategoryMssg = "Category must be assigned";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assert(widget.categoryError != null);
    assert(widget.statusError != null);
  }

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
                    selectedColor: const Color(0xff7a6ad4),
                    onTap: (i) {
                      setState(() {
                        widget.card.type = AppType.values[i];
                      });
                    },
                    type: AppType.values[0],
                    isSelected: widget.card.type == AppType.values[0],
                    size: 50,
                  ),
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: const Color(0xff7a6ad4),
                    onTap: (i) {
                      setState(() {
                        widget.card.type = AppType.values[i];
                      });
                    },
                    type: AppType.values[1],
                    isSelected: widget.card.type == AppType.values[1],
                    size: 50,
                  ),
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: const Color(0xff7a6ad4),
                    onTap: (i) {
                      setState(() {
                        widget.card.type = AppType.values[i];
                      });
                    },
                    type: AppType.values[2],
                    isSelected: widget.card.type == AppType.values[2],
                    size: 50,
                  ),
                ],
              ),
              _errorText(widget.categoryError, _errorCategoryMssg),
              SizedBox(
                height: padding,
              ),
              Divider(),
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
              ),
              _errorText(widget.statusError, _errorStatusMssg)
            ],
          ),
        ));
  }

  Widget _buildToggle(bool missing) {
    bool selected = !(missing ^ (widget.card.missing ?? !missing));
    return Material(
      color: selected
          ? (missing
              ? MyTheme.of(context).missingColor
              : MyTheme.of(context).foundColor)
          : Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: selected
                ? (missing
                    ? MyTheme.of(context).missingColor
                    : MyTheme.of(context).foundColor)
                : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        splashColor: selected
            ? (missing
                ? MyTheme.of(context).missingColor.withOpacity(0.5)
                : MyTheme.of(context).foundColor.withOpacity(.5))
            : Colors.grey,
        onTap: () {
          setState(() {
            widget.card.missing = missing;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            missing ? FontAwesomeIcons.search : FontAwesomeIcons.mapMarkedAlt,
            color: selected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _errorText(bool isError, String msg) {
    if (!isError) return Container();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(msg,
          style: TextStyle(
            color: Colors.red,
            fontSize: 13,
          )),
    );
  }
}
