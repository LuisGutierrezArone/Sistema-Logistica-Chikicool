
$(document).ready(function () {
    $('.menu li:has(ul)').click(function (e) {
        e.preventDefault();

        if ($(this).hasClass('activado')) {
            $(this).removeClass('activado');
            $(this).children('ul').slideUp();
        } else {
            $('.menu li ul').slideUp();
            $('.menu li').removeClass('activado');
            $(this).addClass('activado');
            $(this).children('ul').slideDown();
        }
    });

    $('#primero').click(function () {
//   window.location.href = $(this) .attr("href");
        $('#masthead').load('mantenimiento/usuario.jsp');
    });


    $('#segundo').click(function () {
//   window.location.href = $(this) .attr("href");
        $('#masthead').load('mantenimiento/proveedor.jsp');
    });

    $('#tercero').click(function () {
        $('#masthead').load('mantenimiento/cliente.jsp');
    });

    $('#cuarto').click(function () {
        $('#masthead').load('mantenimiento/Talla.jsp');
    });

    $('#quinto').click(function () {
        $('#masthead').load('mantenimiento/tipoprod.jsp');
    });

    $('#sexto').click(function () {
        $('#masthead').load('mantenimiento/producto.jsp');
    });

    $('#septimo').click(function () {
        $('#masthead').load('mantenimiento/emprtrans.jsp');
    });

    $('#octavo').click(function () {
        $('#masthead').load('mantenimiento/numeracion.jsp');
    });

    $('#primeroc').click(function () {
        $('#masthead').load('compras/ordencomp.jsp');
    });

    $('#segundoc').click(function () {
        $('#masthead').load('compras/comprobante.jsp');
    });

    $('#primerov').click(function () {
        $('#masthead').load('ventas/ventas.jsp');
    });

    $('#segundov').click(function () {
        $('#masthead').load('ventas/guia.jsp');
    });

    $('#tercerov').click(function () {
        $('#masthead').load('ventas/credito.jsp');
    });

    $('#primeroa').click(function () {
        $('#masthead').load('almacen/inventario.jsp');
    });

    $('#segundoa').click(function () {
        $('#masthead').load('almacen/pedido.jsp');
    });

    $('#terceroa').click(function () {
        $('#masthead').load('almacen/asignarpedido.jsp');
    });

    $('#cuartoa').click(function () {
        $('#masthead').load('almacen/atenderpedido.jsp');
    });

    $('#quintoa').click(function () {
        $('#masthead').load('almacen/perdidas.jsp');
    });

    $('#primeror').click(function () {
        $('#masthead').load('reportes/pedidos.jsp');
    });

    $('#segundor').click(function () {
        $('#masthead').load('reportes/productos.jsp');
    });

    $('#primerop').click(function () {
        $('#masthead').load('test/pedidos.jsp');
    });

    $('#segundop').click(function () {
        $('#masthead').load('test/disponibilidad.jsp');
    });
});

$('#recarga').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/usuario.jsp');
});
$('#recarga2').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/proveedor.jsp');
});
$('#recarga3').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/cliente.jsp');
});
$('#recarga4').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/Talla.jsp');
});
$('#recarga5').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/tipoprod.jsp');
});
$('#recarga6').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/producto.jsp');
});
$('#recarga7').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('mantenimiento/emprtrans.jsp');
});
$('#recarga8').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('compras/ordencomp.jsp');
});

$('#recarga14').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('almacen/pedido.jsp');
});

$('#recarga15').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('almacen/asignarpedido.jsp');
});

$('#recarga16').click(function () {
//   window.location.href = $(this) .attr("href");
    $('#masthead').load('almacen/atenderpedido.jsp');
});