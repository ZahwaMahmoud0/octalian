import 'package:flutter/material.dart';

extension EasyPadding on Widget {
  Widget p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}

extension ToText on String {
  Text txt() => Text(this);
}
