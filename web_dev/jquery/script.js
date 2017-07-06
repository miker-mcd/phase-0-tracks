$( document ).ready(function() {
  $( "p" ).click(function( event ) {
  alert("You've downloaded a virus! Prepare to be fired from your job!");
  });
});

$( "h2" ).hover(
  function () {
    $( this ).addClass( "test" );
  }, function() {
    $( this ).removeClass( "test" );
  }
);