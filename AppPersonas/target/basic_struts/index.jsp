<%-- Created by IntelliJ IDEA. User: CDS Date: 17/05/2022 Time: 10:44 a. m. To change this template use File | Settings
  | File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html ng-app="personas">

    <head>
      <title>Start Page</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="./assets/css/styles.css">
      <script src="./assets/js/angular.js"></script>
      <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <script src="https://unpkg.com/feather-icons"></script>
    </head>

    <body ng-controller="controlador">

      <div class="container-fluid">
        <div class="row justify-content-center mt-5">
          <div class="col-12 col-md-10 ">
            <div class="card">
              <div class="card-header text-start" style="background-color: #002E60; font-size: 25; color: #fff;">
                <div class="row">
                  <div class="col-12 col-md-7">
                    <h4>Personas</h4>
                  </div>
                  <div class="col-8 col-md-4 text-end">
                    <input type="text" ng-model="search" class="form-control">
                  </div>
                  <div class="col-4 col-md-1 ">
                    <button class="btn " style="background-color: #009475;" data-toggle="modal" data-target="#register">
                      <i data-feather="plus" style="color: #fff;"></i>
                    </button>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <table class="table responsive">
                  <thead style="background-color: #002E60; color: #fff;">
                    <tr>
                      <th>Nombre</th>
                      <th>Edad</th>
                      <th>CURP</th>
                      <th>Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr ng-repeat="persona in personas | filter: search">
                      <th>{{persona.name}} {{persona.surname}} {{persona.lastname}}</th>
                      <th>{{persona.edad}}</th>
                      <th>{{persona.curp}}</th>
                      <th>
                        <button type="button" class="btn btn-danger" ng-click="eliminar()">
                          Eliminar
                        </button>
                        <button type="button" class="btn btn-primary" ng-click="modificar(persona)">
                          Modificar
                        </button>
                      </th>
                    </tr>
                  </tbody>
                </table>
              </div>

            </div>
          </div>
        </div>
      </div>



      <!-- Modal Actualización -->
      <div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Modificar Persona</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">

              <div class="row">
                <div class="col-12">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">Nombre</span>
                    </div>
                    <input type="text" ng-model="persona.name" ng-value="persona.name" class="form-control"
                      placeholder="Ingresa un nombre" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                </div>
                <div class="col-12">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">Apellido Paterno</span>
                    </div>
                    <input type="text" ng-model="persona.surname" ng-value="persona.surname" class="form-control"
                      placeholder="Ingresa un apellido" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                </div>
                <div class="col-12">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">Apellido Materno</span>
                    </div>
                    <input type="text" ng-model="persona.lastname" ng-value="persona.lastname" class="form-control"
                      placeholder="Ingresa un apellido" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                </div>
                <div class="col-12">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">Edad</span>
                    </div>
                    <input type="number" ng-model="persona.edad" ng-value="persona.edad" class="form-control"
                      placeholder="Ingresa una edad" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                </div>
                <div class="col-12">
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">CURP</span>
                    </div>
                    <input type="text" ng-model="persona.curp" ng-value="persona.curp" class="form-control"
                      placeholder="Ingresa un CURP" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                </div>
              </div>

            </div>
            <div class="modal-footer">
              <button type="button" ng-click="cancelar()" class="btn btn-secondary">Cancelar</button>
              <button type="button" ng-click="guardar()" class="btn btn-primary">Guardar</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Registrar -->
      <div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Registrar Persona</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              ...
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>


      <script>
        const app = angular.module("personas", [])
        const controlador = app.controller("controlador", ["$scope", "$http", ($scope, $http) => {

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
          }
          $scope.cancelar = () => {
            $('#update').modal('hide');

          }
          $scope.guardar = () => {
            let success = validar($scope.persona)
            if (true) {
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
                      Swal.fire('Saved!', '', 'success')
                      $('#update').modal('hide');
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


            }

          }

          const validar = ({ id, name, surname, lastname, edad, curp }) => {
            if (ValidacionesUsuario.) {

            } else {

            }
            if () {

            } else {

            }
            if () {

            } else {

            }
            if () {

            } else {

            }
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
      <script src="./assets/js/constantes.js"></script>
    </body>

    </html>