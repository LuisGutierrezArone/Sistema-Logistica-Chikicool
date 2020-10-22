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
    <caption ><h3>Tallas:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
            + "tll.id_talla,"
            + "tll.talla,"
            + "tll.id_usuario,"
            + "user.apellidos,"
            + "user.nombres"
            + " from tallas as tll inner join usuarios as user "
            + " on tll.id_usuario=user.id_usuario order by id_talla asc");%>
    <tr>
        <td>CÓDIGO</td>
        <td>TALLAS</td>
        <td>ADMINISTRADOR</td>        
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>

    <tr>
        <td><%=rs.getString("id_talla")%></td>
        <td><%=rs.getString("talla")%></td>     
        <td><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></td>
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaTalla"
                   onclick="agregaDato('<%=rs.getString("id_talla")%>', '<%=rs.getString("talla")%>', '<%=rs.getString("id_usuario")%>')">                  
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaTalla('<%=rs.getString("id_talla")%>')">
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
