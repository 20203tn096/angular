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

    <body ng-controller="controlador"  style="background: linear-gradient(90deg, rgba(0,46,96,1) 10%, rgba(2,110,118,1) 48%, rgba(4,182,143,1) 82% ) !important;">

      <div class="container-fluid " ng-init="consultar()">
        <div class="row justify-content-center mt-5">
          <div class="col-12 col-md-10 ">
            <div class="card " style="width: auto; height: auto;">
              <div class="card-header text-start" style="background-color: #002E60; font-size: 25; color: #fff;">
                <div class="row">
                  <div class="col-12 col-md-7">
                    <h4>Personas</h4>
                  </div>
                  <div class="col-8 col-md-4 text-end">
                    <input type="text" ng-model="search" placeholder="Buscar" class="form-control">
                  </div>
                  <div class="col-4 col-md-1 ">
                    <button class="btn" style="background-color: #009475; width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;" ng-click="register()">
                      <i data-feather="plus" style="color: #fff;"></i>
                    </button>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table" >
                    <thead style="background-color: #002E60; color: #fff;">
                      <tr>
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>CURP</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody ng-if="personas.length > 0">
                      
                      <tr ng-repeat="persona in personas | filter: search as results">

                        <th >{{persona.name}} {{persona.surname}} {{persona.lastname}}</th>
                        <th >{{persona.edad}}</th>
                        <th >{{persona.curp}}</th>
                        <th ng-if="persona.estado == 1" >
                          <span class="badge" style="background-color: green">Activo</span>
                        </th>
                        <th ng-if="persona.estado == 0" >
                          <span class="badge" style="background-color: red">Inactivo</span>
                        </th>
                        <th>
                
                          <button type="button" ng-show="persona.estado != 0" class="btn btn-danger mb-2" ng-click="eliminar(persona)" style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                            <i data-feather="trash-2" style="color: #fff;"></i>
                          </button>
                          <button type="button" ng-show="persona.estado != 1" class="btn btn-success mb-2" ng-click="restablecer(persona)" style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
                            <i data-feather="check-circle" style="color: #fff;"></i>
                          </button>
                          <button type="button"  ng-show="persona.estado != 0" class="btn btn-primary mb-2" ng-click="modificar(persona)" style="width: 40px !important;  height: 40px !important; padding: 2.5px !important;border-radius: 50% !important; text-align: center !important; font-size: 12px !important;line-height: 1.42857 !important;">
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



      <!-- Modal Actualización -->
      <div ng-include="'./plantillas/modalActualizar.html'"></div>
      <div ng-include="'./plantillas/modalRegistro.html'"></div>
      
      
      <script src="./assets/js/Validacion.js"></script>
      <script src="./assets/js/main.js"></script>
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