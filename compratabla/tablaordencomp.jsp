<%@page import="com.chikicool.conexion.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        cn = Conexion.obtenConexion();
        st = cn.createStatement();
%>   
<table class="table table-hover table-condensed table-bordered">
    <caption ><h3>Orden de Compra:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
                + "oc.id_ordencompra,"
                + "oc.id_proveedor,"
                + "oc.id_producto,"
                + "oc.ruc,"
                + "oc.fecha,"
                + "oc.fechapago,"
                + "oc.cantidad,"
                + "oc.punitario,"
                + "pv.Rsocial,"
                + "pd.producto"
                + " from ordencompra as oc "
                + "inner join proveedores as pv "
                + "inner join productos as pd "
                + "on oc.id_proveedor=pv.id_proveedor "
                + "and oc.id_producto=pd.id_producto order by id_ordencompra asc");%>
    <tr>
        <td>CÓDIGO</td>
        <td>PROVEEDOR</td>
        <td>RUC</td>
        <td>FECHA</td>
        <td>FECHA PAGO</td>
        <td>PRODUCTO</td>
        <td>CANTIDAD</td>
        <td>COSTO</td>                                 
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>
    <tr>
        <td><%=rs.getString("id_ordencompra")%></td>
        <td><%=rs.getString("Rsocial")%></td>
        <td><%=rs.getString("ruc")%></td>
        <td><%=rs.getString("fecha")%></td>
        <td><%=rs.getString("fechapago")%></td>
        <td><%=rs.getString("producto")%></td>
        <td><%=rs.getString("cantidad")%></td>
        <td><%="S/."%><%=rs.getString("punitario")%></td>

        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaOredenCompra"
                   onclick="agregaDato('<%=rs.getString("id_ordencompra")%>', '<%=rs.getString("id_proveedor")%>',
                                   '<%=rs.getString("ruc")%>',
                                   '<%=rs.getString("fecha")%>', '<%=rs.getString("fechapago")%>',
                                   '<%=rs.getString("id_producto")%>', '<%=rs.getString("punitario")%>', '<%=rs.getString("cantidad")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaOrdenProducto('<%=rs.getString("id_ordencompra")%>')">
                <span class="glyphicon glyphicon-remove" ></span>
            </span>
        </td>
    </tr>
    <%}%>
    <%
        } catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
        }
    %>
</table>
<div align="right">
    <div class="page-content" >
        <label><h4>Total General:</h4></label>
        <input type="text"  name="ptotal" id="ptotal">
    </div>
</div>