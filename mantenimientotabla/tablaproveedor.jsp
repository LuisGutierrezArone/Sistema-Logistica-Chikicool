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
    <caption><h3>Proveedores:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
            + "pv.id_proveedor,"
            + "pv.Tempresa,"
            + "pv.ruc,"
            + "pv.Rsocial,"
            + "pv.telefono,"
            + "pv.email,"
            + "pv.direccion,"
            + "pv.id_usuario,"
            + "user.apellidos,"
            + "user.nombres"
            + " from proveedores as pv inner join usuarios as user "
            + " on pv.id_usuario=user.id_usuario order by id_proveedor asc");%>

    <tr>
        <td>CÓDIGO</td>
        <td>TIPO DE EMPRESA</td>
        <td>RUC</td>
        <td>RAZÓN SOCIAL</td>
        <td>TELÉFONO</td>
        <td>CORREO</td>
        <td>DIRECCIÓN</td>
        <td>ADMINISTRADOR</td>
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>
    <tr>
        <td><%=rs.getString("id_proveedor")%></td>
        <td><%=rs.getString("Tempresa")%></td>
        <td><%=rs.getString("ruc")%></td>
        <td><%=rs.getString("Rsocial")%></td>
        <td><%=rs.getString("telefono")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("direccion")%></td>        
        <td><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></td>      
        
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaProveedor"
                   onclick="agregaDato('<%=rs.getString("id_proveedor")%>', '<%=rs.getString("Tempresa")%>', '<%=rs.getString("ruc")%>',
                                   '<%=rs.getString("Rsocial")%>', '<%=rs.getString("telefono")%>', '<%=rs.getString("email")%>', '<%=rs.getString("direccion")%>', '<%=rs.getString("id_usuario")%>')">                  
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaProveedor('<%=rs.getString("id_proveedor")%>')">
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
