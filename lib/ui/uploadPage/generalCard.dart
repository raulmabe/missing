import 'package:flutter/material.dart';
import '../widgets/myRadioButtons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './uploadPage_vm.dart';
import '../../models/appTypes.dart';
import '../../utils/globalUtils.dart';

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
                    selectedColor: getColorFromTab(context, AppTabs.PEOPLE),
                    onTap: (type) {
                      setState(() {
                        widget.card.type = type;
                      });
                    },
                    type: AppTypes.values.toList()[0],
                    isSelected: widget.card.type == AppTypes.values.toList()[0],
                    size: 50,
                  ),
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: getColorFromTab(context, AppTabs.PETS),
                    onTap: (type) {
                      setState(() {
                        widget.card.type = type;
                      });
                    },
                    type: AppTypes.values.toList()[1],
                    isSelected: widget.card.type == AppTypes.values.toList()[1],
                    size: 50,
                  ),
                  new CustomRadio(
                    unselectedColor: Colors.grey,
                    selectedColor: getColorFromTab(context, AppTabs.ITEMS),
                    onTap: (type) {
                      setState(() {
                        widget.card.type = type;
                      });
                    },
                    type: AppTypes.values.toList()[2],
                    isSelected: widget.card.type == AppTypes.values.toList()[2],
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
          ? getColorByState(context, missing)
          : Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: selected
                ? getColorByState(context, missing)
                : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        splashColor: selected
            ? getColorByState(context, missing).withOpacity(0.5)
               
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
