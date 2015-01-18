angular.module('Utils', [])
.factory('Model', ['$http', function($http) {

  return function(options) {
    var url = window.location.origin + options.url;
    factory = function (attrs) {
      attrs = attrs || {};
      _.extend(this, this.parse(attrs));
    }

    factory.url = function() {
      return url;
    }

    factory.getAll = function() {
      return $http.get(this.url()).then(function(response) {
        return _.map(response.data, function(data) {
          return new factory(data);
        })
      })
    }

    factory.get = function(id) {
      return $http.get(this.url() + '/' + id).then(function(response) {
        console.log(response)
        return new factory(response.data);
      });
    }
    

    factory.prototype.parse = function(response) {
      return response;
    }

    factory.prototype.url = function() {
      if (this.id) {
        return url + id;
      } else {
        return url;
      }
    }

    factory.prototype.save = function() {
      var promise;
      if (this.id) {
        promise = $http.patch(this.url(), this);
      } else {
        promise = $http.post(this.url(), this);
      }

      return promise.then(function(response) {
        _.extend(this, response.data)
      }.bind(this))
    }

    return factory;
  }
}]);
