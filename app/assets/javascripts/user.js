$(function(){
  
 $('#select_all').on('click',function(){
        if(this.checked){
            $('.checkbox').each(function(){
                this.checked = true;
            });
        }else{
             $('.checkbox').each(function(){
                this.checked = false;
            });
        }
    });
    
    $('.checkbox').on('click',function(){
        if($('.checkbox:checked').length == $('.checkbox').length){
            $('#select_all').prop('checked',true);
        }else{
            $('#select_all').prop('checked',false);
        }
    });
    

  $('#user_DateOfBirth').datepicker({
  	dateFormat: "yy-mm-dd",
  	changeYear: true,
  	changeMonth: true,
  	buttonText: "Calendar",
  	yearRange: "1900:2050",
  	maxDate: '0'
	});
	
	
	var calculateAge = function(birthday) {
    var now = new Date();
    var past = new Date(birthday);
    var nowYear = now.getFullYear();
    var pastYear = past.getFullYear();
    var age = nowYear - pastYear;

    return age;
	};

	$('#user_DateOfBirth').on({
			mouseenter:	function(e) {
      e.preventDefault();
      var $birthday = $('#user_DateOfBirth').val();

      $('#user_age').val(calculateAge($birthday));
      $('#age1').text(calculateAge($birthday));
      },
      
      mouseleave:	function(e) {
      e.preventDefault();
      var $birthday = $('#user_DateOfBirth').val();

      $('#user_age').val(calculateAge($birthday));
      $('#age1').text(calculateAge($birthday));
      },
      
      click:	function(e) {
      e.preventDefault();
      var $birthday = $('#user_DateOfBirth').val();

      $('#user_age').val(calculateAge($birthday));
      $('#age1').text(calculateAge($birthday));
      },
      
      keyup:	function(e) {
      e.preventDefault();
      var $birthday = $('#user_DateOfBirth').val();

      $('#user_age').val(calculateAge($birthday));
      $('#age1').text(calculateAge($birthday));
      },
      
      change:	function(e) {
      e.preventDefault();
      var $birthday = $('#user_DateOfBirth').val();

      $('#user_age').val(calculateAge($birthday));
      $('#age1').text(calculateAge($birthday));
      }
      
	});
	
});




