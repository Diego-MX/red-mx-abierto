// 'Red México Abierto' webapp

var app = angular.module('redMxAbiertoApp', ['ngCookies']);

app.controller('stagesCtrl', function(){
  var self = this;
  self.names = [];

  self.openModal = function(id) {
    var modalId = "#stageModal" + id;
    angular.element(modalId).modal('show');
  };
});

app.controller('stepsCtrl', function(){
  var self = this;
  self.names = [];

  self.openModal = function(id) {
    var modalId = "#stepModal" + id;
    angular.element(modalId).modal('show');
  };
});

app.controller('activitiesCtrl', [ '$http', '$cookies', function($http, $cookies){
  var self = this;

  self.init = function() {
    // initialize variables
    self.names = [];
    self.user_activities = [];
    self.hideWelcomeMessage = !!$cookies["_hide_first_log_in_message"];

    // active tab variables
    self.currentStage = null;
    self.currentStep = null;
  };

  self.activityChecked = function(activityId) {
    // Get token
    var csrfToken = angular.element('meta[name=csrf-token]')[0].content;

    // Checkbox id and state to change
    var data = {
      authenticity_token: csrfToken,
      user_activity: {
        id: activityId,
        checked: self.user_activities[activityId]
      }
    };

    // Let's submit the checkbox info
    $http.post('/user_activities', data)
    .success(function(data, statues, headers, config){
      // do something when the checkbox has beeen successfully submitted ...
      // e.g. strike the checklist item or show a message that it has been updated
    });
  };

  self.openModal = function(id) {
    var modalId = "#activityModal" + id;
    angular.element(modalId).modal('show');
  };

  self.hideFirstTimeUserMessage = function() {
    // Let's set a cookie so that the message doesn't appear again
    self.hideWelcomeMessage = true;
    $cookies["_hide_first_log_in_message"] = true;
  };

  // let's add some code for the active tabs
  // stages_path
  self.setTabs = function(stageId, stepId) {
    self.setStageTab(stageId);
    self.setStepTab(stepId);
  };

  self.setStageTab = function(id) {
    self.currentStage = id;
  };

  self.setStepTab = function(id) {
    self.currentStep = id;
  };

  self.init();
}]);
