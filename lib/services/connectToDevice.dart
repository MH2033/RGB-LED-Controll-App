import 'package:tcp_scanner/tcp_scanner.dart';

Future connectToDevice() async {
  for (int i = 0; i < 10; i++) {
    var result = await TCPScanner("192.168.1." + i.toString(), [5436]).scan();
    if (result.open.contains(5436)) {
      return result.host;
    }
  }
  throw "notFound";
}