import 'dart:ui';

import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:flutter_riverpod/legacy.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => true);
final timeToMidnightStreamClosed = StateProvider<bool>((ref) => false);
final clickedonAllSubmissions = StateProvider<bool>((ref)=> true);
final showContainer = StateProvider<bool>((ref)=> false);
final foundUser = StateProvider<bool>((ref)=> false);
final errorUser = StateProvider<bool>((ref)=> false);
final userName  = StateProvider<String>((ref)=> "");
final timerBorderColor = StateProvider<Color>((ref)=> AppColors.green_trans_counter);