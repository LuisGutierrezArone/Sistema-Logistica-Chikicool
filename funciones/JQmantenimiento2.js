$(document).ready(function () {
    obtenerdatos();
    var contenido_fila;
    var coincidencias;
    $('#txt_buscar').keyup(function () {
        if($(this).val().length>=3)
            filtrar($(this).val());
    });
    
    function filtrar(cadena){
        $('#tabla tbody tr').each(function () {
            contenido_fila=$(this).find('td:eq(0)').html();
            exp = new RegExp(cadena,'gi');
            coincidencias=contenido_fila.match(exp);
            if(coincidencias!==null){
                $(this).addClass('resaltar');
            }else{
                $(this).addClass('oculta');
            }
        });
    }
});