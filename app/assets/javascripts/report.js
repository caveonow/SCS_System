$(function(){
  
  // title
  $('#title').keyup(function(){
     $('#previewtitle').text($(this).val());
  });
  
  // subtitle
  $('#subtitle').keyup(function(){
     $('#previewsubtitle').text($(this).val());
  });

  // text size title
  $("#sizetitle").change(function() {
	 $('.changeMe').css("font-size", $(this).val() + "px");
  });

  // text size subtitle
  $("#sizesubtitle").change(function() {
	 $('.changeMe1').css("font-size", $(this).val() + "px");
  });	

  // bold text title	
  $("#boldtitle").click(function(){
	$('.changeMe').css("font-weight","Bold");
  });
  
  // bold text subtitle
  $("#boldsubtitle").click(function(){
	$('.changeMe1').css("font-weight","Bold");
  });
	
});


