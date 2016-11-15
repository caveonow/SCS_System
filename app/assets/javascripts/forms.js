$(document).ready.(function(){
  
function create_edit_answer(test){

alert("FAK");
$("#question_view").html("");
$("#question_view").html("<%= j render('layout_questionList')%>");
$("#editanswer_"+test).css('background-color', '#5198db');


$("#panel_create").html("<%= j render ('answers/layout_editAnswer')%>");
};




)};