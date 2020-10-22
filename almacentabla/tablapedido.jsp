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
    <caption ><h3>Pedido:</h3>                                    
        <div align="right">
            <label for="caja_busqueda"><h4>Buscar:</h4></label>
            <input type="text" name="caja_busqueda" id="caja_busqueda"/>
        </div>
    </caption>
    <%rs = st.executeQuery("select "
                + "pd.id_pedido,"
                + "pd.fechapedido,"
                + "pd.fechaentrega,"
                + "pd.cantidad,"
                + "pd.precio,"
                + "(pd.cantidad*pd.precio) nuevo,"
                + "pd.id_producto,"
                + "pd.id_cliente,"
                + "pd.id_transporte,"
                + "pd.id_usuario,"
                + "cl.cliente,"
                + "pr.producto,"
                + "tr.Rsocial,"
                + "user.nombres,"
                + "user.apellidos"
                + " from pedidos as pd "
                + "inner join clientes as cl "
                + "inner join productos as pr "
                + "inner join transportes as tr "
                + "inner join usuarios as user "
                + "on pd.id_producto=pr.id_producto "
                + "and pd.id_cliente=cl.id_cliente "
                + "and pd.id_transporte=tr.id_transporte "
                + "and pd.id_usuario=user.id_usuario order by id_pedido asc ");%>
    <tr>
        <td>CODIGO</td>
        <td>FEC. PEDIDO</td>
        <td>FEC. ENTREGA</td>                                           
        <td>CLIENTE</td>  
        <td>PRODUCTO</td>
        <td>CANTIDAD</td>
        <td>COSTO</td>
        <td>TOTAL PAGO</td>
        <td>VENDEDOR ENCARGADO</td>
        <td>TRANSPORTE</td>
        <td>EDITAR</td>
        <td>ELIMINAR</td>
    </tr>
    <%while (rs.next()) {%>
    <tr>
        <td><%=rs.getString("id_pedido")%></td>
        <td><%=rs.getString("fechapedido")%></td>
        <td><%=rs.getString("fechaentrega")%></td>                                           
        <td><%=rs.getString("cliente")%></td>  
        <td><%=rs.getString("producto")%></td>
        <td><%=rs.getString("cantidad")%></td>
        <td><%="S/."%><%=rs.getString("precio")%></td>
        <td><%="S/."%><%=rs.getString("nuevo")%></td>
        <td><%=rs.getString("apellidos")%><%=" ,  "%><%=rs.getString("nombres")%></td>
        <td><%=rs.getString("Rsocial")%></td>                

        <td>
            <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaPedido"
                   onclick="agregaDato('<%=rs.getString("id_pedido")%>', '<%=rs.getString("id_cliente")%>', '<%=rs.getString("fechapedido")%>',
                                   '<%=rs.getString("fechaentrega")%>',
                                   '<%=rs.getString("id_producto")%>', '<%=rs.getString("precio")%>', '<%=rs.getString("cantidad")%>',
                                   '<%=rs.getString("id_usuario")%>', '<%=rs.getString("id_transporte")%>')">
                <span class="glyphicon glyphicon-pencil"></span>
            </span>                
        </td> 
        <td>
            <span class="btn btn-danger btn-sm" onclick="eliminaPedido('<%=rs.getString("id_pedido")%>')">
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