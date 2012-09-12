// JS Funciones cotizar

var tipo = ".interseccion"
var numero = ".numero"
var numero_destinos = 0;
var total = 0;

$(document).ready(function() {

	// Prepara formato de fecha
	$('.fecha').find('select').each(function() {
        $(this).attr("class", 'span1'); 
    });

	// Prepara formularios de puntos
	$('.interseccion').hide();
	$('.interseccion input').attr('value', '0');
	$('.interseccion_destino').hide();
	$('.interseccion_destino input').attr('value', '0');
	$('.load').hide();
	bloquear_formulario('.destino');

	// Trae los puntos si estos existen en session
	$.ajax({
        type: 'POST',
        dataType: 'json',
        url: '<%= cotiza_puntos_entregar_path %>',
        // Mostramos un mensaje con la respuesta de PHP
        success: function(data) {
        	$('.tabla-contenido').remove();

        	if (data.length > 0) {
        		var items = [];
            	numero_destinos = 0;
            	tipo = ".interseccion_destino";
	    		numero = ".numero_destino";

            	$.each(data, function(key,val){
            		numero_destinos++;

            		var items = [];
            		if (key == 0) {
            			llenar_formulario(val);
            			bloquear_formulario('.origen');
            			habilitar_formulario('.destino');
            			$('.reset').removeAttr("disabled"); 
            			items.push('<td>Origen</td>');
            		} else {
            			items.push('<td>' + key + '</td>');
            		}
            		items.push('<td>' + val.calle + '</td>');
            		if (val.tipo == 0) {
            			items.push('<td>Dirección</td>');
            			items.push('<td>' + val.numero + '</td>');
            		} else {
            			items.push('<td>Intersección</td>');
            			items.push('<td>' + val.interseccion + '</td>');
            		}
            		items.push('<td>' + val.comuna + '</td>');
            		items.push('<td>Acciones</td>');

            		$('<tr/>', {
					    'class': 'tabla-contenido',
					    html: items.join('')
					}).appendTo('.lista-puntos');
            	});
        	}

        	$('.text-destinos').html(numero_destinos);
        }
    })

	// Interceptamos el evento submit
    $('.new_punto').submit(function() {

    	$('.load').show();

    	if (verificar_formulario(this)) {
    		var limpiar = true;

	    	if ($(this).attr('class') == "new_punto origen") {
	    		habilitar_formulario('.destino');
	    		tipo = ".interseccion";
	    		numero = ".numero";
	    		limpiar = false;
	    	} else {
	    		tipo = ".interseccion_destino";
	    		numero = ".numero_destino";
	    	}

	  		// Enviamos el formulario usando AJAX
	        $.ajax({
	            type: 'POST',
	            dataType: 'json',
	            url: $(this).attr('action'),
	            data: $(this).serialize(),
	            // Mostramos un mensaje con la respuesta de PHP
	            success: function(data) {
	            	$('.tabla-contenido').remove();
	            	var items = [];
	            	numero_destinos = 0;

	            	$.each(data, function(key,val){
	            		numero_destinos++;

	            		var items = [];
	            		if (key == 0) {
	            			items.push('<td>Origen</td>');
	            		} else {
	            			items.push('<td>' + key + '</td>');
	            		}
	            		items.push('<td>' + val.calle + '</td>');
	            		if (val.tipo == 0) {
	            			items.push('<td>Dirección</td>');
	            			items.push('<td>' + val.numero + '</td>');
	            		} else {
	            			items.push('<td>Intersección</td>');
	            			items.push('<td>' + val.interseccion + '</td>');
	            		}
	            		items.push('<td>' + val.comuna + '</td>');
	            		items.push('<td>Acciones</td>');

	            		$('<tr/>', {
						    'class': 'tabla-contenido',
						    html: items.join('')
						}).appendTo('.lista-puntos');
	            	});

	            	$('.text-destinos').html(numero_destinos);

	            	

					if (limpiar) {
						limpiar_formulario('.destino');
						$('#punto_tipo_0_destino').attr('checked', 'checked');
						$(tipo).hide();
						$(tipo+' input').attr('value', '0');
						$(numero).css('display', 'inline-block');
					}

					bloquear_formulario('.origen');
					$('.reset').removeAttr("disabled"); 
					tipo = ".interseccion_destino";
	    			numero = ".numero_destino";
	            }
	        })
    	} else {
    		alert("Ingresa todos los campos");
    	}

    	

        $('.load').hide();
        return false;
    });

    $('.destino_0').click(function() {
    	$(tipo).hide();
    	$(tipo+' input').attr('value', '0');
    	$(numero).css('display', 'inline-block');
    	$(numero+' input').attr('value', '');
    });

    $('.destino_1').click(function() {
    	$(tipo).css('display', 'inline-block');
    	$(tipo+' input').attr('value', '');
    	$(numero).hide();
    	$(numero+' input').attr('value', '0');
    });

    // Resetea puntos
    $('.reset').click(function() {
    	if (confirm("Está seguro que quiere comenzar nuevamente? (Se eliminaran todos los destinos ingresados)")) {
    		$.ajax({
	            type: 'POST',
	            url: '<%= cotiza_puntos_eliminar_path %>',
	            // Mostramos un mensaje con la respuesta de PHP
	            success: function() {
	            	$('.tabla-contenido').remove();

	            	// Prepara formularios de puntos
					$('.interseccion').hide();
					$('.interseccion_destino').hide();
					$('.numero').css('display', 'inline-block');
					$('.numero_destino').css('display', 'inline-block');
					limpiar_formulario('.origen');
					limpiar_formulario('.destino');
					$('#punto_tipo_0').attr('checked', 'checked');
					$('#punto_tipo_0_destino').attr('checked', 'checked');
					bloquear_formulario('.destino');
					habilitar_formulario('.origen');
					tipo = ".interseccion"
					numero = ".numero"
					$('.text-destinos').html("0");
	            }
        	});
    	}
    });

});

function llenar_formulario(valor) {
	$('.origen input[name="punto[calle]"]').val(valor.calle)
	$('.origen input[name="punto[numero]"]').val(valor.numero)
	$('.origen input[name="punto[interseccion]"]').val(valor.interseccion)
	$('.origen input[name="punto[comuna]"]').val(valor.comuna)
	if (valor.tipo == 0) {
		$('.origen input[id="punto_tipo_0"]').attr('checked', 'checked');
		$('.origen input[id="punto_tipo_1"]').removeAttr('checked');
	} else {
		$('.origen input[id="punto_tipo_1"]').attr('checked', 'checked');
		$('.origen input[id="punto_tipo_0"]').removeAttr('checked');
		$('.interseccion').css('display', 'inline-block');
		$('.numero').hide();
	}
}

function limpiar_formulario(ele) {

    $(ele).find(':input').each(function() {
        switch(this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            	$(this).val('');
                break;
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
                break;
        }
    });
}

function bloquear_formulario(ele) {

    $(ele).find(':input').each(function() {
        $(this).attr("disabled", true); 
    });
}

function habilitar_formulario(ele) {

    $(ele).find(':input').each(function() {
        $(this).removeAttr("disabled"); 
    });
}

function verificar_formulario(ele) {

	var verificado = true;

    $(ele).find(':input').each(function() {
        switch(this.type) {
            case 'text':
            	if ($(this).val() == '') {
            		$(this).parent().addClass('control-group error');
            		verificado = false;
            	} else {
            		$(this).parent().removeClass('control-group error');
            	}
                break;
        }
    });

    return verificado;
}