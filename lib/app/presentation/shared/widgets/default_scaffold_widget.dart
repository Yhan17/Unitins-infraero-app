import 'package:flutter/material.dart';

class DefaultScaffoldWidget extends StatelessWidget {
  final Widget child;
  const DefaultScaffoldWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height -
        _appbar.preferredSize.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        40;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _appbar,
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: height,
              maxWidth: width,
            ),
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  AppBar get _appbar => AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      );
}
