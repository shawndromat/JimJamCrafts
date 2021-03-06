angular.module('Patterns.models', ['Utils', 'PatternFiles.models'])
.factory('Pattern', ['Model', '$http', 'PatternFile', function(Model, $http, PatternFile) {
  Pattern = Model({url: '/api/patterns/'});

  Pattern.prototype.parse = function(response) {
    if (response.pattern_files) {
      this.pattern_files = _.map(response.pattern_files, function(file) {
        return new PatternFile(file);
      })
      delete response.pattern_files;
    } else {
      this.pattern_files = [];
    }

    this.etsy_url = "http://www.etsy.com/listing/" + response.listing_id;
    return response;  
  }

  Pattern.prototype.path = function() {
    if (this.get("listing_id")) {
      return window.location.origin + "/api/etsy_patterns/";
    } else {
      return window.location.origin + "/api/indie_patterns/";
    }
  }

  Pattern.prototype.url = function() {
    if (this.id) {
      return this.path() + id;
    } else {
      return this.path();
    }
  }

  return Pattern;
}]);
