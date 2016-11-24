
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
    
    $('#user_ICNo').keyup(function () {
    var cctlength = $(this).val().length; // get character length

    switch (cctlength) {
        case 6:
            var cctVal = $(this).val();
            var cctNewVal = cctVal + '-';
            $(this).val(cctNewVal);
            break;
        case 9:
            var cctVal = $(this).val();
            var cctNewVal = cctVal + '-';
            $(this).val(cctNewVal);
            break;
        
        default:
            break;
    }
	});
	

	

/*
$('#user_ICNo').keyup(function () {
    var ic = '090303086521';

	if(ic.match(/^(\d{2})(\d{2})(\d{2})-?\d{2}-?\d{4}$/)) {
	    var year = RegExp.$1;
	    var month = RegExp.$2;
	    var day = RegExp.$3;
	    console.log(year, month, day);
	    
	    var now = new Date().getFullYear().toString();
	
	    var decade = now.substr(0, 2);
	    if (now.substr(2,2) > year) {
	        year = parseInt(decade.concat(year.toString()), 10);
	    }
	
	    var date = new Date(year, (month - 1), day, 0, 0, 0, 0);
	    console.log(date);
	}
});*/
    

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
	  /*mouseenter:	function(e) {
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
      },*/
      
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