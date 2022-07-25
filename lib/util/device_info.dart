import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

Future<String> getDeviceId() async {
  var deviceId = '';
  try {
    deviceId = (await PlatformDeviceId.getDeviceId)!;
  } on PlatformException {
    // const deviceId = 'Failed to get deviceId.';
    deviceId = '';
  }
  return deviceId;
}
