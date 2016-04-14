$(document).ready(function() {
  console.log("The DOM is ready for some Angular Magic.");
  $("input").click(function(e) {
    e.preventDefault();
  });
});


var twitterApp = angular.module('twitterApp',[]);

twitterApp.controller('FormAndCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.update = function() {
    $http({
      method: 'post',
      url: '/dm',
      data: $scope.messageSend,
    }).then(function successCallback(response) {
      console.log('Message Success');
      $scope.completed = response.data[0].message;
    }, function errorCallback(error) {
      console.log(error);
    });
  }
}]);

