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
  $("#sizetitle").on("change paste keyup",function() {
	 $('.changeMe').css("font-size", $(this).val() + "px");
  });

  // text size subtitle
  $("#sizesubtitle").on("change paste keyup",function() {
	 $('.changeMe1').css("font-size", $(this).val() + "px");
  });	

  // bold text title
  $("#boldtitle").click(function() {
    $(".changeMe").toggleClass("bold");
  });

  // bold text subtitle
  $("#boldsubtitle").click(function() {
    $(".changeMe1").toggleClass("bold");
  });
	
  // italic text title
  $("#italictitle").click(function() {
    $(".changeMe").toggleClass("italic");
  });

  // italic text subtitle
  $("#italicsubtitle").click(function() {
    $(".changeMe1").toggleClass("italic");
  });
	
  // underline text title
  $("#undertitle").click(function() {
    $(".changeMe").toggleClass("underline");
  });

  // underline text subtitle
  $("#undersubtitle").click(function() {
    $(".changeMe1").toggleClass("underline");
  });	
	
	
});


