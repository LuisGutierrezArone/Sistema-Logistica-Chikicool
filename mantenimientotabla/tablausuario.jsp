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
<script src="librerias/select2/js/select2.js" type="text/javascript"></script>
<link href="librerias/select2/css/select2.css" rel="stylesheet" type="text/css"/>

<table class="table table-hover table-condensed table-bordered" id="tabla">
    <caption ><h3>Usuarios:</h3>
        <!--   <a href="#" id="recarga"><img src="imagenes/recargar.png" alt="ACTUALIZAR" title="Actualizar Lista"/></a>-->


        <div class="row">
            <div class="col-sm-8"></div>

            <div class="col-sm-4">
                <h4>Buscador:</h4>
                <select id="buscadorvivo" class="form-control input-sm" >
                    <option value="0">Seleccione</option>
                    <%rs = st.executeQuery("select id_usuario,apellidos,nombres from usuarios");%>
                    <%while (rs.next()) {%>
                    <option value="<%=rs.getString("id_usuario")%>"><%=rs.getString("id_usuario")%></option>
                    <%}%>
                </select>

            </div>

        </div>
                
        <%rs = st.executeQuery("select "
                    + "user.id_usuario,"
                    + "user.nombres,"
                    + "user.apellidos,"
                    + "user.email,"
                    + "user.usuario,"
                    + "user.password,"
                    + "user.id_cargo,"
                    + "carg.cargo"
                    + " from usuarios as user inner join cargos as carg "
                    + "on user.id_cargo=carg.id_cargo order by id_usuario asc");%>
        <tr>
            <td>CÓDIGO</td>
            <td>APELLIDOS Y NOMBRES</td> 
            <td>CORREO</td>
            <td>USUARIO</td>
            <td>PASSWORD</td>                                        
            <td>CARGO</td>
            <td>EDITAR</td>
            <td>ELIMINAR</td>
        </tr>
        <%while (rs.next()) {%>
        <tr>
            <td><%=rs.getString("id_usuario")%></td>
            <td><%=rs.getString("apellidos")%><%="  ,  "%><%=rs.getString("nombres")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("usuario")%></td>
            <td><%=rs.getString("password")%></td>
            <td><%=rs.getString("cargo")%></td>


            <td>
                <span  class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizaUsuario"
                       onclick="agregaDato('<%=rs.getString("id_usuario")%>', '<%=rs.getString("nombres")%>', '<%=rs.getString("apellidos")%>',
                                       '<%=rs.getString("email")%>', '<%=rs.getString("usuario")%>', '<%=rs.getString("password")%>', '<%=rs.getString("id_cargo")%>')">
                    <span class="glyphicon glyphicon-pencil"></span>
                </span>
            </td>
            <td> 
                <span class="btn btn-danger btn-sm" onclick="eliminaUsuario('<%=rs.getString("id_usuario")%>')">
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
<script type="text/javascript">
    
    $(document).ready(function () {
        
         $('#buscadorvivo').change(function () {
            $.ajax({
                url: "servletbuscar",
                data: "idusuario=" + $('#buscadorvivo').val(),
                type: "GET",
                success: function (r) {
                   // $('#tablaUsuarioLoad').load('mantenimientotabla/tablausuario.jsp');
                   alert(r);
                   dato=jQuery.parseJSON(r);
                   
                }
            });
        });
    });
</script>
<script type="text/javascript">

    $(document).ready(function () {
        $('#buscadorvivo').select2();       
    });
</script>