import 'dart:io';

import 'package:flutter/foundation.dart';

class Helper{
  
  
  
 static  String getPlatformName() {
  if (kIsWeb) {
    return 'Web';
  } else if (Platform.isAndroid) {
    return 'Android';
  } else if (Platform.isIOS) {
    return 'iOS';
  } else if (Platform.isMacOS) {
    return 'macOS';
  } else if (Platform.isWindows) {
    return 'Windows';
  } else if (Platform.isLinux) {
    return 'Linux';
  } else if (Platform.isFuchsia) {
    return 'Fuchsia';
  } else {
    return 'Unknown';
  }
}
}
