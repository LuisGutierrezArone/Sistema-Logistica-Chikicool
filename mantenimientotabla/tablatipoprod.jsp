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
    <caption ><h3>Tipos de Productos:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
            + "tp.id_tproducto,"
            + "tp.tproducto,"
            + "tp.id_usuario,"
            + "user.apellidos,"
            + "user.nombres"
            + " from tproductos as tp inner join usuarios as user "
            + " on tp.id_usuario=user.id_usuario order by id_tproducto asc");%>
    <tr>
        <td>CÓDIGO</td>
        <td>TIPO DE PRODUCTO</td> 
        <td>ADMINISTRADOR</td>
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>
    <tr>
        <td><%=rs.getString("id_tproducto")%></td>
        <td><%=rs.getString("tproducto")%></td>  
        <td><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></td>
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaTproducto"
                   onclick="agregaDato('<%=rs.getString("id_tproducto")%>', '<%=rs.getString("tproducto")%>', '<%=rs.getString("id_usuario")%>')">                  
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaTproducto('<%=rs.getString("id_tproducto")%>')">
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
