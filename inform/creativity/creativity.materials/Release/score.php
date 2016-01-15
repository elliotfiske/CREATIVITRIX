
<!doctype html>
<head>

  <?php //include('../analyticstracking.php'); ?>
  <meta charset="utf-8">

  <title>BEST PEP TUNE</title>
  <meta name="description" content="the midterms never bothered me anyways">
  <meta name="viewport" content="width=device-width">
  <!--link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/styles.css"-->
  <!-- Jake weary -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="http://www.parsecdn.com/js/parse-latest.js"></script>

  <!-- Bower junk -->
  <script src="bower_components/webcomponentsjs/webcomponents.min.js"></script>
  <link rel="import" href="bower_components/core-scaffold/core-scaffold.html">
  <link rel="import" href="bower_components/core-item/core-item.html"> 
  <link rel="import" href="bower_components/paper-input/paper-input.html">
  <link rel="import" href="bower_components/paper-fab/paper-fab.html">

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">

      <div class="col-md-12">
        <h1>
          CHOOSE THE BETTER PEP TUNE
        </h1>
      </div>

      <div class="col-md-12">
        <h3>
          Not all pep tunes are created equal
        </h3>
      </div>

    </div><!-- /.container -->

  <script type="text/javascript">
    var Score = Parse.Object.extend("Score");
    var pointsGot = <?php echo $_POST; ?>;
    console.log("Points: " + pointsGot);

    function genTunes() {
      var tune1 = tunez[Math.floor(Math.random()*tunez.length)];
      do {
        var tune2 = tunez[Math.floor(Math.random()*tunez.length)];
      } while (tune1 == tune2);

      $("#choiceText1").text(tune1);
      $("#choiceText2").text(tune2);
    }

    function compared(name1, name2) {
      var newScore = new Score();
      newScore.save({points: 20}).then(function(object) {
        console.log("nice job dunky");
      });
    }

    Parse.initialize("lxZt13Rla0HPWFrXM7BQZB4PGzOcAC8z6Es01vtT", "n5wp5YZCYvIEM4BEpcN4XOCvjDWzvnd3kAfi54rW");

    var instrument = "None";


    function chose1() {
      compared($("#choiceText1").text(), $("#choiceText2").text());

    };

    function chose2() {
      compared($("#choiceText2").text(), $("#choiceText1").text());
    };


  </script>
</body>

</html>
