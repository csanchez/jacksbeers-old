$( document ).ready(function() {


	var scrollVelocity=4500;

  if(window.innerWidth >=1200){
    $("#presentation-image").html("<img class='img-responsive centered-image' src='/assets/pergamino-lg-1.png' alt='Card image cap' style='width: 100%; '>")
  }else{
    if(window.innerWidth > 768 && window.innerWidth < 1200 ){
      $("#presentation-image").html("<img class='img-responsive centered-image' src='/assets/pergamino-md-1.png' alt='Card image cap' startwidth='957' style='width: 100%; '>")
    }else{
      $("#presentation-image").html("<img class='img-responsive centered-image' src='/assets/pergamino-xs-1.png' alt='Card image cap' style='width: 100%; '>")   
    }
    
  }

  $( window ).resize(function() {
    if(window.innerWidth >=1200){
      $("#presentation-image").html("<img class='img-responsive centered-image' src='/assets/pergamino-lg-1.png' alt='Card image cap' style='width: 100%; '>")
    }else{
      if(window.innerWidth > 768 && window.innerWidth < 1200 ){
        $("#presentation-image").html("<img class='img-responsive centered-image' src='/assets/pergamino-md-1.png' alt='Card image cap' style='width: 100%; '>")
      }else{
        $("#presentation-image").html("<img class='img-responsive centered-image' src='/assets/pergamino-xs-1.png' alt='Card image cap' style='width: 100%; '>")   
      }
      
    }
  });
	
	$("#services-jump").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#services-section").offset().top -100
	    }, scrollVelocity);
	});   

	$("#home-jump").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#home-section").offset().top -100
	    }, scrollVelocity);
	}); 
	$("#about-jump").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#features-section").offset().top -100
	    }, scrollVelocity);
	}); 


	$("#contact-jump").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#contact-section").offset().top -100
	    }, scrollVelocity);
	});  	


	$(".flip").hover(function(){
  $(this).find(".flip-card").toggleClass("flipped");
  return false;
});


  $("#owl-beers").owlCarousel({
 
      //autoPlay: 3000, //Set AutoPlay to 3 seconds
	navigation: true,
	navigationText: [
      "<i class='icon-chevron-left icon-white'> < </i>",
      "<i class='icon-chevron-right icon-white'> > </i>"
      ],
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });

  $("#owl-packs").owlCarousel({
 
      //autoPlay: 3000, //Set AutoPlay to 3 seconds
	navigation: true,
	navigationText: [
      "<i class='icon-chevron-left icon-white'> < </i>",
      "<i class='icon-chevron-right icon-white'> > </i>"
      ],
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });


  /** flip cards**/
  $(".manual-flipped-car").click(function(){
  	console.log($(this))
  	
  	if( $(this).hasClass('hover') ){
            $(this).removeClass('hover');
        } else {
            $(this).addClass('hover');
        }

  });
  $("#card-flip").flip();

   $('.image-container').imagefit();


});


