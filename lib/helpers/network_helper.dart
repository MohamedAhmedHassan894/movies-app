import 'package:connectivity_plus/connectivity_plus.dart';
import '../business_logic/cubit/internet_connection/network_bloc.dart';
import '../business_logic/cubit/internet_connection/network_events.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
