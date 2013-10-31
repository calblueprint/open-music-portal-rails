var ready = function() {
  var open = false;

  $("#collapse-button").click(function() {
    if (open) {
      $("#subtitle").animate({
        top: "135px",
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

      $("#main_container").animate({
        "padding-top": "170px",
      }, 400);

    } else {

      $("#main_header").animate({
        height: "240px",
      }, 400);

      $("#subtitle").animate({
        top: "225px",
      }, 400);

      $("#outline").animate({
        height: "150px",
      }, 400);

      $("#inner_outline").animate({
        height: "142px",
      }, 400);

      $("#main_container").animate({
        "padding-top": "250px",
      }, 400);
    }

    open = !open;
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
