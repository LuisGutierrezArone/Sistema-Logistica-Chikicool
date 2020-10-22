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
    <caption ><h3>Productos:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
                + "prod.id_producto,"
                + "prod.cantidad,"
                + "prod.costo,"
                + "prod.descripcion,"
                + "prod.producto,"
                + "prod.id_tproducto,"
                + "prod.id_talla,"
                + "tipo.tproducto,"
                + "tal.talla "
                + "from productos as prod inner join tproductos as tipo "
                + "on prod.id_tproducto=tipo.id_tproducto inner join tallas as tal "
                + "on prod.id_talla=tal.id_talla order by id_producto asc");%>
    <tr>
        <td>CODIGO</td>
        <td>PRODUCTO</td>                
        <td>TIPO PRODUCTO</td>
        <td>DESCRIPCIÓN</td>
        <td>TALLAS</td>
        <td>CANTIDAD</td>
        <td>COSTO</td>
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>
    <tr>
        <td><%=rs.getString("id_producto")%></td>
        <td><%=rs.getString("producto")%></td>
        <td><%=rs.getString("tproducto")%></td>
        <td><%=rs.getString("descripcion")%></td>
        <td><%=rs.getString("talla")%></td>
        <td><%=rs.getString("cantidad")%></td>                
        <td><%="S/."%><%=rs.getString("costo")%></td>       
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaProducto"
                   onclick="agregaDato('<%=rs.getString("id_producto")%>', '<%=rs.getString("producto")%>', '<%=rs.getString("id_tproducto")%>',
                                   '<%=rs.getString("descripcion")%>', '<%=rs.getString("id_talla")%>', '<%=rs.getString("cantidad")%>',
                                   '<%=rs.getString("costo")%>')">                  
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaProducto('<%=rs.getString("id_producto")%>')">
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