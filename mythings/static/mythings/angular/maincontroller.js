MyApp.controller('postsCtrl', ['$scope', 'Posts', function($scope, Posts) {
    //get all posts
    $scope.posts= Posts.query();
    console.log($scope.posts);

    //get a single post
    $scope.post_strangebyds = Posts.get({id:49});
    $scope.post_amys = Posts.get({id:21});
    $scope.post_tt = Posts.get({id:42});
    $scope.post_hchoice = Posts.get({id:44});
    $scope.post_muscle = Posts.get({id:25});
    $scope.post_cannabis = Posts.get({id:43});

    //create new post

}]);

MyApp.controller('passionsCtrl', ['$scope', '$location', 'Passions', function($scope, $location, Passions) {
    //get all posts
    $scope.passion= Passions.query();
    console.log($scope.passion);

    //create link to new view
    //$scope.go = function(path){
       // $location.path(path);
//   };
}]);