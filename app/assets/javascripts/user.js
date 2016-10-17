$(function(){
  
  

});

function myFunction() {
    var all = document.getElementById("all");
    var a = document.getElementById("a");
    
    if(all.checked){
    	a.checked = true;
    	document.getElementById("abc").innerHTML = "all";}
    else{
    	document.getElementById("abc").innerHTML = "";}
}
