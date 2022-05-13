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
            <!-- <script src="./css/styles.css"></script> -->
        </head>

        <body ng-controller="controlador">
            <div ng-include="'./plantillas/navbar.html'"></div>

            <div class="container-fluid">
                <div class="row justify-content-center pt-5 ">
                    <div class="col-12 col-sm-12 col-md-5  " style="box-shadow: 0px 5px 15px 0px black;">

                        <div class="input-group mb-3 mt-2">
                            <div class="input-group-append">
                                <span class="input-group-text">Nombre</span>
                            </div>
                            <input type="text" class="form-control" ng-model="nombre" placeholder="Ingresa un nombre">
                            
                        </div>
                        <div class="input-group-append mt-1">
                            <span style="font-size: 10; color:red;" ng-model="errorNombre">{{errorNombre}}</span>

                        </div>

                        <div class="input-group mb-3 mt-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Apellido Paterno</span>
                            </div>
                            <input type="text" class="form-control" ng-model="apellidoPaterno"
                                placeholder="Ingresa un apellido">
                                <br>
                                <span style="font-size: 10; color:red;">{{errorApellido1}}</span>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Apellido Materno</span>
                            </div>
                            <input type="text" class="form-control" ng-model="apellidoMaterno"
                                placeholder="Ingresa un apellido">
                                <br>
                                <span style="font-size: 10; color:red;">{{errorApellido2}}</span>

                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Fecha de nacimiento</span>
                            </div>
                            <input type="date" class="form-control" ng-model="fecha">
                            <br>
                            <span style="font-size: 10; color:red;">{{errorFecha}}</span>

                        </div>


                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Genero</span>
                            </div>
                            <select ng-model="genero">
                                <option value="H">Hombre</option>
                                <option value="M" selected>Mujer</option>
                            </select>
                            <br>
                            <span style="font-size: 10; color:red;" ng-model="errorSexo">{{errorSexo}}</span>

                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text">Entidad Federativa</span>
                            </div>
                            <select ng-model="entidad" id="entidad">

                            </select>
                            <br><br>
                            <span style="font-size: 10; color:red;">{{errorEntidad}}</span>

                        </div>


                        <div class="input-group mb-3">
                            <button ng-click="generar()" class="btn btn-success"> Generar</button>
                        </div>




                    </div>
                    <div class="col-12  col-sm-12 col-md-4 bg-danger gradient-custom-2 "
                        style="box-shadow: 0px 5px 15px 0px black;">
                        <div class="card m-5"
                            style="width: auto; height: 20rem ; background: none; box-shadow: 5px 2px 2px black;">
                            <h2 class="text-center mt-2 " style="color: #fff; text-align: justify;">CURP Generado</h1>
                                <div class="card-body">
                                    <h5 class="card-text text-center" style="color: #fff;">
                                        <s:if test="curp != null">
                                            <s:property value="curp"></s:property>
                                        </s:if>
                                        <s:else>
                                            Sin generarse
                                        </s:else>
                                    </h5>
                                </div>
                        </div>
                    </div>


                </div>



            </div>
            <script src="./js/estados.js"></script>

            <script>
                const myApp = angular.module("myApp", [])
                const controlador = myApp.controller("controlador", ["$scope", ($scope, $http) => {
                    
                    $scope.generar = () => {
                        console.log("Nombre", $scope.nombre);
                        let success = validador($scope.nombre, $scope.apellidoPaterno, $scope.apellidoMaterno, formatDate($scope.fecha), $scope.genero, $scope.entidad)
                        console.log("Estado", success); 
                        
                    }



                    const validador = (nombre, apellido1, apellido2, fecha, sexo, entidad) =>{
                        console.log("Entro al validador");
                        let vNombre=false, vApellido1=false, vApellido2=false, vFecha=false, vSexo=false, vEntidad=false;
                        if(validarCampo(nombre)){
                            $scope.errorNombre = validarCampo(nombre)
                            console.log("Entro aqui");
                            vNombre=true
                        }else{
                            $scope.errorNombre = ""
                            console.log("Entro al else");
                            vNombre=false
                        }
                        if(validarCampo(apellido1)){
                            $scope.errorApellido1 = validarCampo(apellido1)
                            vApellido1=true
                        }else{
                            $scope.errorApellido1 = ""
                            vApellido1=false
                        }
                        if(validarCampo(apellido2)){
                            $scope.errorApellido2 = validarCampo(apellido2)
                            vApellido2=true
                        }else{
                            $scope.errorApellido2 = ""
                            vApellido2=false
                        }
                        if(validarCampo(fecha)){
                            $scope.errorFecha = validarCampo(fecha)
                            vFecha=true
                        }else{
                            $scope.errorFecha = ""
                            vFecha=false
                        }
                        if(validarCampo(sexo)){
                            $scope.errorSexo = validarCampo(sexo)
                            vSexo=true
                        }else{
                            $scope.errorSexo = ""
                            vSexo=false
                        }entidad
                        if(validarCampo(entidad)){
                            $scope.errorEntidad = validarCampo(entidad)
                            vEntidad=true
                        }else{
                            $scope.errorEntidad = ""
                            vEntidad=false
                        }


                        return vNombre || vApellido1 || vApellido2 || vFecha || vSexo || vEntidad
                    }

                    const validarCampo = (campo) =>{
                        console.log("Validacion", campo == "" );
                        if(!(campo == "")) return "Campo obligatorio"
                        return null
                    }
                    





                    function formatDate(date) {
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
                }])
            </script>
            <a href="saludar">Ir a Struts 2</a>
        </body>

        </html>