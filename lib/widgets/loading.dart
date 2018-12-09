import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(radius: 14.0),
            Padding(
                padding: const EdgeInsets.only(top: 8.0), child: Text('正在加载数据'))
          ],
        )),
      ),
    );
  }
}
