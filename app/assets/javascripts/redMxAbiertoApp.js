// 'Red México Abierto' webapp

var app = angular.module('redMxAbiertoApp', []);

app.controller('stepsCtrl', function(){
  var self = this;
  this.names = [];

  this.addNewStep = function(){
    this.names.push(null);
  };
});
