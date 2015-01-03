angular.module('Downloads.models', ['Utils', 'Patterns.models'])
  .factory('DownloadCode', ['Model', '$http', 'Pattern', function (Model, $http, Pattern) {
    var url = '/api/download_codes';
    DownloadCode = Model({url: url});

    DownloadCode.search = function(code) {
      return $http({
        method: 'GET',
        url: url + "/search",
        params: {code: code}
      })
    }

    DownloadCode.prototype.parse = function(response) {
      if (response.pattern) {
        this.pattern = new Pattern(response.pattern);
        delete response.pattern;
      }
      return response;
    }
    return DownloadCode;
  }])
