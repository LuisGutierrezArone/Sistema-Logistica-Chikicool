<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="imagenes/icono.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
        <script src="librerias/jquery-3.2.1.min.js" type="text/javascript"></script>
        <title>Chiki Cool - Tienda Online Ropa Para Niños</title>
    </head>
    <Br> <br> <br>  
    <body style="background:url('imagenes/ropaparaniño.jpg'); background-size: 100% 100%; background-attachment: fixed;">
        <Br> <br> <br>

        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="panel panel-primary">
                        <div align="center" class="panel panel-heading"><h2>CHIKI COOL</h2></div>
                        <div class="panel panel-body"> 
                            <div align="center">
                                <img src="imagenes/LOGOVARIANTE.png" style="width: 69%" style="height: 60%"> 
                            </div>                            
                            <form id="frmlogin" action="login" method="post">
                                <label>USUARIO:</label>
                                <input type="text" class="form-control input-sm" name="usuario" id="usuario" placeholder="USUARIO">
                                <p></p>
                                <label>PASSWORD:</label>
                                <input type="password" class="form-control input-sm" name="password" id="password" placeholder="PASSWORD">
                                <p></p>
                                <br>
                                <div align="center">
                                 <!--   <span class="btn btn-primary btn-sm" style="font-size:20px " id="entrar">Entrar</span>-->
                                     <input class="btn btn-primary" style="font-size:20px " type="submit" value="Entrar" id="entrar"/>
                                </div>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">

    $(document).ready(function () {
        $('#entrar').click(function () {

            vacios = validarFormVacio('frmlogin');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }
            datos = $('#frmlogin').serialize();

           <!-- $.ajax({
                type: "get",
                data: "usuario=",
                url: "login",
                success: function (response) {
                    alert(response);
                    dato = jQuery.parseJSON(response);
                   
                }
            });-->

        });

    });

    function validarFormVacio(formulario) {
        datos = $('#' + formulario).serialize();
        d = datos.split('&');
        vacios = 0;
        for (i = 0; i < d.length; i++) {
            controles = d[i].split("=");
            if (controles[1] === "A" || controles[1] === "") {
                vacios++;
            }
        }
        return vacios;
    }

</script>