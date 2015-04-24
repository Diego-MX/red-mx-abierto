// 'Red México Abierto' webapp

var app = angular.module('redMxAbiertoApp', []);

app.controller('stagesCtrl', function(){
  var self = this;
  this.names = [];

  this.openModal = function(id) {
    var modalId = "#stageModal" + id;
    console.log(modalId);
    console.log(angular.element(modalId));
    angular.element(modalId).modal('show');
  };
});
