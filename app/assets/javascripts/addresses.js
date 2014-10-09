$(document).ready(function(){

  // click the button
  $("#autofill-address").click(function(){
    $address = $("#autofilled-address");
    $partials = $address.children();

    // loop the partials
    $partials.each(function(){
      $this = $(this);
      target = $this.data("target");
      $target = $("#" + target);
      $value = $this.data("value");

      // fill in the info if available


      if($target.length > 0) {
        $target.val($value);
      }
    });

    $(this).toggleClass("disabled");
    $(this).html("Copied Address");
  });
});
