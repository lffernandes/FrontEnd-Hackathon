// generateExampleRoutes(RouteSettings settings) {
//   var routingData = settings.name.getRoutingData;
//   switch (routingData.route) {
//     case LoginRoute:
//       return LoginView();
//     case HomeRoute:
//       return HomeView();
//     default:
//       if (routingData["code"] != null) {
//         String authCode = routingData["code"];
//         return HomeView(authCode: authCode);
//       } 
//       return NoRouteDefinedView();
//   }
// }