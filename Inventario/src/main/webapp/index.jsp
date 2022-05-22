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

        <body ng-controller="controlador1">
            <div ng-include="'./plantillas/sidebar.html'"></div>

            <div id="main" ng-init="consultar()">
                <div ng-include="'./plantillas/header.html'"></div>
                <div class="w3-container">
                    <div class="row justify-content-center mt-3">
                        <div class="col-12 col-md-12 col-lg-12 ">
                            <div class="card  " style="width: auto; height: auto; box-shadow: 0px 5px 15px 0px black;" >
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
                                                            class="btn btn-danger mb-2" ng-click="eliminar(producto, 1)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="trash-2" style="color: #fff;"></i>
                                                        </button>
                                                        <button type="button" ng-show="producto.estado != 1"
                                                            class="btn btn-success mb-2"
                                                            ng-click="eliminar(producto, 2)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="check-circle" style="color: #fff;"></i>
                                                        </button>
                                                        <button type="button"
                                                            class="btn btn-primary mb-2" ng-click="modificar(producto)"
                                                            style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                                                            <i data-feather="edit" style="color: #fff;"></i>
                                                        </button>
                                                        
                                                        <button type="button" 
                                                            class="btn btn-warning mb-2" ng-click="ver(producto)"
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

            <div ng-include="'./plantillas/modalRegistrar.html'"></div>
            <div ng-include="'./plantillas/modalActualizar.html'"></div>
            <div ng-include="'./plantillas/modalVisualizar.html'"></div>



            


            



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
                        precio: "",
                        cantidad: "",
                        idCategoria: ""
                    }

                    $scope.productoUpdate = {
                        nombre: "",
                        marca: "",
                        precio: "",
                        cantidad: "",
                        idCategoria: ""
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

                    $scope.register = () => {
                        $('#register').modal('show');
                    }

                    $scope.cancelar = () => {
                        $('#register').modal('hide');
                    }

                    $scope.registrar = () => {
                        let success = validarCampos($scope.producto)
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
                                        url: 'http://localhost:8080/Inventario/registrarProducto',
                                        data: "datos=" + JSON.stringify($scope.producto),
                                        headers: {
                                            // 'Content-Type': 'application/json',
                                            'Content-Type': 'application/x-www-form-urlencoded'
                                        }
                                    }).then(function successCallback(response) {
                                        console.log(response.data);
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
                                                if (response.data.mensaje.errores.categoria) {
                                                    $scope.errorCategoria = response.data.mensaje.errores.categoria
                                                } else {
                                                    $scope.errorCategoria = ""
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

                    $scope.consultarActivas = () => {
                        $http({
                            method: 'GET',
                            url: 'http://localhost:8080/Inventario/findActivas',
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

                    $scope.modificar = ({ id, nombre, marca, precio, cantidad, idCategoria }) => {
                        $('#update').modal('show');
                        $scope.productoRef = {
                            id: id,
                            nombre: nombre,
                            marca: marca,
                            precio: precio,
                            cantidad: cantidad,
                            idCategoria: idCategoria
                        }

                        $scope.productoUpdate = { ...$scope.productoRef }
                    }

                    const validarCampos = ({ nombre, marca, precio, cantidad, idCategoria }) => {
                        let vNombre = false, vMarca = false, vPrecio = false, vCantidad = false, vCategoria = false;

                        console.log("Categoria", idCategoria);
                        console.log("Cantidad", cantidad);
                        console.log("Validacion precio", ValidarPrecio(precio));
                        if (ValidarNombre(nombre)) {
                            $scope.errorNombre = ValidarNombre(nombre)
                            vNombre = true
                        } else {
                            $scope.errorNombre = ""
                            vNombre = false
                        }

                        if (ValidarMarca(marca)) {
                            $scope.errorMarca = ValidarMarca(marca)
                            vMarca = true
                        } else {
                            $scope.errorMarca = ""
                            vMarca = false
                        }

                        if (ValidarPrecio(precio)) {
                            $scope.errorPrecio = ValidarPrecio(precio)
                            vPrecio = true
                        } else {
                            $scope.errorPrecio = ""
                            vPrecio = false
                        }

                        if (ValidarCantidad(cantidad)) {
                            $scope.errorCantidad = ValidarCantidad(cantidad)
                            vCantidad = true
                        } else {
                            $scope.errorCantidad = ""
                            vCantidad = false
                        }

                        if (ValidarCategoria(idCategoria)) {
                            $scope.errorCategoria = ValidarCategoria(idCategoria);
                            vCategoria = true;
                        } else {
                            $scope.errorCategoria = ""
                            vCategoria = false;
                        }

                        return vNombre || vCantidad || vMarca || vPrecio || vCategoria;
                    }

                    const validarActualizacion = ({ nombre, marca, precio, cantidad, idCategoria }) => {
                        let vNombre = false, vMarca = false, vPrecio = false, vCantidad = false, vCategoria = false;

                        if (ValidarNombre(nombre)) {
                            $scope.errorNombreUp = ValidarNombre(nombre)
                            vNombre = true
                        } else {
                            $scope.errorNombreUp = ""
                            vNombre = false
                        }

                        if (ValidarMarca(marca)) {
                            $scope.errorMarcaUp = ValidarMarca(marca)
                            vMarca = true
                        } else {
                            $scope.errorMarcaUp = ""
                            vMarca = false
                        }

                        if (ValidarPrecio(precio)) {
                            $scope.errorPrecioUp = ValidarPrecio(precio)
                            vPrecio = true
                        } else {
                            $scope.errorPrecioUp = ""
                            vPrecio = false
                        }

                        if (ValidarCantidad(cantidad)) {
                            $scope.errorCantidadUp = ValidarCantidad(cantidad)
                            vCantidad = true
                        } else {
                            $scope.errorCantidadUp = ""
                            vCantidad = false
                        }

                        if (ValidarCategoria(idCategoria)) {
                            $scope.errorCategoriaUp = ValidarCategoria(idCategoria);
                            vCategoria = true;
                        } else {
                            $scope.errorCategoriaUp = ""
                            vCategoria = false;
                        }

                        return vNombre || vCantidad || vMarca || vPrecio || vCategoria;
                    }


                    $scope.guardar = () => {
                        let success = validarActualizacion($scope.productoUpdate)
                        if (!success) {
                            let same = isSame($scope.productoUpdate, $scope.productoRef)
                            if (!same) {
                                console.log($scope.productoUpdate);
                                Swal.fire({
                                    title: '¿Quieres guardar los cambios?',
                                    showCancelButton: true,
                                    confirmButtonText: 'Confirmar',
                                    cancelButtonText: `Cancelar`,
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        $http({
                                            method: 'POST',
                                            url: 'http://localhost:8080/Inventario/actualizarProducto',
                                            data: "datos=" + JSON.stringify($scope.productoUpdate),
                                            headers: {
                                                // 'Content-Type': 'application/json',
                                                'Content-Type': 'application/x-www-form-urlencoded'
                                            }
                                        }).then(function successCallback(response) {
                                            console.log(response);
                                            if (!response.data.mensaje.error) {
                                                Swal.fire({
                                                    icon: "success",
                                                    title: 'Actualizado!',
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
                                                    if (response.data.mensaje.errores.categoria) {
                                                        $scope.errorCategoriaUp = response.data.mensaje.errores.categoria
                                                    } else {
                                                        $scope.errorCategoriaUp = ""
                                                    }
                                                    if (response.data.mensaje.errores.id) {
                                                        Swal.fire({
                                                            icon: 'error',
                                                            title: 'El producto no existe',
                                                            text: 'El producto no existe intentalo de nuevo',
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
                                    title: 'Realiza modificaciones',
                                    text: 'Agrega la información correspondiente',
                                    allowOutsideClick: false
                                })
                            }

                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Campos con errores',
                                text: 'Agrega la información correspondiente',
                            })
                        }
                    }

                    const isSame = (valoresNuevos, valoresAnteriores) => {

                        return ValidarSame(valoresNuevos.nombre, valoresAnteriores.nombre) && ValidarSame(valoresNuevos.marca, valoresAnteriores.marca)
                            && ValidarSame(valoresNuevos.precio, valoresAnteriores.precio) && ValidarSame(valoresNuevos.cantidad, valoresAnteriores.cantidad)
                            && ValidarSame(valoresNuevos.idCategoria.id, valoresAnteriores.idCategoria.id)
                    }

                    $scope.eliminar = (producto, proceso) => {

                        Swal.fire({
                            title: proceso == 1 ? '¿Estas seguro de eliminar este registro?' : '¿Estas seguro de restablecer este registro?',
                            showCancelButton: true,
                            confirmButtonText: 'Confirmar',
                            cancelButtonText: `Cancelar`,
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $http({
                                    method: 'POST',
                                    url: 'http://localhost:8080/Inventario/eliminarProducto',
                                    data: "datos=" + JSON.stringify(producto),
                                    headers: {
                                        // 'Content-Type': 'application/json',
                                        'Content-Type': 'application/x-www-form-urlencoded'
                                    }
                                }).then(function successCallback(response) {
                                    if (!response.data.mensaje.error) {
                                            Swal.fire({
                                                icon: "success",
                                                title: proceso == 1 ? 'Eliminado!' : "Producto restablecido",
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
                                                            text: 'El producto no existe intentalo de nuevo',
                                                            allowOutsideClick: false
                                                        })
                                                }
                                                if (response.data.mensaje.errores.foranea) {
                                                    Swal.fire({
                                                            icon: 'error',
                                                            title: response.data.mensaje.errores.foranea,
                                                            text: 'Categoría inexistente, crea la categoría',
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

                    $scope.ver = (producto) =>{
                        $('#view').modal('show');
                        $scope.productoVisto = {...producto, fecha: ObtenerFecha(producto.fecha)};
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