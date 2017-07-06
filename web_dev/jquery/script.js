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

// Showing and hiding content
// Instantaneously hide all paragraphs
// $( "p" ).hide();
// Instantaneously show all divs that have the hidden style class
// $( "div.hidden" ).show();

// jQuery can also show or hide content by means of animation effects. You can tell .show() and .hide() to use animation in a couple of ways. One is to pass in an argument of 'slow', 'normal', or 'fast':
// Slowly hide all paragraphs
// $( "p" ).hide( "slow" );

// Quickly show all divs that have the hidden style class
// $( "div.hidden" ).show( "fast" );

// Hide all paragraphs over half a second
// $( "p" ).hide( 500 );

// Show all divs that have the hidden style class over 1.25 seconds
// $( "div.hidden" ).show( 1250 );

// Fade and slide animations
// .slideDown() and .slideUp() show and hide content, respectively, using only a slide effect.
// Hide all paragraphs using a slide up animation over 0.8 seconds
// $( "p" ).slideUp( 800 );

// Show all hidden divs using a slide down animation over 0.6 seconds
// $( "div.hidden" ).slideDown( 600 );

// Similarly .fadeIn() and .fadeOut() show and hide content, respectively, by means of a fade animation.
// Hide all paragraphs using a fade out animation over 1.5 seconds
// $( "p" ).fadeOut( 1500 );

// Show all hidden divs using a fade in animation over 0.75 seconds
// $( "div.hidden" ).fadeIn( 750 );

// Changing Display Based on Current Visibility State
// jQuery can also let you change a content's visibility based on its current visibility state. .toggle() will show content that is currently hidden and hide content that is currently visible. You can pass the same arguments to .toggle() as you pass to any of the effects methods above.
// Instantaneously toggle the display of all paragraphs
$( "p" ).toggle( 5000 ).delay( 1000 );

// Slowly toggle the display of all images
// $( "img" ).toggle( "slow" );

// Toggle the display of all divs over 1.8 seconds
// $( "div" ).toggle( 1800 );

// You can toggle the display of content with just a slide or a fade using .slideToggle() and .fadeToggle().
// Toggle the display of all ordered lists over 1 second using slide up/down animations
$( "p" ).slideToggle( 5000 );

// Toggle the display of all blockquotes over 0.4 seconds using fade in/out animations
// $( "blockquote" ).fadeToggle( 400 );

// Doing something after an animation completes
// To defer an action until after an animation has run to completion, you need to use an animation callback function. You can specify your animation callback as the second argument passed to any of the animation methods discussed above. For the code snippet above, we can implement a callback as follows:
// Fade in all hidden paragraphs; then add a style class to them (correct with animation callback)
// $( "p.hidden" ).fadeIn( 750, function() {
//     // this = DOM element which has just finished being animated
//     $( this ).addClass( "lookAtMe" );
// });
// Note that you can use the keyword this to refer to the DOM element being animated. Also note that the callback will be called for each element in the jQuery object. This means that if your selector returns no elements, your animation callback will never run! You can solve this problem by testing whether your selection returned any elements; if not, you can just run the callback immediately.

// Managing Animation effects
// .stop() will immediately terminate all animations running on the elements in your selection. You might give end-users control over page animations by rigging a button they can click to stop the animations.
// Create a button to stop all animations on the page:
$( "<button type='button'></button>" )
    .text( "Stop All Animations" )
    .on( "click", function() {
        $( "body *" ).filter( ":animated" ).stop();
    })
    .appendTo( document.body );

// .delay() is used to introduce a delay between successive animations. For example:
// Hide all level 1 headings over half a second; then wait for 1.5 seconds
// and reveal all level 1 headings over 0.3 seconds
// $( "h1" ).hide( 500 ).delay( 1500 ).show( 300 );

// The jQuery.fx object has a number of properties that control how effects are implemented. jQuery.fx.speeds maps the slow, normal, and fast duration arguments mentioned above to a specific number of milliseconds. The default value of jQuery.fx.speeds is:

{
    slow: 600,
    fast: 200,
    _default: 400 // Default speed, used for "normal"
}

// You can modify any of these settings and even introduce some of your own:

jQuery.fx.speeds.fast = 300;
jQuery.fx.speeds.blazing = 100;
jQuery.fx.speeds.excruciating = 60000;