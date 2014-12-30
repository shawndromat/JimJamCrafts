jimjam.factory('User', ['Model', '$http', function(Model, $http) {
  User = Model({url: 'api/users'});

  User.prototype.login = function() {
    return $http.post('api/users/sign_in', this).then(function(response) {
    console.log(response);
})
  }
  
  return User;
}]);
