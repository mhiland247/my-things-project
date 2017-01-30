MyApp.factory('Posts', ['$resource', function($resource) {
    return $resource('http://www.michellehiland.com/things/:id', {}, {
        query: {
            method: 'GET',
            url: 'http://www.michellehiland.com/things/',
            isArray: true,
            transformResponse: function (data, headers) {
                return angular.fromJson(data).results;
            }
        }
    });
}]);

MyApp.factory('Passions', ['$resource', function($resource) {
    return $resource('http://www.michellehiland.com/passions/:id', {}, {
        query: {
            method: 'GET',
            url: 'http://www.michellehiland.com/passions/',
            isArray: true,
            transformResponse: function (data, headers) {
                return angular.fromJson(data).results;
            }
        }
    });
}]);