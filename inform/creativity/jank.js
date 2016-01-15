function blah() {
    if ($('.WindowFrame.GridWindow').length == 0) {
        setTimeout(blah, 1000);
            console.log("BAD: trying again");
        return;
    }

    $('.WindowFrame.GridWindow').bind("DOMSubtreeModified",function(){
            console.log("We're in...");
        var place = $('.WindowFrame.GridWindow .GridLine span').html();

        if (!place) {
            console.log("BAD: trying again");
        }
        else {
            console.log("GREAT SUCCESS!");
        }

        if (place && place.indexOf("DONE") != -1) {

            var topText = $(".WindowFrame.GridWindow .GridLine span").html();
            var matches = topText.match(/\d+\s*$/); // 123456
            var points = parseInt(matches[0]);

            jQuery('#point-input').val(points);
            jQuery('#myform').submit();

        }

        if (place && place.indexOf("BACH") != -1) {
            $("#song").get(0).play();
        }
    });
}

setTimeout(blah, 1000);

console.log("THIS IS ME, THIS IS NOW")


// TO RELEASE:

//  copy in form:
/*

<div class="coverimage"><span><img src="../map.png"></span></div>

<form action="http://www.elliotfiske.com/creative/CREATIVITRIX/inform/creativity/score.php" method="POST" target="_blank" id="myform" style="display: none;">
  <input type="text" name="points" id="point-input"/>
  <input type="submit" value="Submit">
</form>

<script src="../../jank.js" type="text/javascript"></script>

<audio id="song" style="display:none" controls>
  <source src="../../classical.mp3" type="audio/mpeg">
</audio>

Do stylin:
<link rel="stylesheet" href="../../MY_STUFF.css">


*/

