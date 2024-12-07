import "package:flutter/material.dart";

import "../style/text_style.dart";

extension CustomContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  TextTheme get textTheme => const AppTextStyle();
}
