angular.module('Utils', [])
.factory('Model', ['$http', function($http) {

  return function(options) {
    var url = window.location.origin + options.url;
    factory = function (attrs) {
      attrs = attrs || {};
      attrs = this.parse(attrs);

      this.attributes = {};
      this.set(attrs);
    }

    factory.url = function() {
      return url;
    }

    factory.getAll = function(query) {
      var params = query ? {query: query} : {};
      return $http.get(this.url(), {
        params: params
      }).then(function(response) {
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

    factory.prototype.get = function(attr) {
      return this.attributes[attr];
    };

    factory.prototype.set = function(attrs) {
      for (var attr in attrs) {
        this.attributes[attr] = attrs[attr];
      }
    };

    factory.prototype.url = function() {
      if (this.get('id')) {
        return url + "/" + this.get('id');
      } else {
        return url;
      }
    }

    factory.prototype.save = function() {
      var promise;
      if (this.get('id')) {
        promise = $http.patch(this.url(), this.attributes);
      } else {
        promise = $http.post(this.url(), this.attributes);
      }

      return promise.then(function(response) {
        // _.extend(this.attributes, response.data)
        this.set(response.data);
      }.bind(this))
    }

    return factory;
  }
}]);
