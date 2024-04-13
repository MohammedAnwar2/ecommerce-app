import 'dart:io';

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
