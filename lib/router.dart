// import 'package:dsdsoft/screens/Order/add_item_page.dart';
// import 'package:dsdsoft/screens/Payment/add_payment_page.dart';
// import 'package:dsdsoft/screens/Return/return_item_page.dart';
// import 'package:dsdsoft/screens/Return/add_return_page.dart';
// import 'package:dsdsoft/screens/home_page.dart';
// import 'package:dsdsoft/screens/Order/orders_page.dart';
// import 'package:dsdsoft/screens/Payment/payment_page.dart';
// import 'package:dsdsoft/screens/Return/return_page.dart';
// import 'package:dsdsoft/screens/logins/sign_in_page.dart';
// import 'package:dsdsoft/screens/Sync/sync_data_page.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'screens/logins/sign_up_page.dart';
// import 'providers/auth_provider.dart';
// import '../utils/go_router_refresh_stream.dart';
// import 'package:dsdsoft/screens/Order/new_order_page.dart';


// final routerProvider = Provider<GoRouter>((ref) {
//   return GoRouter(
//     initialLocation: '/',
//     refreshListenable: GoRouterRefreshStream(
//       ref.watch(authProvider.notifier).stream,
//     ),
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const HomePage(),
//       ),
//       GoRoute(
//         path: '/login',
//         builder: (context, state) => const SignInPage(),
//       ),
//       GoRoute(
//         path: '/signup',
//         builder: (context, state) => const SignUpPage(),
//       ),
//       GoRoute(
//         path: '/order',
//         builder: (context, state) => const OrdersPage(),
//       ),
//       GoRoute(
//         path: '/new-order',
//         builder: (context, state) => const NewOrderPage(),
//       ),
//       GoRoute(
//         path: '/add-item',
//         builder: (context, state) =>  AddItemPage(),
//       ),
//       GoRoute(
//         path: '/payment',
//         builder: (context, state) =>  PaymentPage(),
//       ),
//       GoRoute(
//         path: '/add-payment',
//         builder: (context, state) =>  AddPaymentPage(),
//       ),
//       GoRoute(
//         path: '/return',
//         builder: (context, state) => const ReturnPage(),
//       ),
//       GoRoute(
//         path: '/add-return',
//         builder: (context, state) => const AddReturnPage(),
//       ),
//       GoRoute(
//               path: '/return-item',
//               builder: (context, state) =>  ReturnItemPage(),
//             ),
//       GoRoute(
//               path: '/sync',
//               builder: (context, state) =>  SyncDataPage(),
//             ),
//     ],
//   );
// });
