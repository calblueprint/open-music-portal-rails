$(document).ready(function(){
	
	// Question 4
	// IMPLEMENT "SHOW MODAL" WHEN "CLICK ON LOGIN BUTTON FROM MAIN PAGE" HERE
	$('#link').click(function(){
		$('#modal-container').show();
	});
	// IMPLEMENT "HIDE MODAL" WHEN "CLICK ON LOGIN BUTTON FROM MODAL BOX" HERE
	$('#modal-submit').click(function(){
		$('#modal-container').hide();
	});
	// IMPLEMENT "HIDE MODAL" WHEN "CLICK ON CANCEL BUTTON FROM MODAL BOX" HERE
	$('#modal-cancel').click(function(){
		$('#modal-container').hide();
	});
	
	// Question 5
	// IMPLEMENT "HIDE MODAL" WHEN "CLICK ON MODAL OVERLAY" HERE
	$('#modal-overlay').click(function(){
		$('#modal-container').hide();
	});
	
	// Question 7
	// IMPLEMENT THE "SLIDE TO LEFT" WHEN "CLICK ON CAROUSEL-NEXT" HERE
	$('#carousel-next').click(function(){
		var currentMargin = parseInt($('#carousel').css('margin-left').replace("px", ""));
		if (currentMargin == -3840) {
			return false;
		} else {
			$('#carousel').animate({'margin-left': currentMargin - 900});
		}
	});

	// IMPLEMENT THE "SLIDE TO RIGHT" WHEN "CLICK ON CAROUSEL-PREV" HERE
	$('#carousel-prev').click(function(){
		var currentMargin = parseInt($('#carousel').css('margin-left').replace("px", ""));
		if (currentMargin == 0) {
			return false;
		} else {
			$('#carousel').animate({'margin-left': currentMargin + 900});
		}
	});
	
});