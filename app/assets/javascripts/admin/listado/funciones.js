$(document).ready(function() {
	$('.ocultar-box').click(function() {
		$(this).parent().parent().hide();
	});
});

function mostrar_caja(box) {
	$(box).show();
}

function eliminar_cotizacion(id) {
	if (confirm('Está seguro que quiere eliminar esta Cotización?')) {
		$.ajax({
	        type: 'POST',
	        dataType: 'json',
	        url: '/admin/listado/eliminar/'+id,
	        success: function(data) {

	        	if (data.status == 0) {
	            	$('#box-'+id).remove();
	            	$('#row-'+id).remove();
	        	} else {
	        		alert(data.error);
	        	}

	        }
	    });
	}
}

function archivar_cotizacion(id) {
	$.ajax({
        type: 'POST',
        dataType: 'json',
        url: '/admin/listado/archivar/'+id,
        success: function(data) {

        	if (data.status == 0) {
            	$('#box-'+id).remove();
            	$('#row-'+id).remove();
        	} else {
        		alert(data.error);
        	}

        }
    });
}