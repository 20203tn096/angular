<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html ng-app>
    <head>
        <title>Inicio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="./js/angular.js"></script>
        <link rel="stylesheet" href="./css/styles.css">
        <!-- <script src="./css/styles.css"></script> -->
    </head>
    <body>
        <div ng-include src = "'./plantillas/navbar.html'"></div>
                
        <div class="container-fluid">
            <div class="row justify-content-center pt-5 " >
                <div class="col-12 col-sm-12 col-md-5  "  style="box-shadow: 0px 5px 15px 0px black;">
                    <form action="getPersona" class="p-4" method="POST">
                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text" >Nombre</span>
                              </div>
                            <input type="text" class="form-control" name="nombre" placeholder="Ingresa un nombre" >
                          </div>

                          <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text" >Apellido Paterno</span>
                              </div>
                            <input type="text" class="form-control" name="apellidoPaterno" placeholder="Ingresa un apellido" >
                          </div>

                          <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text" >Apellido Materno</span>
                              </div>
                            <input type="text" class="form-control" name="apellidoMaterno" placeholder="Ingresa un apellido" >
                          </div>

                          <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text" >Fecha de nacimiento</span>
                              </div>
                            <input type="date" class="form-control" name="fecha">
                          </div>


                          <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text" >Genero</span>
                              </div>
                              <select name="genero">
                                <option value="H">Hombre</option>
                                <option value="M" selected>Mujer</option>
                              </select>
                          </div>

                          <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text" >Entidad Federativa</span>
                              </div>
                              <select name="entidad" id="entidad">
                                
                              </select>
                          </div>
                          
                          
                          <div class="input-group mb-3">
                              <button type="submit" class="btn btn-success"> Generar</button>
                          </div>
                      

                    </form>
                    
                </div>
                <div class="col-12  col-sm-12 col-md-4 bg-danger gradient-custom-2 " style="box-shadow: 0px 5px 15px 0px black;">
                    <div class="card m-5" style="width: auto; height: 20rem ; background: none; box-shadow: 5px 2px 2px black;" >
                        <h2 class="text-center mt-2 " style="color: #fff; text-align: justify;">CURP Generado</h1>
                        <div class="card-body">
                          <h4 class="card-text text-center" style="color: #fff;" ><s:property value="curp"></s:property></h4>
                        </div>
                      </div>
                </div>
                  

            </div>
            
            
            
        </div>
        <script src="./js/estados.js"></script>
        
        <a href="saludar">Ir a Struts 2</a>
    </body>
</html>
