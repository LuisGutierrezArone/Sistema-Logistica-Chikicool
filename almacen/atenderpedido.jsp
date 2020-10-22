<%@page import="com.chikicool.dao.AtenderpedidosDAO"%>
<%@page import="com.chikicool.model.AtenderPeds"%>
<%@page import="com.chikicool.conexion.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        cn = Conexion.obtenConexion();
        st = cn.createStatement();
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="shortcut icon" type="image/png" href="imagenes/icono.png">
        <link href="css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilofondo.css" rel="stylesheet" type="text/css"/>
        <title>Chiki Cool - Tienda Online Ropa Para Niños</title>
    </head>
    <body class="home page" id="masthead">
        <header  class="site-header" role="banner" style="background:url('imagenes/ropaparaniño.jpg');background-size: 100% 100%;">
            <a class="skip-link screen-reader-text" >Saltar al contenido</a>

            <div class="side-masthead ">
                <div class="menu-toggle" id="menu-toggle">
                    <div></div> 
                    <div></div>
                    <div></div>
                </div>   

                <div class="site-title-wrapper">
                    <img width="900" height="800" src="imagenes/chikicool.jpg" class="custom-logo" alt="chikicool.jpg" itemprop="logo"><br>
                </div>

                <div class="main-navigation-container">

                    <nav id="site-navigation" class="main-navigation" >                      

                        <div class="contenedor-menu">
                            <ul class="menu">
                                <li class="current-menu-item "><a href="menu.jsp"><span class="glyphicon glyphicon-baby-formula"></span>BIENBENIDOS</a></li>       
                                <li><a href="#"><span class="glyphicon glyphicon-tags"></span>MANTENIMIENTO<span class="caret"></span></a>
                                    <ul>
                                        <li><a href="#" id="primero">Usuario</a></li>
                                        <li><a href="#" id="segundo">Proveedor</a></li>
                                        <li><a href="#" id="tercero">Cliente</a></li>
                                        <li><a href="#" id="cuarto">Talla</a></li>
                                        <li><a href="#" id="quinto">Tipo de Producto</a></li>
                                        <li><a href="#" id="sexto">Producto</a></li>
                                        <li><a href="#" id="septimo">Empresa Transporte</a></li>                                        
                                    </ul>
                                </li> 
                                <li><a href="#"><span class="glyphicon glyphicon-usd"></span>COMPRAS<span class="caret"></span></a>                        
                                    <ul>
                                        <li><a href="#" id="primeroc">Orden de Compra</a></li>
                                        <li><a href="#" id="segundoc">Comprobante de Compra</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-credit-card"></span>VENTAS<span class="caret"></span></a>                        
                                    <ul>
                                        <li><a href="#" id="primerov">Comprobante de Venta</a></li>
                                        <li><a href="#" id="segundov">Guia Remision</a></li>
                                        <li><a href="#" id="tercerov">Nota de Crédito</a></li>
                                    </ul>
                                </li> 
                                <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>ALMACEN<span class="caret"></span></a>
                                    <ul>
                                        <li><a href="#" id="primeroa">Inventario</a></li>
                                        <li><a href="#" id="segundoa">Pedido</a></li>
                                        <li><a href="#" id="terceroa">Asignar Pedido</a></li>
                                        <li><a href="#" id="cuartoa">Atender Pedido</a></li>
                                        <li><a href="#" id="quintoa">Pérdidas</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-duplicate"></span>REPORTES<span class="caret"></span></a>
                                    <ul>
                                        <li><a href="#" id="primeror">Pedidos</a></li>
                                        <li><a href="#" id="segundor">Productos</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>PRE-TEST<span class="caret"></span></a>
                                    <ul>
                                        <li><a href="#" id="primerop">Pre-Test Pedidos</a></li>
                                        <li><a href="#" id="segundop">Pre-Test Disponibilidad</a></li>
                                    </ul>
                                </li>
                                <li> <a style="color: red" href="CerrarSesion"><span class="glyphicon glyphicon-off"></span>Salir</a></li>
                            </ul>
                        </div> 
                    </nav >
                </div> 
            </div>



            <div class="hero" >
                <div >
                    <aside id="text-9" class="widget widget_text"><h2 class="widget-title">Más que una compra!</h2>
                        <div class="textwidget">
                            <p>Por que tu compra no empieza cuando nos entregas tu dinero, ni termina cuando te entregamos el producto, conoce los puntos en los que estamos comprometidos contigo, durante el proceso de tu compra.</p>
                            <p>Abajo te los decimos!!</p>
                        </div>
                    </aside>
                </div>
            </div>
        </header>

        <div id="page" class="hfeed site">
            <div id="content" class="site-content">
                <div id="primary" class="content-area">
                    <main id="main" class="site-main" role="main">
                        <article id="post-156" class="post-156 page type-page status-publish hentry">

                            <div class="ventana" id="ventana">
                                <div id="cerrar">
                                    <a href="javascript:cerrar()">  <img src="imagenes/cancel.png" title="cerrar"/></a>
                                </div>

                                <a href="#" id="recarga16"><img src="imagenes/recargar.png" alt="ACTUALIZAR" title="Actualizar Codigo"/></a>

                                <h2>  AGREGAR ATENCIÓN DE PEDIDO </h2>

                                <div id="page" class="hfeed site">
                                    <div class="page-content">
                                        <div class="row">

                                            <form id="frmAtenderPedido">
                                                <div class="col-sm-6 col-md-2" align="left">
                                                    <%
                                                        String codigo;
                                                        AtenderpedidosDAO dao = new AtenderpedidosDAO();
                                                        codigo = dao.cargarcod();
                                                        if (codigo == null) {
                                                            codigo = "ATP001";
                                                            request.setAttribute("ncodigo", codigo);
                                                        } else {
                                                            String ncodigo = String.valueOf(codigo);
                                                            char r1 = ncodigo.charAt(3);
                                                            char r2 = ncodigo.charAt(4);
                                                            char r3 = ncodigo.charAt(5);
                                                            String rt = "";
                                                            rt = "" + r1 + r2 + r3;
                                                            int j = Integer.parseInt(rt);
                                                            AtenderPeds atenderPeds = new AtenderPeds();
                                                            atenderPeds.setIdatenderped2(j);
                                                            ncodigo = atenderPeds.serie();
                                                            request.setAttribute("ncodigo", ncodigo);
                                                        }
                                                    %>
                                                    <label><h3>Código:</h3></label>
                                                    <input type="text" class="form-control input-sm" value="${ncodigo}" name="idatenderpedido" id="idatenderpedido" readonly>
                                                </div>
                                                <div class="col-sm-6 col-md-5" align="left">
                                                    <label><h3>Código de Asignar Pedido:</h3></label>
                                                    <select type="text" class="form-control input-sm" name="asignarped" id="asignarped">
                                                        <option value="A">--Seleccionar Codigo--</option>
                                                        <%rs = st.executeQuery("select ap.id_asignarpedido, ap.id_cliente,"
                                                                    + "cl.cliente  from asignarpedidos as ap "
                                                                    + "inner join clientes as cl "
                                                                    + "on ap.id_cliente=cl.id_cliente "
                                                                    + "order by id_pedido asc");%>
                                                        <%while (rs.next()) {%>
                                                        <option value="<%=rs.getString("id_asignarpedido")%>"><%=rs.getString("id_asignarpedido")%><%="  ||  "%><%=rs.getString("cliente")%></option>
                                                        <%}%>           

                                                    </select>

                                                </div>
                                                <div class="col-sm-6 col-md-3" align="left">
                                                    <label><h3>Cliente:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="clienteB" id="clienteB" readonly>
                                                </div>
                                                <div class="col-sm-6 col-md-3" align="left">
                                                    <label><h3>Fecha de Pedido:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="FpedidoB" id="FpedidoB"  readonly>
                                                </div>
                                                <div class="col-sm-6 col-md-3" align="left">
                                                    <label><h3>Fecha de Entrega:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="FentregaB" id="FentregaB"  readonly>
                                                </div>          
                                                <div class="col-sm-6 col-md-2" align="left">
                                                    <label><h3>Producto:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="productoB" id="productoB"  readonly>
                                                </div>
                                                <div class="col-sm-6 col-md-2" align="left">
                                                    <label><h3>Cantidad:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="cantidadB" id="cantidadB"  readonly>
                                                </div> 
                                                <div class="col-sm-6 col-md-3" align="left">
                                                    <label><h3>Vendedor Encargado:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="vencargadoB" id="vencargadoB"  readonly>                                                       
                                                </div>
                                                <div class="col-sm-6 col-md-3" align="left">
                                                    <label><h3>Almacenero Encargado:</h3></label>
                                                    <input type="text" class="form-control input-sm" name="aencargadoB" id="aencargadoB"  readonly>                                                      
                                                </div>
                                                <div class="col-sm-6 col-md-2" align="left">
                                                    <label><h3>Estado</h3></label>
                                                    <input type="text" class="form-control input-sm" name="estadoB" id="estadoB" readonly>                                                                                              
                                                </div>

                                                <div class="col-sm-6 col-md-5" align="left">
                                                    <label><h3>Despachador:</h3></label>
                                                    <select type="text" class="form-control input-sm" name="despachador" id="despachador">
                                                        <   <option value="A">--Seleccionar Encargado--</option>
                                                        <%rs = st.executeQuery("select "
                                                                    + "user.id_usuario,"
                                                                    + "user.nombres,"
                                                                    + "user.apellidos,"
                                                                    + "carg.cargo"
                                                                    + " from usuarios as user inner join cargos as carg "
                                                                    + "on user.id_cargo=carg.id_cargo where cargo = 'DESPACHADOR'");%>
                                                        <%while (rs.next()) {%>
                                                        <option value="<%=rs.getString("id_usuario")%>"><%=rs.getString("cargo")%><%="  ||  "%><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></option>
                                                        <%}%>                                 
                                                    </select>
                                                </div>
                                                <%
                                                    } catch (Exception e) {
                                                        out.println(e.getMessage());
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div id="page" class="hfeed site">
                                    <div class="page-content">
                                        <br>
                                        <span class="btn btn-primary" style="font-size:20px " id="btnAgregaAtender">AGREGAR</span>
                                    </div>
                                </div>
                            </div>
                            <section id="contenedor">

                                <a href="javascript:abrir()"><img src="imagenes/agregar.png" alt="AGREGAR" title="Registrar Nueva Atención"/></a>

                            </section> 

                            <div align="center"> <h2>ATENCIÓN DE PEDIDO</h2></div>                               

                            <div id="tablaAtenderPedidoLoad"></div>

                        </article>

                    </main>

                </div>                  
            </div>  


            <div class="modal fade" id="actualizaAtencion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Actualiza Pedidos</h4>
                        </div>
                        <div class="modal-body">
                            <form id="frmAtenderPedidoU">

                                <label><h3>Código:</h3></label>
                                <input type="text" class="form-control input-sm" value="${ncodigo}" name="idatenderpedidoU" id="idatenderpedidoU" readonly>

                                <label><h3>Código de Pedido:</h3></label>
                                <input type="text" class="form-control input-sm" name="asignarpedU" id="asignarpedU" readonly>                                                                                     

                                <label><h3>Cliente:</h3></label>
                                <input type="text" class="form-control input-sm" name="clienteBU" id="clienteBU"  readonly>

                                <label><h3>Fecha de Pedido:</h3></label>
                                <input type="text" class="form-control input-sm" name="FpedidoBU" id="FpedidoBU"  readonly>

                                <label><h3>Fecha de Entrega:</h3></label>
                                <input type="text" class="form-control input-sm" name="FentregaBU" id="FentregaBU"  readonly>

                                <label><h3>Producto:</h3></label>
                                <input type="text" class="form-control input-sm" name="productoBU" id="productoBU"  readonly>

                                <label><h3>Cantidad:</h3></label>
                                <input type="text" class="form-control input-sm" name="cantidadBU" id="cantidadBU"  readonly>

                                <label><h3>Vendedor Encargado:</h3></label>
                                <input type="text" class="form-control input-sm" name="vencargadoBU" id="vencargadoBU"  readonly>                                                       

                                <label><h3>Almacenero Encargado:</h3></label>
                                <input type="text" class="form-control input-sm" name="aencargadoBU" id="aencargadoBU" readonly>                                   

                                <label><h3>Despachador:</h3></label>
                                <select type="text" class="form-control input-sm" name="despachadorU" id="despachadorU">
                                    <   <option value="A">--Seleccionar Encargado--</option>
                                    <%rs = st.executeQuery("select "
                                                + "user.id_usuario,"
                                                + "user.nombres,"
                                                + "user.apellidos,"
                                                + "carg.cargo"
                                                + " from usuarios as user inner join cargos as carg "
                                                + "on user.id_cargo=carg.id_cargo where cargo = 'DESPACHADOR'");%>
                                    <%while (rs.next()) {%>
                                    <option value="<%=rs.getString("id_usuario")%>"><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></option>
                                    <%}%>                                 
                                </select>

                                <label><h3>Estado</h3></label>
                                <select type="text" class="form-control input-sm" name="estadoU" id="estadoU">                                                       
                                    <option value="A">--Seleccionar Estado--</option>                                                        
                                    <option> PENDIENTE </option> 
                                    <option> ANULADO </option>
                                    <option> FINALIZADO </option> 
                                </select> 

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnActualizaAtencion" class="btn btn-warning" data-dismiss="modal">Actualizar</button>
                        </div>
                    </div>
                </div>
            </div>


            <footer id="colophon" class="site-footer">
                <div class="site-footer-inner" >
                    <div class="footer-widget-area columns-2">

                        <div class="footer-widget">

                            <h3>Comunícate con nosotros</h3>
                            <br>
                            <div class="col-sm-6 col-md-4">
                                <img src="imagenes/foot1.png " width="60" height="60">                          
                                <h4>ESCRÍBENOS</h4>                                                        
                                <a href="mailto:ropaparabebechickicool@gmail.com"><h5>ropaparabebechickicool@gmail.com</h5></a>                                   
                            </div>

                            <div class="col-sm-6 col-md-3">
                                <img src="imagenes/foot2.png" width="60" height="60">
                                <h4>LLÁMANOS</h4>
                                <h5>986349198</h5>
                            </div>

                            <div class="col-sm-6 col-md-3">
                                <img src="imagenes/foot3.png" width="60" height="60">
                                <h4>WHATSAPP</h4>
                                <h5>986349198</h5>
                            </div>

                            <div class="col-sm-6 col-md-2">
                                <img src="imagenes/foot4.png" width="60" height="60">
                                <h4>REDES SOCIALES</h4>
                                <a href="https://www.facebook.com/RopaParaBebeChikiCool/?epa=SEARCH_BOX" target="_blank"><h5>www.facebook.com/RopaParaBebeChikiCool</h5></a>    
                            </div>
                        </div>
                    </div>           
                </div>
            </footer>
        </div>
    </body>
</html>

<script type="text/javascript">
    $(document).ready(function () {

        $('#tablaAtenderPedidoLoad').load('almacentabla/tablaatenderpedido.jsp');
        $('#btnAgregaAtender').click(function () {

            vacios = validarFormVacio('frmAtenderPedido');

            if (vacios > 0) {
                swal("Debe llenar todos los campos!!", "capos vacios!", "error");
                return false;
            }

            datos = $('#frmAtenderPedido').serialize();
            $.ajax({
                url: "servletagregar16",
                data: datos,
                type: 'post',
                success: function (r) {
                    r === 1;
                    document.getElementById('frmAtenderPedido').reset();
                    swal("AGREGADO CON EXITO", '', 'success');
                    $('#tablaAtenderPedidoLoad').load('almacentabla/tablaatenderpedido.jsp');
                },
                error: function (r) {
                    r !== 1;
                    alert("No se pudo guardar");

                }
            });
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
<script type="text/javascript">

    $(document).ready(function () {
        $("#asignarped").change(function () {
            $.ajax({
                type: 'get',
                data: "idasignarpedido=" + $("#asignarped").val(),
                url: 'servletagregar16',
                success: function (response) {

                    dato = jQuery.parseJSON(response);
                    $('#clienteB').val(dato['idcliente']);
                    $('#FpedidoB').val(dato['fechaped']);
                    $('#FentregaB').val(dato['fechaentreg']);
                    $('#productoB').val(dato['idproducto']);
                    $('#cantidadB').val(dato['cantidad']);
                    $('#vencargadoB').val(dato['idusuario']);
                    $('#aencargadoB').val(dato['idusuario2']);
                    $('#estadoB').val(dato['estado']);
                }
            });
        });
    });

</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#btnActualizaAtencion').click(function () {

            datos = $('#frmAtenderPedidoU').serialize();
            $.ajax({
                url: "servletactualizar16",
                data: datos,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Actualizado CON EXITO");
                    $('#tablaAtenderPedidoLoad').load('almacentabla/tablaatenderpedido.jsp');
                },
                error: function (r) {
                    r !== 1;
                    alert("Disculpe, existio un problema");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    function agregaDato(idasignarped, idpedido, idcliente, fechaped, fechaentreg, idproducto, cantidad, idusuario, idusuario2, idusuario3, estado) {
        $('#idatenderpedidoU').val(idasignarped);
        $('#asignarpedU').val(idpedido);
        $('#clienteBU').val(idcliente);
        $('#FpedidoBU').val(fechaped);
        $('#FentregaBU').val(fechaentreg);
        $('#productoBU').val(idproducto);
        $('#cantidadBU').val(cantidad);
        $('#vencargadoBU').val(idusuario);
        $('#aencargadoBU').val(idusuario2);
        $('#despachadorU').val(idusuario3);
        $('#estadoU').val(estado);
    }

    function eliminaAtencion(idatenderpedido) {

        alertify.confirm('¿Desea eliminar al idatenderpedido? ' + idatenderpedido, function () {
            $.ajax({
                url: "servleteliminar16",
                data: "idatenderpedido=" + idatenderpedido,
                type: "POST",
                success: function (r) {
                    r === 1;
                    alertify.success("Eliminado con exito");
                    $('#tablaAtenderPedidoLoad').load('almacentabla/tablaatenderpedido.jsp');
                },
                error: function (r) {
                    r !== 1;
                    alertify.success("No se pudo eliminar");
                }
            });
        }, function () {
            alertify.error('Cancelo operacion');
        });
    }
</script>
<script src="funciones/funcion1.js" type="text/javascript"></script>
<script src="funciones/funcion4.js" type="text/javascript"></script>
<script src="funciones/JQmantenimiento.js" type="text/javascript"></script>
<script src="funciones/JQoperacion.js" type="text/javascript"></script>
<script src="librerias/alertifyjs/alertify.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>