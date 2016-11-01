$(function(){
	
	// advertisement 
	$('#advertisement_agecondition').change(function(){
		
		var target = $('#advertisement_agecondition option:selected').val();
		
		if (target == 'Between'){
			$('#advertisement_ageto').prop('disabled', false);
		}else {
			$('#advertisement_ageto').prop('disabled', true);
			$('#advertisement_ageto').val("");
		}
	     
	});

});