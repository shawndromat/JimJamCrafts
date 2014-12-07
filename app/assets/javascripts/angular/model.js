jimjam.factory('Model', ['$http', function($http) {

  return function(options) {

    var url = options.url + "/"

    factory = function (attrs) {
      _.extend(this, attrs);
    }

    factory.getAll = function() {
      return $http.get(url).then(function(response) {
        return _.map(response.data, function(data) {
          return new factory(data);
        })
      })
    }

    factory.get = function(id) {
      return $http.get(url + id).then(function(response) {
        return new factory(response.data);
      });
    }

    factory.prototype.create = function() {
    }

    factory.prototype.save = function() {
      var promise;
      if (this.id) {
        promise = $http.patch(url, this);
      } else {
        promise = $http.post(url, this);
      }

      return promise.then(function(response) {
        _.extend(this, response.data)
      }.bind(this))
    }

    return factory;
  }
}]);
