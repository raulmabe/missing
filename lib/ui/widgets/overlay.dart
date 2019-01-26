import 'package:flutter/material.dart';

class OverlayBuilder extends StatefulWidget {
  final bool showOverlay;
  final Function(BuildContext) overlayBuilder;
  final Widget child;

  OverlayBuilder({this.child, this.overlayBuilder, this.showOverlay = false});

  @override
  _OverlayBuilderState createState() => _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();

    if (widget.showOverlay) {
      showOverlay();
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    syncWidgetAndOverlay();
  }

  @override
  void reassemble() {
    super.reassemble();
    syncWidgetAndOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }
    super.dispose();
  }

  bool isShowingOverlay() => overlayEntry != null;

  void showOverlay() {
    overlayEntry = new OverlayEntry(
      builder: widget.overlayBuilder,
    );
    addToOverlay(overlayEntry);
  }

  void addToOverlay(OverlayEntry overlayEntry) {
    Overlay.of(context).insert(overlayEntry);
    /* 
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Overlay.of(context).insert(overlayEntry)); */
  }

  void hideOverlay() {
    overlayEntry.remove();
    overlayEntry = null;
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay)
      hideOverlay();
    else if (!isShowingOverlay() && widget.showOverlay) showOverlay();
  }
}
