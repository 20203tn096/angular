
const app = angular.module("personas", [])
const controlador = app.controller("controlador", ["$scope", "$http", ($scope, $http) => {

    $scope.new = {
        name: "",
        surname: "",
        lastname: "",
        edad: "",
        curp: "",
    }

    $scope.register = () => {
        $('#register').modal('show');
        reiniciarVariables()
    }

    $scope.consultar = () => {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getPersona',
            headers: {
                // 'Content-Type': 'application/json',
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        }).then(function successCallback(response) {
            const { data } = response
            $scope.personas = data.personas
            console.log($scope.persona);
        }, function errorCallback(response) {
            console.log(response);

        });
    }

    $scope.modificar = ({ id, name, surname, lastname, edad, curp }) => {
        $('#update').modal('show');
        $scope.persona = {
            id: id,
            name: name,
            surname: surname,
            lastname: lastname,
            edad: edad,
            curp: curp
        }
        $scope.personaOriginal = { ...$scope.persona };
    }
    $scope.cancelar = () => {
        $('#update').modal('hide');

    }
    $scope.guardar = () => {
        let success = validarModificacion($scope.persona)
        if (!success) {
            let isSame = same($scope.persona, $scope.personaOriginal)
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
                            url: 'http://localhost:8080/update',
                            data: "datos=" + JSON.stringify($scope.persona),
                            headers: {
                                // 'Content-Type': 'application/json',
                                'Content-Type': 'application/x-www-form-urlencoded'
                            }
                        }).then(function successCallback(response) {
                            const { data } = response
                            if (data.update) {
                                Swal.fire({
                                    icon: "success",
                                    title: 'Guardado!',
                                    confirmButtonText: 'Ok',
                                    allowOutsideClick: false
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        $('#update').modal('hide');
                                        $scope.consultar();
                                    }
                                })


                            } else {
                                Swal.fire('Opps!', '', 'error')
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
    const validarModificacion = ({ id, name, surname, lastname, edad, curp }) => {
        let vName = false, vSurname = false, vLastname = false, vEdad = false, vCurp = false

        if (ValidarNombre(name)) {
            $scope.errorNombreUp = ValidarNombre(name)
            vName = true
        } else {
            $scope.errorNombreUp = ValidarNombre(name)
            vName = false
        }
        if (ValidarApellido(surname)) {
            $scope.errorApellidoUp1 = ValidarApellido(surname)
            vSurname = true
        } else {
            $scope.errorApellidoUp1 = ""
            vSurname = false
        }
        if (ValidarApellido(lastname)) {
            $scope.errorApellidoUp2 = ValidarApellido(lastname)
            vLastname = true
        } else {
            $scope.errorApellidoUp2 = ""
            vLastname = false
        }
        if (ValidarEdad(edad)) {
            $scope.errorEdadUp = ValidarEdad(edad)
            vEdad = true
        } else {
            $scope.errorEdadUp = ""
            vEdad = false
        }
        if (ValidarCampo(curp)) {
            $scope.errorCurpUp = ValidarCampo(curp)
            vCurp = true
        } else {
            $scope.errorCurpUp = ""
            vCurp = false
        }

        return vName || vEdad || vSurname || vLastname || vCurp;
    }
    const same = (valoresNuevos, valoresAnteriores) => {

        return isSame(valoresNuevos.name, valoresAnteriores.name) && isSame(valoresNuevos.surname, valoresAnteriores.surname)
            && isSame(valoresNuevos.lastname, valoresAnteriores.lastname) && isSame(valoresNuevos.edad, valoresAnteriores.edad)
            && isSame(valoresNuevos.curp, valoresAnteriores.curp)
    }

    $scope.cancelarRegistro = () => {
        $('#register').modal('hide');
    }

    $scope.registrar = () => {
        let success = validarRegistro($scope.new)
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
                        url: 'http://localhost:8080/insert',
                        data: "datos=" + JSON.stringify($scope.new),
                        headers: {
                            // 'Content-Type': 'application/json',
                            'Content-Type': 'application/x-www-form-urlencoded'
                        }
                    }).then(function successCallback(response) {
                        const { data } = response
                        if (data.insert) {
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
                            Swal.fire('Opps!', '', 'error')
                        }
                    }, function errorCallback(response) {
                        console.log(response);

                    });

                } else if (result.isDenied) {
                    Swal.fire('Cambios no guardados', '', 'info')
                }
            })


        } else {
            Swal.fire({
                icon: 'error',
                title: 'Campos con errores',
                text: 'Agrega la información correspondiente',
            })
        }

    }
    const reiniciarVariables = () => {
        $scope.new = {
            name: "",
            surname: "",
            lastname: "",
            edad: "",
            curp: "",
        }

    }

    const validarRegistro = ({ id, name, surname, lastname, edad, curp }) => {
        let vName = false, vSurname = false, vLastname = false, vEdad = false, vCurp = false

        if (ValidarNombre(name)) {
            $scope.errorNombre = ValidarNombre(name)
            vName = true
        } else {
            $scope.errorNombre = ValidarNombre(name)
            vName = false
        }
        if (ValidarApellido(surname)) {
            $scope.errorApellido1 = ValidarApellido(surname)
            vSurname = true
        } else {
            $scope.errorApellido1 = ""
            vSurname = false
        }
        if (ValidarApellido(lastname)) {
            $scope.errorApellido2 = ValidarApellido(lastname)
            vLastname = true
        } else {
            $scope.errorApellido2 = ""
            vLastname = false
        }
        if (ValidarEdad(edad)) {
            $scope.errorEdad = ValidarEdad(edad)
            vEdad = true
        } else {
            $scope.errorEdad = ""
            vEdad = false
        }
        if (ValidarCampo(curp)) {
            $scope.errorCurp = ValidarCampo(curp)
            vCurp = true
        } else {
            $scope.errorCurp = ""
            vCurp = false
        }

        return vName || vEdad || vSurname || vLastname || vCurp;
    }

    $scope.eliminar = (persona) => {

        console.log(persona);
        Swal.fire({
            title: '¿Estas seguro de eliminar este registro?',
            showCancelButton: true,
            confirmButtonText: 'Confirmar',
            cancelButtonText: `Cancelar`,
        }).then((result) => {
            if (result.isConfirmed) {
                $http({
                    method: 'POST',
                    url: 'http://localhost:8080/delete',
                    data: "datos=" + JSON.stringify(persona),
                    headers: {
                        // 'Content-Type': 'application/json',
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                }).then(function successCallback(response) {
                    const { data } = response
                    if (data.delete) {
                        Swal.fire({
                            icon: "success",
                            title: 'Eliminado!',
                            confirmButtonText: 'Ok',
                            allowOutsideClick: false
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $scope.consultar();
                            }
                        })
                    } else {
                        Swal.fire('Opps!', '', 'error')
                    }
                }, function errorCallback(response) {
                    console.log(response);

                });

            } else if (result.isDenied) {
                Swal.fire('Cambios no guardados', '', 'info')
            }
        })
    }

    $scope.restablecer = (persona) => {
        console.log("Persona", persona);
        Swal.fire({
            title: '¿Estas seguro de restablecer este registro?',
            showCancelButton: true,
            confirmButtonText: 'Confirmar',
            cancelButtonText: `Cancelar`,
        }).then((result) => {
            if (result.isConfirmed) {
                $http({
                    method: 'POST',
                    url: 'http://localhost:8080/restablecer',
                    data: "datos=" + JSON.stringify(persona),
                    headers: {
                        // 'Content-Type': 'application/json',
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                }).then(function successCallback(response) {
                    console.log(response);
                    const { data } = response
                    if (data.restablecer) {
                        Swal.fire({
                            icon: "success",
                            title: 'Usuario Restablecido!',
                            confirmButtonText: 'Ok',
                            allowOutsideClick: false
                        }).then((result) => {
                            if (result.isConfirmed) {

                                $scope.consultar();
                            }
                        })
                    } else {
                        Swal.fire('Opps!', '', 'error')
                    }
                }, function errorCallback(response) {
                    console.log(response);

                });

            } else if (result.isDenied) {
                Swal.fire('Cambios no guardados', '', 'info')
            }
        })
    }

}])