import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
// Future<bool> checkInternet() async {
//   listenToConnectivityChanges();
//   final List<ConnectivityResult> connectivityResult =
//       await (Connectivity().checkConnectivity());

//   if (connectivityResult.contains(ConnectivityResult.mobile) ||
//       connectivityResult.contains(ConnectivityResult.wifi)) {
//     log("Connected to mobile data or Wi-Fi");
//     // Connected to mobile data or Wi-Fi
//     return true;
//   } else {
//     // Not connected to any network
//     log("Not connected to any networ");
//     return false;
//   }
// }

// void listenToConnectivityChanges() {
//   // Listen to connectivity changes
//   Connectivity().onConnectivityChanged.listen(
//     (List<ConnectivityResult> result) {
//       // Check the type of connectivity result
//       switch (result) {
//         case ConnectivityResult.wifi:
//           log("Connected to Wi-Fi");

//         case ConnectivityResult.mobile:
//           log("Connected to mobile data");

//         case ConnectivityResult.none:
//           log("No network connection");

//         default:
//           log("Unhandled connectivity type: $result");
//       }
//     },
//   );
// }

checkInternet() async {
  try {
    List<InternetAddress> result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

// Future<bool> checkInternet() async {
//   try {
//     // Perform a DNS lookup on a well-known address (e.g. google.com)
//     List<InternetAddress> result = await InternetAddress.lookup("google.com");

//     // If the lookup returns non-empty results, there is an internet connection
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     // Catch any SocketException and return false, indicating no internet connection
//     return false;
//   }

//   // If there are no results or an error occurred, return false
//   return false;
// }

// Future<bool> checkInternet() async {
//   try {
//     // This method tries to identify the type of connection by checking the available network interfaces
//     // This approach works for many platforms but may vary depending on the device

//     // Iterate through all network interfaces
//     for (var interface in await NetworkInterface.list()) {
//       // Check if the network interface is active
//       if (interface.addresses.isNotEmpty) {
//         // Check the name of the interface to identify Wi-Fi or mobile data connections
//         // Note: This might vary depending on the platform (Android, iOS, desktop, etc.)
//         if (interface.name.contains("en")) {
//           log("Connected to mobile data");
//           // Typically, "en" represents Ethernet or Wi-Fi connections on desktop platforms
//           // On Android, Wi-Fi interfaces may have names starting with "wlan"
//           return true;
//         } else if (interface.name.contains("wlan") ||
//             interface.name.contains("rmnet")) {
//           log("Connected to mobile data");
//           // Typically, "wlan" represents Wi-Fi connections and "rmnet" represents mobile data connections on Android
//           return true;
//         }
//       }
//     }
//   } catch (_) {
//     // Catch any exceptions and return "Unknown" for unknown connection types
//     return false;
//   }
//   // If no known connection type is identified, return "None"
//   return false;
// }



// import 'dart:io';

// Future<bool> checkInternet() async {
//   try {
//     // Perform the lookup for google.com
//     List<InternetAddress> result = await InternetAddress.lookup("google.com");
//     // Check if there is any result and if the raw address is not empty
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true; // Internet connection is available
//     }
//     return false; // Should not reach here
//   } on SocketException catch (e) {
//     // Handle SocketException
//     print('Failed to look up google.com: $e');
//     return false; // Return false indicating no internet connection
//   } catch (e) {
//     // Handle any other exceptions
//     print('An unexpected error occurred: $e');
//     return false; // Return false indicating no internet connection
//   }
// }

// import 'dart:io';

// Future<bool> checkInternet() async {
//   // List of hosts to check internet connectivity
//   List<String> hosts = ['google.com', 'bing.com', 'yahoo.com'];

//   // Try to resolve each host
//   for (String host in hosts) {
//     try {
//       List<InternetAddress> result = await InternetAddress.lookup(host);
//       // Check if the result is not empty and the raw address is not empty
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         return true; // Internet connection is available
//       }
//     } on SocketException catch (e) {
//       // Log the exception for debugging purposes
//       print('Failed to look up $host: $e');
//     }
//   }

//   // If none of the hosts could be resolved, return false
//   return false;
// }
