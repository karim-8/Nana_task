import 'package:flutter/cupertino.dart';

extension SpacesManager on double {
  SizedBox get heightSpace => SizedBox(height: this);

  SizedBox get widthSpace => SizedBox(width: this);
}
