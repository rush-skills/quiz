$(document).on("click",".remove_fields",function(){
  $(this).prevAll(".nested-fields").first().hide();
  $(this).hide();
});
$(document).on('ready',function () {
	// body...
	
});

$(document).ready(function() {
    $('form')
      .on('cocoon:before-insert', function() {
         $.material.init();
      })
      .on('cocoon:after-insert', function() {
         $.material.init();
      })
      .on("cocoon:before-remove", function() {
         $.material.init();
      })
      .on("cocoon:after-remove", function() {
         $.material.init();
      });

});