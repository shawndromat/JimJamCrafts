jimjamAdmin.config(['$routeProvider', function ($routeProvider) {

  // var accessLevels = {
  //       public: userRoles.public | // 111
  //               userRoles.user   | 
  //               userRoles.admin,   
  //       anon:   userRoles.public,  // 001
  //       user:   userRoles.user |   // 110
  //               userRoles.admin,                    
  //       admin:  userRoles.admin    // 100
  //   };

  $routeProvider
    .when('/patterns', {
      templateUrl: "../assets/templates/patterns/index.html",
      controller: "PatternAdminCtrl",
      // access: accessLevels.admin
    })

    // .when('/patterns/:id', {
    //   templateUrl: "../assets/templates/patterns/show.html",
    //   controller: "PatternShowCtrl"
    // })

    .when('/downloads', {
      templateUrl: "../assets/templates/downloads/admin.html",
      controller: 'DownloadAdminCtrl'
    })

    // .when('/register', {
    //   templateUrl: "../assets/templates/users/form.html",
    //   controller: 'UserCtrl',
    //   // access: accessLevels.anon
    // })

    .otherwise({
      templateUrl: "../assets/templates/sessions/form.html",
      controller: 'SessionCtrl',
      // access: accessLevels.anon
    }) 
}])

//  .run( function($rootScope, $location) {
//
//     // register listener to watch route changes
//     $rootScope.$on( "$locationChangeStart", function(event, next, current) {
//       if ( $rootScope.currentUser == null ) {
//         // no logged user, we should be going to #login
//         if ( next.templateUrl == "partials/login.html" ) {
//           // already going to #login, no redirect needed
//         } else {
//           // not going to #login, we should redirect now
//           $location.path( "/login" );
//         }
//       } else if ($rootScope.currentUser.admin) {
//         
//       }
//     });
//  });
