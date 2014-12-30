jimjam.factory('Session', ['Model', 'User', '$http', function(Model, User, $http) {
  var url = 'api/users/sign_in';
  Session = Model({url: url});

  Session.prototype.save = function() {
    return $http.post(url, this);
  }

  return Session;
}]);
