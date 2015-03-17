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