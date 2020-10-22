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

        <div> 
            <div id="page" class="hfeed site">
                <div id="content" class="site-content">
                    <div id="primary" class="content-area">
                        <main id="main" class="site-main" role="main">
                            <article id="post-156" class="post-156 page type-page status-publish hentry">
                                <div align="center"> <h2>LISTA DEL INVENTARIO</h2></div>
                                <table class="table table-hover table-condensed table-bordered">
                                    <caption ><h3>Inventario:</h3>                                    
                                        <div align="right">
                                            <label for="caja_busqueda"><h4>Buscar:</h4></label>
                                            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
                                        </div>
                                    </caption>
                                    <%rs = st.executeQuery("select "
                                                + "pd.id_producto,"
                                                + "pr.cantidad,"
                                                + "pr.id_producto,"
                                                + "pr.id_tproducto,"
                                                + "pr.id_talla,"
                                                + "pr.producto,"
                                                + "pr.descripcion,"
                                                + "tipo.tproducto,"
                                                + "tal.talla,"
                                                + "(pr.cantidad-sum(pd.cantidad)) stockactual "
                                                + "from pedidos as pd "
                                                + "inner join productos as pr "
                                                + "on pd.id_producto = pr.id_producto "
                                                + "inner join tproductos as tipo "
                                                + "on pr.id_tproducto=tipo.id_tproducto "
                                                + "inner join tallas as tal "
                                                + "on pr.id_talla=tal.id_talla group by pd.id_producto");%>
                                    <tr>
                                        <td>CÓDIGO</td>
                                        <td>PRODUCTO</td>                                        
                                        <td>TIPO</td>
                                        <td>TALLA</td>     
                                        <td>DESCRIPCIÓN</td>
                                        <td>STOCK</td> 
                                        <td>STOCK ACTUAL</td> 
                                    </tr>
                                    <%while (rs.next()) {%>
                                    <tr>
                                        <td><%=rs.getString("id_producto")%></td>
                                        <td><%=rs.getString("producto")%></td>                                        
                                        <td><%=rs.getString("tproducto")%></td>
                                        <td><%=rs.getString("talla")%></td>     
                                        <td><%=rs.getString("descripcion")%></td>
                                        <td><%=rs.getString("cantidad")%></td> 
                                        <td><%=rs.getString("stockactual")%></td> 

                                    </tr>
                                    <%}%>
                                    <%
                                        } catch (Exception e) {
                                            out.println(e.getMessage());
                                            e.printStackTrace();
                                        }
                                    %>
                                </table>

                            </article>

                        </main>

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
        </div>
    </body>
</html>
<script src="funciones/funcion1.js" type="text/javascript"></script>
<script src="funciones/funcion4.js" type="text/javascript"></script>
<script src="funciones/JQmantenimiento.js" type="text/javascript"></script>