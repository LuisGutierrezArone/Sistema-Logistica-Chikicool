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
    <caption ><h3>Clientes:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
            + "cl.id_cliente,"
            + "cl.cliente,"
            + "cl.documento,"
            + "cl.Ndocumento,"
            + "cl.telefono,"
            + "cl.direccion,"
            + "cl.email,"
            + "cl.id_usuario,"
            + "user.apellidos,"
            + "user.nombres"
            + " from clientes as cl inner join usuarios as user "
            + " on cl.id_usuario=user.id_usuario order by id_cliente asc");%>
    <tr>
        <td>CÓDIGO</td>
        <td>CLIENTE</td>
        <td>DOCUMENTO</td>
        <td>NRO. DOCUMENTO</td>        
        <td>TELÉFONO</td>
        <td>DIRECCIÓN</td>
        <td>CORREO</td>
        <td>ADMINISTRADOR</td>
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>

    <tr>
        <td><%=rs.getString("id_cliente")%></td>
        <td><%=rs.getString("cliente")%></td>
        <td><%=rs.getString("documento")%></td>
        <td><%=rs.getString("Ndocumento")%></td>
        <td><%=rs.getString("telefono")%></td>
        <td><%=rs.getString("direccion")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></td>
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaCliente"
                   onclick="agregaDato('<%=rs.getString("id_cliente")%>', '<%=rs.getString("cliente")%>', '<%=rs.getString("documento")%>',
                                   '<%=rs.getString("Ndocumento")%>', '<%=rs.getString("telefono")%>', '<%=rs.getString("direccion")%>', '<%=rs.getString("email")%>', '<%=rs.getString("id_usuario")%>')">                  
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaCliente('<%=rs.getString("id_cliente")%>')">
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
