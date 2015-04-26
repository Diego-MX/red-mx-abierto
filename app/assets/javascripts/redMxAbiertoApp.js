// 'Red México Abierto' webapp

var app = angular.module('redMxAbiertoApp', []);

app.controller('stagesCtrl', function(){
  var self = this;
  this.names = [];

  this.openModal = function(id) {
    var modalId = "#stageModal" + id;
    angular.element(modalId).modal('show');
  };
});

app.controller('stepsCtrl', function(){
  var self = this;
  this.names = [];

  this.openModal = function(id) {
    var modalId = "#stepModal" + id;
    angular.element(modalId).modal('show');
  };
});

app.controller('activitiesCtrl', ['$http', function($http){
  var self = this;
  this.names = [];

  this.user_activities = [];

  this.activityChecked = function(activityId) {
    // Get token
    var csrfToken = angular.element('meta[name=csrf-token]')[0].content;

    // Checkbox id and state to change
    var data = {
      authenticity_token: csrfToken,
      user_activity: {
        id: activityId,
        checked: this.user_activities[activityId]
      }
    };

    // Let's submit the checkbox info
    $http.post('/stages', data)
    .success(function(data, statues, headers, config){
      console.log('submited');
      console.log(data);
    });
  };

  this.openModal = function(id) {
    var modalId = "#activityModal" + id;
    angular.element(modalId).modal('show');
  };
}]);
