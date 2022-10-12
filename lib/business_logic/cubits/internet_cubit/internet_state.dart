import 'package:flutter/foundation.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {}

class InternetDisconnected extends InternetState {}