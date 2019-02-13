import 'dart:math' as math;
import '../../widgets/missingCard.dart';
import 'package:flutter/material.dart';
import '../../../models/appTypes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../homePage_vm.dart';
import '../../../themeData.dart';
import '../tabsUtils.dart';

class OthersBody extends StatefulWidget {
  final AppTypes type;
  final ViewModel viewModel;

  OthersBody({this.type, this.viewModel});

  @override
  OthersBodyState createState() {
    return new OthersBodyState();
  }
}

class OthersBodyState extends State<OthersBody>
    with SingleTickerProviderStateMixin {
  TextEditingController searchTextController;
  FocusNode focusNodeSearchBar;
  ScrollController _scrollController;
  AnimationController iconController;

  List cards;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    focusNodeSearchBar = FocusNode();
    searchTextController = TextEditingController();

    focusNodeSearchBar = FocusNode();
    focusNodeSearchBar.addListener(() {
      if (focusNodeSearchBar.hasFocus) {
        iconController.forward();
      } else
        iconController.reverse();
    });
    searchTextController = TextEditingController();
    iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    switch (widget.type) {
      case AppTypes.ITEMS:
        cards = widget.viewModel.itemsCards;
        break;
      case AppTypes.PEOPLE:
        cards = widget.viewModel.peopleCards;
        break;
      case AppTypes.PETS:
        cards = widget.viewModel.petsCards;
        break;
      default:
        cards = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              forceElevated: boxIsScrolled,
              floating: true,
              snap: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: getColorFromTab(
                            context, getTabFromType(widget.type)),
                        width: 2)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      disabledColor: Theme.of(context).iconTheme.color,
                      onPressed: null,
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchTextController,
                        autocorrect: false,
                        focusNode: focusNodeSearchBar,
                        decoration:
                            InputDecoration.collapsed(hintText: "Search"),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return Transform.rotate(
                          angle: math.pi,
                          child: IconButton(
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: iconController,
                            ),
                            color: Theme.of(context).iconTheme.color,
                            onPressed: () {
                              if (focusNodeSearchBar.hasFocus) {
                                searchTextController.clear();
                                focusNodeSearchBar.unfocus();
                              } else if (iconController.status ==
                                  AnimationStatus.dismissed)
                                Scaffold.of(context).openEndDrawer();
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              actions: [Container()],
            ),
          ];
        },
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          padding: EdgeInsets.all(10),
          itemCount: cards.length,
          itemBuilder: (context, index) => MissingCard(
                card: cards[index],
              ),
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          staggeredTileBuilder: (_) => StaggeredTile.fit(2),
        ));
  }
}
