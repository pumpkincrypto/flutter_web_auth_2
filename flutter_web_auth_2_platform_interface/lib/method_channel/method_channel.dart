import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2_platform_interface/flutter_web_auth_2_platform_interface.dart';

/// Method channel implementation of the [FlutterWebAuth2Platform].
class FlutterWebAuth2MethodChannel extends FlutterWebAuth2Platform {
  static const MethodChannel _channel = MethodChannel('flutter_web_auth_2');

  @override
  Future<String> authenticate({
    required String url,
    required String callbackUrlScheme,
    required Map<String, dynamic> options,
  }) async =>
      await _channel.invokeMethod<String>('authenticate', <String, dynamic>{
        'url': url,
        'callbackUrlScheme': callbackUrlScheme,
        'options': options,
      }) ??
      '';

  @override
  Future clearAllDanglingCalls() async =>
      _channel.invokeMethod('cleanUpDanglingCalls');

  @override
  Future<bool> isInstallChrome() async =>
      _channel.invokeMethod('isInstallChrome');
}
