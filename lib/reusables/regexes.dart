import 'package:flutter/services.dart';

TextInputFormatter phoneNumberFilter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
