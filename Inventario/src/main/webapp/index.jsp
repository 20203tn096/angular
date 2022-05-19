<%-- Document : index Created on : 19 may 2022, 12:04:45 Author : CDS --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html ng-app="index">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Inicio</title>
            <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="./assets/css/styles.css">
            <script src="./assets/js/angular.js"></script>
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://unpkg.com/feather-icons"></script>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        </head>

        <body ng-controller="controlador1" >
            <div ng-include="'./plantillas/sidebar.html'"></div>

            <div id="main" ng-init="consultar()">
                <div ng-include="'./plantillas/header.html'"></div>
                <div class="w3-container">
                    <div class="row justify-content-center mt-3">
                        <div class="col-12 col-md-12 col-lg-10 ">
                            <div class="card " style="width: auto; height: auto;">
                                <div class="card-header text-start"
                                    style="background-color: #002E60; font-size: 25; color: #fff;">
                                    <div class="row">
                                        <div class="col-12 col-md-7">
                                            <h4 style="font-weight: bold;">Productos</h4>
                                        </div>
                                        <div class="col-10 col-md-4 text-end">
                                            <input type="text" ng-model="search" placeholder="Buscar"
                                                class="form-control">
                                        </div>
                                        <div class="col-2 col-md-1  ">
                                            <button class="btn"
                                                style="background-color: #009475; width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;"
                                                ng-click="register()">
                                                <i data-feather="plus" style="color: #fff;"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead style="background-color: #002E60; color: #fff;">
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Marca</th>
                                                    <th>Fecha</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody ng-if="productos.length > 0">

                                                <tr ng-repeat="producto in productos | filter: search as results">

                                                    <th>{{producto.nombre}}</th>
                                                    <th>{{producto.marca}}</th>
                                                    <th>{{producto.fecha}}</th>
                                                    <th ng-if="producto.estado == 1">
                                                        <span class="badge"
                                                            style="background-color: green">Activo</span>
                                                    </th>
                                                    <th ng-if="producto.estado == 0">
                                                        <span class="badge"
                                                            style="background-color: red">Inactivo</span>
                                                    </th>
                                                    <th>

                                                        <button type="button" ng-show="producto.estado != 0"
                                                            class="btn btn-danger mb-2" ng-click="eliminar(producto)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="trash-2" style="color: #fff;"></i>
                                                        </button>
                                                        <button type="button" ng-show="producto.estado != 1"
                                                            class="btn btn-success mb-2" ng-click="restablecer(producto)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="check-circle" style="color: #fff;"></i>
                                                        </button>
                                                        <button type="button" ng-show="producto.estado != 0"
                                                            class="btn btn-primary mb-2" ng-click="modificar(producto)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="edit" style="color: #fff;"></i>
                                                        </button>
                                                    </th>

                                                </tr>
                                            </tbody>
                                            <tbody ng-if="personas.length == 0">
                                                <tr>
                                                    <th colspan="6" class="text-center">Sin registros</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Registrar Producto</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                        <div class="col-12">
                          <div class="input-group mt-2">
                            <div class="input-group-prepend">
                              <span class="input-group-text" id="basic-addon1">Nombre</span>
                            </div>
                            <input type="text" ng-model="producto.nombre"  class="form-control"
                              placeholder="Ingresa un nombre" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group-prepend mb-3">
                            <span style="font-size: 15; color: red;">{{errorNombre}}</span>
                          </div>
                        </div>
            
            
                        <div class="col-12">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text" id="basic-addon1">Marca</span>
                            </div>
                            <input type="text" ng-model="producto.marca" class="form-control"
                              placeholder="Ingresa un apellido" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group-prepend mb-3">
                            <span style="font-size: 15; color: red;">{{errorMarca}}</span>
                          </div>
                        </div>
            
            
                        <div class="col-12">
                          <div class="input-group ">
                            <div class="input-group-prepend">
                              <span class="input-group-text" id="basic-addon1">Precio</span>
                            </div>
                            <input type="number" ng-model="producto.precio" class="form-control"
                              placeholder="Ingresa un apellido" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group-prepend mb-3">
                            <span style="font-size: 15; color: red;">{{errorPrecio}}</span>
                          </div>
                        </div>
            
                        <div class="col-12">
                          <div class="input-group ">
                            <div class="input-group-prepend">
                              <span class="input-group-text" id="basic-addon1">Cantidad</span>
                            </div>
                            <input type="number" ng-model="producto.cantidad" class="form-control"
                              placeholder="Ingresa una edad" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group-prepend mb-3">
                            <span style="font-size: 15; color: red;">{{errorCantidad}}</span>
                          </div>
                        </div>
            
                        
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" ng-click="cancelar()" class="btn btn-secondary">Cancelar</button>
                      <button type="button" ng-click="registrar()" class="btn btn-primary">Guardar</button>
                    </div>
                  </div>
                </div>
              </div>

            <script>
                function w3_open() {
                    if (document.getElementById("mySidebar").style.display == "block") {
                        document.getElementById("main").style.marginLeft = "0%";
                        document.getElementById("mySidebar").style.display = "none";
                        document.getElementById("openNav").style.display = 'inline-block';
                    } else {
                        document.getElementById("main").style.marginLeft = "25%";
                        document.getElementById("mySidebar").style.width = "25%";
                        document.getElementById("mySidebar").style.display = "block";
                        document.getElementById("openNav").style.display = 'inline-block';
                    }

                }
            </script>
            <script src="./assets/js/Validacion.js"></script>
            <script>
                const app = angular.module("index", [])
                const controlador = app.controller("controlador1", ["$scope", "$http", ($scope, $http) => {

                    $scope.producto = {
                        nombre: "",
                        marca: "",
                        precio: 0,
                        cantidad: 0
                    }
                    $scope.consultar = () => {
                        $http({
                            method: 'GET',
                            url: 'http://localhost:8080/Inventario/findAllProducto',
                        }).then(function successCallback(response) {
                            $scope.productos = response.data.mensaje.datos;
                           
                        }, function errorCallback(response) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error en el servidor',
                                text: 'Error en el servidor, intentalo de nuevo',
                                allowOutsideClick: false
                            })
                        });
                    }

                    $scope.register = () =>{
                        $('#register').modal('show');
                    }

                    $scope.cancelar = () =>{
                        $('#register').modal('hide');
                    }

                    $scope.registrar = () =>{
                        let success = validarCampos($scope.producto)
                        if(!success){

                        }else{
                            Swal.fire({
                                icon: 'error',
                                title: 'Campos con errores',
                                text: 'Llena correctamente los campos correspondientes',
                                allowOutsideClick: false
                            })
                        }
                    }

                    const validarCampos = ({nombre, marca, precio, cantidad}) =>{
                        let vNombre = false, vMarca = false, vPrecio = false, vCantidad = false;

                        if(ValidarNombre(nombre)){
                            $scope.errorNombre = ValidarNombre(nombre)
                            vNombre = true
                        }else{
                            $scope.errorNombre = ""
                            vNombre = false
                        }

                        if(ValidarMarca(marca)){
                            $scope.errorMarca = ValidarMarca(marca)
                            vMarca = true
                        }else{
                            $scope.errorMarca = ""
                            vMarca = false
                        }

                        if(ValidarPrecio(precio)){
                            $scope.errorPrecio = ValidarPrecio(precio)
                            vPrecio = true
                        }else{
                            $scope.errorPrecio = ""
                            vPrecio = false
                        }

                        if(ValidarCantidad(cantidad)){
                            $scope.errorCantidad = ValidarCantidad(cantidad)
                            vCantidad = true
                        }else{
                            $scope.errorCantidad = ""
                            vCantidad = false
                        }

                        return vNombre || vCantidad || vMarca || vPrecio;
                    }


                }])
            </script>

            
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
                crossorigin="anonymous"></script>
            <script>
                feather.replace()
            </script>
        </body>

        </html>