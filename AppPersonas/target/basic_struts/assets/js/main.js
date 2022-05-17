import ValidacionesUsuario from "./constantes"

const app = angular.module("personas", [])
const controlador = app.controller("controlador", ["$scope", "$http", ($scope, $http) => {

      $http({
        method: 'GET',
        url: 'http://localhost:8080/getPersonas',
        headers: {
            // 'Content-Type': 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    }).then(function successCallback(response) {
       console.log(response);
    }, function errorCallback(response) {
        console.log(response);

    });



}])
