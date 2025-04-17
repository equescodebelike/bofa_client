// import 'package:flutter/material.dart';

// void customDialog(
//   BuildContext context,
//   String title,
//   String subtitle,
//   VoidCallback? callback,
//   TextEditingController? controller,
// ) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(title),
//         content: SizedBox(
//           height: 80,
//           width: 302,
//           child: Column(
//             children: [
//               Text(subtitle),
//               controller != null
//                   ? CustomTextfield(
//                       controller: controller,
//                       autofocus: false,
//                       textFieldBorderRadius: 0,
//                       hint: 'https://example.com/logo.png',
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 16, horizontal: 16),
//                     )
//                   : SizedBox.shrink(),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           Center(
//             child: TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 callback?.call();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }

// void showDeleteAccountDialog(
//   BuildContext context,
//   AuthRepository authRepository,
//   ProfileRepository profileRepository,
// ) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Вы действительно хотите удалить аккаунт?',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Внимание! При удалении аккаунта все данные будут утеряны.',
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: Colors.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 24.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'ОТМЕНА',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     await authRepository.deleteAccount();
//                     await profileRepository.logout();
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'УДАЛИТЬ',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
