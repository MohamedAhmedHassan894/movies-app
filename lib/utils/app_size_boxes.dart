import 'package:flutter/cupertino.dart';

extension SizeExtensionBox on num {
  Widget get widthBox => SizedBox(
        width: this is int ? toDouble() : this as double,
      );

  Widget get heightBox => SizedBox(
        height: this is int ? toDouble() : this as double,
      );
}
