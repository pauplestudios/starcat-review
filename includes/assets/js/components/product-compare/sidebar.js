jQuery(document).ready(function($) {
  console.log("sidebar controller");

  function compareSidebarList(element) {
    this.element = element;
    console.log(this.element);
    // this.bindEvents();
  }

  var btnContent = "";
  btnContent +=
    '<div class="pusher hrp-compare-pusher"><div class="hrp-compare-sidebar-wrapper">';
  btnContent += '<div class="hrp-sidebar-btn-container">';
  btnContent += '<span class="clickMe toggle">Click Me</span>';
  btnContent += "</div></div>";
  if (jQuery("body").find(".hrp-compare-pusher").length == 0) {
    jQuery("body").append(btnContent);
  }

  new compareSidebarList(jQuery(".hrp-compare-pusher"));
});
