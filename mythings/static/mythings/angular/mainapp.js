var MyApp = angular.module('MyApp', ['ngResource', 'ngRoute']).config(function($httpProvider, $interpolateProvider, $resourceProvider, $routeProvider) {
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    $httpProvider.defaults.xsfrCookieName = 'csrftoken';
    $httpProvider.defaults.xsfrHeaderName = 'X-CSRFToken';
    $interpolateProvider.startSymbol('{$');
    $interpolateProvider.endSymbol('$}');
    $resourceProvider.defaults.stripTrailingSlashes = false;
    $routeProvider
        .when('/passion_list', {
            templateUrl: 'http://www.michellehiland.commythings/angular/passion_list.html',
            controller: 'passionsCtrl'
        })
        .otherwise({
            redirectTo: '/'
        });
});