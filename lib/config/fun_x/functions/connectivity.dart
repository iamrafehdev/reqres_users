import 'dart:io';

// import 'package:data_connection_checker/data_connection_checker.dart';

/// Instant check internet connection by providing the lookup address default is google.com
Future<bool> checkInternet({lookupAddress: "google.com"}) async {
  bool internet = false;
  try {
    final result = await InternetAddress.lookup(lookupAddress);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      internet = true;
    }
  } on SocketException catch (_) {
    internet = false;
  }

  return internet;
}

/// ConnectionChecker used for internet connection listener
// class ConnectionChecker {
//   DataConnectionChecker? _instance;
//
//   getInstance() {
//     if (_instance == null) {
//       _instance = DataConnectionChecker();
//       return this;
//     }
//     return this;
//   }
//
//   setDuration(Duration duration) {
//     getInstance();
//     _instance?.checkInterval = duration;
//     return this;
//   }
//
//   /// connection listener
//   listener(Function connected, {Function? disconnected}) async {
//     getInstance();
//     return _instance?.onStatusChange?.listen(
//       (DataConnectionStatus status) {
//         switch (status) {
//           case DataConnectionStatus.connected:
//             connected();
//             break;
//           case DataConnectionStatus.disconnected:
//             if (disconnected != null) {
//               disconnected();
//             }
//             break;
//         }
//       },
//       onError: (Object error, [StackTrace? stackTrace]) {
//         if (disconnected != null) {
//           disconnected();
//         }
//       },
//     );
//   }
// }
