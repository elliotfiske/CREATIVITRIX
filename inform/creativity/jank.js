setTimeout(function() {$('.WindowFrame.GridWindow').bind("DOMSubtreeModified",function(){
    var place = $('.WindowFrame.GridWindow .GridLine span').html();
  if (place && place.indexOf("Arena") != -1) {

        jQuery('#list-data').val([65]);
        jQuery('#myform').submit();

    }
})}, 5000);

console.log("THIS IS ME, THIS IS NOW")
