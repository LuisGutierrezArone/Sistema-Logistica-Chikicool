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
%>  <table class="table table-hover table-condensed table-bordered">
    <caption ><h3>Empresa de Transporte:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
            + "tr.id_transporte,"
            + "tr.ruc,"
            + "tr.Rsocial,"
            + "tr.direccion,"
            + "tr.telefono,"
            + "tr.id_usuario,"
            + "user.apellidos,"
            + "user.nombres"
            + " from transportes as tr inner join usuarios as user "
            + " on tr.id_usuario=user.id_usuario order by id_transporte asc");%>

    <tr>
        <td>CÓDIGO</td>
        <td>N° RUC</td>
        <td>RAZÓN SOCIAL</td>
        <td>DIRECCION</td>
        <td>TÉLEFONO</td>
        <td>ADMINISTRADOR</td>
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>
    <tr>
        <td><%=rs.getString("id_transporte")%></td>
        <td><%=rs.getString("ruc")%></td>
        <td><%=rs.getString("Rsocial")%></td>
        <td><%=rs.getString("direccion")%></td>
        <td><%=rs.getString("telefono")%></td>
        <td><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></td>
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaTransporte"
                   onclick="agregaDato('<%=rs.getString("id_transporte")%>', '<%=rs.getString("ruc")%>', '<%=rs.getString("Rsocial")%>',
                                   '<%=rs.getString("direccion")%>', '<%=rs.getString("telefono")%>', '<%=rs.getString("id_usuario")%>')">                  
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaTransporte('<%=rs.getString("id_transporte")%>')">
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
