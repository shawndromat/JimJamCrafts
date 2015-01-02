angular.module('Utils', [])
.factory('Model', ['$http', function($http) {

  return function(options) {

    var url = window.location.origin + options.url;

    factory = function (attrs) {
      attrs = attrs || {};
      _.extend(this, this.parse(attrs));
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
        console.log(response)
        return new factory(response.data);
      });
    }
    

    factory.prototype.parse = function(response) {
      return response;
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
