import 'dart:io';

/// Instant check internet connection by providing the lookup address default is google.com
Future<bool> checkInternetConnection({lookupAddress: "google.com"}) async {
  bool internet = false;
  try {
    final result = await InternetAddress.lookup(lookupAddress);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      internet = true;
    }
  } on SocketException catch (_) {
    internet = false;
  }

  return internet ? Future.value(internet) : Future.error(internet);
}

internet({required Function connected, required Function notConnected}) {
  checkInternetConnection().then(
    (value) {
      connected();
    },
    onError: (value) {
      notConnected();
    },
  );
}
