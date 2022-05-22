<%-- Document : index Created on : 19 may 2022, 12:04:45 Author : CDS --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html ng-app="indexCategorias">

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

        <body ng-controller="controlador2">
            <div ng-include="'./plantillas/sidebar.html'"></div>

            <div id="main" ng-init="consultar()">
                <div ng-include="'./plantillas/header.html'"></div>
                <div class="w3-container">
                    <div class="row justify-content-center mt-3">
                        <div class="col-12 col-md-12 col-lg-12 ">
                            <div class="card  " style="width: auto; height: auto; box-shadow: 0px 5px 15px 0px black;">
                                <div class="card-header text-start"
                                    style="background-color: #002E60; font-size: 25; color: #fff;">
                                    <div class="row">
                                        <div class="col-12 col-md-7">
                                            <h4 style="font-weight: bold;">Categorías</h4>
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

                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody ng-if="categorias.length > 0">

                                                <tr ng-repeat="categoria in categorias | filter: search as results">

                                                    <th>{{categoria.nombre}}</th>
                                                    <th ng-if="categoria.estado == 1">
                                                        <span class="badge"
                                                            style="background-color: green">Activo</span>
                                                    </th>
                                                    <th ng-if="categoria.estado == 0">
                                                        <span class="badge"
                                                            style="background-color: red">Inactivo</span>
                                                    </th>
                                                    <th>

                                                        <button type="button" ng-show="categoria.estado != 0"
                                                            class="btn btn-danger mb-2"
                                                            ng-click="eliminar(categoria, 1)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="trash-2" style="color: #fff;"></i>
                                                        </button>
                                                        <button type="button" ng-show="categoria.estado != 1"
                                                            class="btn btn-success mb-2"
                                                            ng-click="eliminar(categoria, 2)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="check-circle" style="color: #fff;"></i>
                                                        </button>
                                                        <button type="button" ng-show="categoria.estado != 0"
                                                            class="btn btn-primary mb-2" ng-click="modificar(categoria)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="edit" style="color: #fff;"></i>
                                                        </button>

                                                        <button type="button" class="btn btn-warning mb-2"
                                                            ng-click="ver(categoria)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="eye" style="color: #fff;"></i>
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
                            <h5 class="modal-title" id="exampleModalLabel">Registrar Categoría</h5>
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
                                        <input type="text" ng-model="categoriaNueva.nombre" class="form-control"
                                            placeholder="Ingresa un nombre" aria-label="Username"
                                            aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group-prepend mb-3">
                                        <span style="font-size: 15; color: red;">{{errorNombre}}</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-secondary">Cancelar</button>
                            <button type="button" ng-click="registrar()" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modificar Categoría</h5>
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
                                        <input type="text" ng-model="categoriaActualizada.nombre"
                                            ng-value="categoriaOriginal.nombre" class="form-control"
                                            placeholder="Ingresa un nombre" aria-label="Username"
                                            aria-describedby="basic-addon1">
                                    </div>
                                    <div class="input-group-prepend mb-3">
                                        <span style="font-size: 15; color: red;">{{errorNombreUp}}</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-secondary">Cancelar</button>
                            <button type="button" ng-click="cambiar()" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="view" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Información de la Categoría</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="row mt-2 mb-2">
                                <div class="col-6">
                                    <div class="input-group mt-2">
                                        <span style="font-weight: bold; font-size: 15;">Nombre: </span>
                                     </div>
                                     <div class="input-group mb-2">
                                         <span style="font-size: 15;">{{categoriaVista.nombre}}</span>
                                     </div>
                                </div>
                                <div class="col-6 ">
                                    <div class="input-group mt-2">
                                        <span style="font-weight: bold; font-size: 15;">Estado: </span>
                                     </div>
                                     <div class="input-group mb-2">
                                            <span class="badge" ng-show="categoriaVista.estado == 1"
                                                style="background-color: green">Activo</span>
            
                                            <span class="badge" ng-show="categoriaVista.estado == 0"
                                                style="background-color: red">Inactivo</span>
                                </div>

                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" ng-click="cancelar()" class="btn btn-secondary"
                                data-dismiss="modal">Cerrar</button>
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
                const app = angular.module("indexCategorias", [])
                const controlador = app.controller("controlador2", ["$scope", "$http", ($scope, $http) => {

                    $scope.categoriaNueva = {
                        nombre: "",
                    }


                    $scope.consultar = () => {
                        $http({
                            method: 'GET',
                            url: 'http://localhost:8080/Inventario/findAllCategorias',
                        }).then(function successCallback(response) {
                            $scope.categorias = response.data.mensaje.datos;

                        }, function errorCallback(response) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error en el servidor',
                                text: 'Error en el servidor, intentalo de nuevo',
                                allowOutsideClick: false
                            })
                        });
                    }


                    $scope.register = () => {
                        $('#register').modal('show');
                    }

                    $scope.registrar = () => {
                        console.log("Hola", $scope.categoriaNueva);
                        let success = validarCampos($scope.categoriaNueva)
                        console.log(success ? "Con errores" : "Sin errores");
                        if (!success) {
                            Swal.fire({
                                title: '¿Quieres guardar los cambios?',
                                showCancelButton: true,
                                confirmButtonText: 'Confirmar',
                                cancelButtonText: `Cancelar`,
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $http({
                                        method: 'POST',
                                        url: 'http://localhost:8080/Inventario/registrarCategoria',
                                        data: "datos=" + JSON.stringify($scope.categoriaNueva),
                                        headers: {
                                            // 'Content-Type': 'application/json',
                                            'Content-Type': 'application/x-www-form-urlencoded'
                                        }
                                    }).then(function successCallback(response) {
                                        console.log(response.status);
                                        if (!response.data.mensaje.error) {
                                            Swal.fire({
                                                icon: "success",
                                                title: 'Guardado!',
                                                confirmButtonText: 'Ok',
                                                allowOutsideClick: false
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    $('#register').modal('hide');
                                                    $scope.consultar();
                                                }
                                            })
                                        } else {
                                            if (response.data.mensaje.errores) {
                                                if (response.data.mensaje.errores.nombre) {
                                                    $scope.errorNombre = response.data.mensaje.errores.nombre
                                                } else {
                                                    $scope.errorNombre = ""
                                                }
                                            }
                                        }
                                    }, function errorCallback(response) {
                                        console.log(response);

                                    });

                                } else if (result.isDenied) {
                                    Swal.fire('Changes are not saved', '', 'info')
                                }
                            })
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Campos con errores',
                                text: 'Llena correctamente los campos correspondientes',
                                allowOutsideClick: false
                            })
                        }
                    }

                    const validarCampos = ({ nombre }) => {
                        let vNombre = false;

                        if (ValidarNombreCategoria(nombre)) {
                            $scope.errorNombre = ValidarNombreCategoria(nombre)
                            vNombre = true
                        } else {
                            $scope.errorNombre = ""
                            vNombre = false
                        }


                        return vNombre;
                    }

                    const validarActualizacion = ({ nombre }) => {
                        let vNombre = false;

                        if (ValidarNombreCategoria(nombre)) {
                            $scope.errorNombreUp = ValidarNombreCategoria(nombre)
                            vNombre = true
                        } else {
                            $scope.errorNombreUp = ""
                            vNombre = false
                        }


                        return vNombre;
                    }

                    $scope.modificar = (categoria) => {
                        $('#update').modal('show');
                        $scope.categoriaActualizada = { ...categoria }
                        delete $scope.categoriaActualizada.$$hashKey;
                        $scope.categoriaOriginal = { ...categoria }
                    }

                    $scope.cambiar = () => {
                        console.log("Categoria", $scope.categoriaActualizada);
                        let success = validarActualizacion($scope.categoriaActualizada);
                        if (!success) {
                            const isSame = same($scope.categoriaActualizada, $scope.categoriaOriginal)
                            if (!isSame) {
                                Swal.fire({
                                    title: '¿Quieres guardar los cambios?',
                                    showCancelButton: true,
                                    confirmButtonText: 'Confirmar',
                                    cancelButtonText: `Cancelar`,
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        $http({
                                            method: 'POST',
                                            url: 'http://localhost:8080/Inventario/actualizarCategoria',
                                            data: "datos=" + JSON.stringify($scope.categoriaActualizada),
                                            headers: {
                                                // 'Content-Type': 'application/json',
                                                'Content-Type': 'application/x-www-form-urlencoded'
                                            }
                                        }).then(function successCallback(response) {
                                            console.log(response);
                                            if (!response.data.mensaje.error) {
                                                Swal.fire({
                                                    icon: "success",
                                                    title: 'Actualizada!',
                                                    confirmButtonText: 'Ok',
                                                    allowOutsideClick: false
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        $('#update').modal('hide');
                                                        $scope.consultar();
                                                    }
                                                })
                                            } else {
                                                if (response.data.mensaje.errores) {
                                                    if (response.data.mensaje.errores.nombre) {
                                                        $scope.errorNombreUp = response.data.mensaje.errores.nombre
                                                    } else {
                                                        $scope.errorNombreUp = ""
                                                    }
                                                    if (response.data.mensaje.errores.id) {
                                                        Swal.fire({
                                                            icon: 'error',
                                                            title: 'La categoria o no existe',
                                                            text: 'La categoria no existe intentalo de nuevo',
                                                            allowOutsideClick: false
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                $('#update').modal('hide');
                                                                $scope.consultar();
                                                            }
                                                        })
                                                    }
                                                }
                                            }
                                        }, function errorCallback(response) {
                                            console.log(response);

                                        });

                                    } else if (result.isDenied) {
                                        Swal.fire('Changes are not saved', '', 'info')
                                    }
                                })

                            } else {
                                Swal.fire({
                                    icon: 'question',
                                    title: 'Sin datos a modificar',
                                    text: 'Realiza las modificaciones correspondientes',
                                    allowOutsideClick: false
                                })
                            }

                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Campos con errores',
                                text: 'Llena correctamente los campos correspondientes',
                                allowOutsideClick: false
                            })
                        }
                    }

                    const same = (categoriaNueva, categoriaAnterior) => {
                        return ValidarSame(categoriaNueva.nombre, categoriaAnterior.nombre)
                    }

                    $scope.eliminar = (categoria, proceso) => {
                        Swal.fire({
                            title: proceso == 1 ? '¿Estas seguro de eliminar este registro?' : '¿Estas seguro de restablecer este registro?',
                            showCancelButton: true,
                            confirmButtonText: 'Confirmar',
                            cancelButtonText: `Cancelar`,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $http({
                                    method: 'POST',
                                    url: 'http://localhost:8080/Inventario/eliminarCategoria',
                                    data: "datos=" + JSON.stringify(categoria),
                                    headers: {
                                        // 'Content-Type': 'application/json',
                                        'Content-Type': 'application/x-www-form-urlencoded'
                                    }
                                }).then(function successCallback(response) {
                                    if (!response.data.mensaje.error) {
                                        Swal.fire({
                                            icon: "success",
                                            title: proceso == 1 ? 'Eliminado!' : "Categoría restablecida",
                                            confirmButtonText: 'Ok',
                                            allowOutsideClick: false
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                $scope.consultar();
                                            }
                                        })
                                    } else {
                                        if (response.data.mensaje.errores) {
                                            if (response.data.mensaje.errores.id) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: response.data.mensaje.errores.id,
                                                    text: 'La categoría no existe intentalo de nuevo',
                                                    allowOutsideClick: false
                                                })
                                            }
                                            if (response.data.mensaje.errores.foranea) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: response.data.mensaje.errores.foranea,
                                                    text: 'Elimina o cambia los productos a otra categoría',
                                                    allowOutsideClick: false
                                                })
                                            }
                                        }
                                    }

                                }, function errorCallback(response) {
                                    console.log(response);

                                });

                            } else if (result.isDenied) {
                                Swal.fire('Cambios no guardados', '', 'info')
                            }
                        })
                    }

                    
                    $scope.ver = (categoria) => {
                        $('#view').modal('show');
                        $scope.categoriaVista = {...categoria}
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