<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="s" uri="/struts-tags" %>

        <!DOCTYPE html>
        <html ng-app="myApp">

        <head>
            <title>Inicio</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
                integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
                crossorigin="anonymous">
            <script src="./js/angular.js"></script>
            <link rel="stylesheet" href="./css/styles.css">
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
            <script src="https://code.angularjs.org/1.8.2/angular-route.min.js"></script>
            <!-- <script src="./css/styles.css"></script> -->
        </head>

        <body ng-controller="controlador">
            <div ng-include="'./plantillas/navbar.html'"></div>

            <div class="container-fluid">
                <div class="row justify-content-center pt-5 ">
                    <div class="col-12 col-sm-12 col-md-5  " style="box-shadow: 0px 5px 15px 0px black;">

                        <div class="input-group mt-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Nombre</span>
                            </div>
                            <input type="text" class="form-control" ng-model="nombre" placeholder="Ingresa un nombre">

                        </div>
                        <div class="input-group-append mt-2 mb-2">
                            <span style="font-size: 10; color:red;" ng-model="errorNombre">{{errorNombre}}</span>
                        </div>


                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text">Apellido Paterno</span>
                            </div>
                            <input type="text" class="form-control" ng-model="apellidoPaterno"
                                placeholder="Ingresa un apellido">
                        </div>

                        <div class="input-group-append mt-2 mb-2">
                            <span style="font-size: 10; color:red;" ng-model="errorApellido1">{{errorApellido1}}</span>
                        </div>

                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text">Apellido Materno</span>
                            </div>
                            <input type="text" class="form-control" ng-model="apellidoMaterno"
                                placeholder="Ingresa un apellido">
                        </div>

                        <div class="input-group-append mt-2 mb-2">
                            <span style="font-size: 10; color:red;" ng-model="errorApellido2">{{errorApellido2}}</span>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Fecha de nacimiento</span>
                            </div>
                            <input type="date" class="form-control" ng-model="fecha">
                        </div>

                        <div class="input-group-append mt-2 mb-2">
                            <span style="font-size: 10; color:red;" ng-model="errorFecha">{{errorFecha}}</span>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Genero</span>
                            </div>
                            <select ng-model="genero">
                                <option value="" selected="selected" hidden="hidden">Choose here</option>
                                <option value="H">Hombre</option>
                                <option value="M">Mujer</option>
                            </select>

                        </div>

                        <div class="input-group-append mt-2 mb-2">
                            <span style="font-size: 10; color:red;" ng-model="errorSexo">{{errorSexo}}</span>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Entidad Federativa</span>
                            </div>
                            <select ng-model="entidad" id="entidad">
                                <option value="" selected="selected" hidden="hidden">Choose here</option>
                            </select>

                        </div>

                        <div class="input-group-append mt-2 mb-2">
                            <span style="font-size: 10; color:red;" ng-model="errorEntidad">{{errorEntidad}}</span>
                        </div>

                        <div class="input-group mb-3">
                            <button ng-click="generar()" class="btn btn-success"> Generar</button>
                        </div>




                    </div>
                    <div class="col-12  col-sm-12 col-md-4 bg-danger gradient-custom-2 "
                        style="box-shadow: 0px 5px 15px 0px black;">
                        <div class="card m-5"
                            style="width: auto; height: auto ; background: none; box-shadow: 5px 2px 2px black;">
                            <h2 class="text-center mt-2 " style="color: #fff; text-align: justify;">CURP Generado</h1>
                                <div class="card-body text-center">
                                    <h5 style="color: #fff;" 
                                        ng-show="vCurp">{{curp}}</h5>
                                        <h5 style="color: #fff;" ng-model="defecto"
                                       ng-show="defecto">Sin generarse</h5>
                                </div>
                        </div>
                    </div>


                </div>
                <a href="/tabla">Ir a la tabla</a>

            </div>
            <script src="./js/estados.js"></script>

            <script>
                const myApp = angular.module("myApp", [])
                const controlador = myApp.controller("controlador", ["$scope", "$http", ($scope, $http) => {
                    $scope.defecto = true
                    $scope.generar = () => {
                        let success = validador($scope.nombre, $scope.apellidoPaterno, $scope.apellidoMaterno, formatDate($scope.fecha), $scope.genero, $scope.entidad)
                        console.log("Estado", success);
                        let datos = {
                            nombre: $scope.nombre,
                            apellidoPaterno: $scope.apellidoPaterno,
                            apellidoMaterno: $scope.apellidoMaterno,
                            fecha: formatDate($scope.fecha),
                            genero: $scope.genero,
                            entidad: $scope.entidad
                        }

                        if (!success) {
                            $http({
                                method: 'POST',
                                url: 'http://localhost:8080/getPersona',
                                data: "params=" + JSON.stringify(datos),
                                headers: {
                                    // 'Content-Type': 'application/json',
                                    'Content-Type': 'application/x-www-form-urlencoded'
                                }
                            }).then(function successCallback(response) {
                                $scope.curp = response.data.curp
                                $scope.vCurp = true
                                $scope.defecto = false
                            }, function errorCallback(response) {
                                Swal.fire({
                                    icon: 'Error del servidor',
                                    title: 'Oops...',
                                    text: 'Vuelve a intentarlo!',
                                })
                                $scope.vCurp = false
                                $scope.defecto = true
                            });
                        } else {
                            Swal.fire({
                                icon: 'Campos vacios',
                                title: 'Oops...',
                                text: 'Llena todos los campos correspondientes!',
                            })
                        }

                    }



                    const validador = (nombre, apellido1, apellido2, fecha, sexo, entidad) => {
                        let vNombre = false, vApellido1 = false, vApellido2 = false, vFecha = false, vSexo = false, vEntidad = false;


                        if (validarCampo(nombre)) {
                            $scope.errorNombre = validarCampo(nombre)
                            vNombre = true
                        } else {
                            $scope.errorNombre = ""
                            vNombre = false
                        }
                        if (validarCampo(apellido1)) {
                            $scope.errorApellido1 = validarCampo(apellido1)
                            vApellido1 = true
                        } else {
                            $scope.errorApellido1 = ""
                            vApellido1 = false
                        }
                        if (validarCampo(apellido2)) {
                            $scope.errorApellido2 = validarCampo(apellido2)
                            vApellido2 = true
                        } else {
                            $scope.errorApellido2 = ""
                            vApellido2 = false
                        }
                        if (validarCampo(fecha)) {
                            $scope.errorFecha = validarCampo(fecha)
                            vFecha = true
                        } else {
                            $scope.errorFecha = ""
                            vFecha = false
                        }
                        if (validarCampo(sexo)) {
                            $scope.errorSexo = validarCampo(sexo)
                            vSexo = true
                        } else {
                            $scope.errorSexo = ""
                            vSexo = false
                        } entidad
                        if (validarCampo(entidad)) {
                            $scope.errorEntidad = validarCampo(entidad)
                            vEntidad = true
                        } else {
                            $scope.errorEntidad = ""
                            vEntidad = false
                        }


                        return vNombre || vApellido1 || vApellido2 || vFecha || vSexo || vEntidad
                    }

                    const validarCampo = (campo) => {
                        if (campo == "" || campo == undefined) return "Campo obligatorio"
                        return null
                    }






                    function formatDate(date) {
                        if (date == "" || date == undefined) {
                            return null
                        } else {
                            var d = new Date(date),
                                month = '' + (d.getMonth() + 1),
                                day = '' + d.getDate(),
                                year = d.getFullYear();

                            if (month.length < 2)
                                month = '0' + month;
                            if (day.length < 2)
                                day = '0' + day;

                            return [year, month, day].join('-');
                        }

                    }
                }])
            </script>

        </body>

        </html>