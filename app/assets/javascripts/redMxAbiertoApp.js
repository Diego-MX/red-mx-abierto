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
