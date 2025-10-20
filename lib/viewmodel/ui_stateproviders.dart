import 'package:flutter_riverpod/legacy.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => true);
final timeToMidnightStreamClosed = StateProvider<bool>((ref) => false);