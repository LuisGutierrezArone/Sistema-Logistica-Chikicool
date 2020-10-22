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
    <caption ><h3>Asignar Pedido:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
                + "ap.id_asignarpedido,"
                + "ap.fechapedido,"
                + "ap.fechaentrega,"
                + "ap.estado,"
                + "ap.cantidad,"
                + "ap.id_cliente,"
                + "ap.id_producto,"
                + "ap.id_usuario,"
                + "ap.id_usuario2,"
                + "ap.id_pedido,"
                + "cl.cliente,"
                + "pr.producto,"
                + "user.nombres,"
                + "user.apellidos,"
                + "user2.nombres,"
                + "user2.apellidos"
                + " from asignarpedidos as ap "
                + "inner join clientes as cl "
                + "inner join productos as pr "
                + "inner join usuarios as user "
                + "inner join usuarios as user2 "
                + "on ap.id_producto=pr.id_producto "
                + "and ap.id_cliente=cl.id_cliente "
                + "and ap.id_usuario=user.id_usuario "
                + "and ap.id_usuario2=user2.id_usuario  order by id_asignarpedido asc ");%>
    <tr>
        <td>CODIGO</td>
        <td>COD. PEDIDO</td>
        <td>CLIENTE</td>
        <td>FEC.PEDIDO</td>
        <td>FEC.ENTREGA</td>
        <td>PRODUCTO</td>
        <td>CANTIDAD</td>
        <td>VENDEDOR</td>
        <td>ALMACENERO</td>
        <td>ESTADO</td>                                                       
        <td>EDITAR</td>
        <td>EELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>

    <tr>
        <td><%=rs.getString("id_asignarpedido")%></td>
        <td><%=rs.getString("id_pedido")%></td>
        <td><%=rs.getString("cliente")%></td>
        <td><%=rs.getString("fechapedido")%></td>
        <td><%=rs.getString("fechaentrega")%></td>
        <td><%=rs.getString("producto")%></td>
        <td><%=rs.getString("cantidad")%></td>
        <td><%=rs.getString("user.apellidos")%><%=" ,  "%><%=rs.getString("user.nombres")%></td>
        <td><%=rs.getString("user2.apellidos")%><%=" ,  "%><%=rs.getString("user2.nombres")%></td>
        <td><%=rs.getString("estado")%></td>                                                   
        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaAsignar"
                   onclick="agregaDato('<%=rs.getString("id_asignarpedido")%>', '<%=rs.getString("id_pedido")%>',
                                   '<%=rs.getString("id_cliente")%>', '<%=rs.getString("fechapedido")%>', '<%=rs.getString("fechaentrega")%>',
                                   '<%=rs.getString("id_producto")%>','<%=rs.getString("cantidad")%>', '<%=rs.getString("id_usuario")%>', '<%=rs.getString("id_usuario2")%>', '<%=rs.getString("estado")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>
        </td>
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaAsignar('<%=rs.getString("id_asignarpedido")%>')">
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