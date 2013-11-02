var ready = function() {
  var open = false;

  $("#collapse-button").click(function() {
    if (open) {
      $(".subtitle_container").animate({
        "padding-top": "85px",
      }, 400);

      $("#main_header").animate({
        height: "150px",
      }, 400);

      $("#outline").animate({
        height: "50px",
      }, 400);

      $("#inner_outline").animate({
        height: "42px",
      }, 400);

      $("#errors_container").animate({
        "padding-top": "180px",
      }, 400);

      $("#logo").animate({
        top: "5px",
      }, 400);

    } else {

      $("#main_header").animate({
        height: "240px",
      }, 400);

      $(".subtitle_container").animate({
        "padding-top": "35px",
      }, 400);

      $("#outline").animate({
        height: "150px",
      }, 400);

      $("#inner_outline").animate({
        height: "142px",
      }, 400);

      $("#errors_container").animate({
        "padding-top": "260px",
      }, 400);

      $("#logo").animate({
        top: "45px",
      }, 400);
    }

    open = !open;
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
