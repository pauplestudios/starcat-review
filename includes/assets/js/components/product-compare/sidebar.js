var Sidebar = {
  init: function() {
    console.log("compare sidebar controller");

    this.createSidebarBtnDiv();
    this.events();
  },
  createSidebarBtnDiv: function() {
    let btnContent = "";
    btnContent += '<div class="pusher hrp-compare-pusher">';
    btnContent += '<div class="hrp-compare-sidebar-wrapper">';
    btnContent += '<div class="hrp-sidebar-btn-container">';
    btnContent += '<span class="compareMe toggle">Click Me</span>';
    btnContent += "</div></div>";
    jQuery("body").append(btnContent);
  },
  events: function() {
    this.sidebarCompareListBtn(".hrp-compare-pusher");
  },
  sidebarCompareListBtn: function(sidebarBtn) {
    jQuery(sidebarBtn).on(
      "click",
      ".hrp-compare-sidebar-wrapper .hrp-sidebar-btn-container",
      function() {
        alert("view sidebar to compare list");
      }
    );
  }
};

module.exports = Sidebar;
