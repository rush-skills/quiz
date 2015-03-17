$(document).on("click",".remove_fields",function(){
  $(this).prevAll(".nested-fields").first().hide();
  $(this).hide();
});
$(document).on('ready',function () {
	// body...
	
});
$(document).ready(function() {
    var x=$('.row');
    $.each(x, function() {
        var max=0;
        $.each($(this).find('div[class^="col-"]'), function() {
            if($(this).height() > max)
                max=$(this).height();
        });
        $.each($(this).find('div[class^="col-"]'), function() {
            $(this).height(max);
        });
    });
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