// Launching code on document ready
// $( document ).ready(function() {

//     $( "a" ).click(function( event ) {

//         alert( "Thanks for visiting!" );

//     });

// });

// $( document ).ready(function() {

//     $( "a" ).click(function( event ) {

//         alert( "As you can see, the link no longer took you to jquery.com" );

//         event.preventDefault();

//     });

// });

// Adding and removing an HTML class

// Add the .addClass call to the script
// $( "a" ).addClass( "test" );

// To remove an existing class, use .removeClass():
// $( "a" ).removeClass( "test" );

// Special effects

// Add effect to make the link slowly disappear when clicked
$( "a" ).click(function( event ) {
  event.preventDefault();
  $( this ).hide( "slow" );
});

// Callback without Arguments
// $.get( "myhtmlpage.html", myCallBack );
// When $.get() finishes getting the page myhtmlpage.html, it executes the myCallBack() function.

// Callback with arguments
// To defer executing myCallBack() with its parameters, you can use an anonymous function as a wrapper. Note the use of function() {. The anonymous function does exactly one thing: calls myCallBack(), with the values of param1 and param2.
// $.get( "myhtmlpage.html", function() {
    // myCallBack ( param1, param2 );
  // });
// When $.get() finishes getting the page myhtmlpage.html, it executes the anonymous function, which executes myCallBack( param1, param2 ).

