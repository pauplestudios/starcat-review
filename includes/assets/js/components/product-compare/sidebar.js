var Sidebar = {
  init: function() {
    console.log("compare sidebar controller");

    // this.createSidebarBtnDiv();
    // this.createSidebarListDiv();
    this.loadSidebarBtnAndContainer();
    this.events();
  },
  events: function() {
    //this.sidebarCompareListBtn(".hrp-compare-pusher");
    this.addItemToCompareList((props = {}));
  },
  loadSidebarBtnAndContainer: function() {
    var element = "";
    element += '<div class="pusher hrp-compare-pusher">';
    element += '<div class="hrp-compare-sidebar-wrapper">';
    element += '<div class="hrp-sidebar-btn">';
    element += '<span class="clickMe toggle">Click Me</span></div>';
    element += '<div class="hrp-compare-sidebar" id="hrp-compare-sidebar">';
    element += '<div class="hrp-list-items">';
    for (let i = 1; i <= 4; i++) {
      element += '<div class="item" data-id="' + i + '">';
      element += "<p>Heading " + i + "</p><span>Descriptions</span></div>";
    }
    element += "</div>";
    element +=
      '<div style="display:flex;justify-content:center;"><button class="ui button hrp-compare-me" style="width:50%;text-align:center;">Compare Me</button></div>';

    element += "</div>";
    element += "</div>";
    element += "</div>";
    jQuery("body").append(element);
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
  createSidebarListDiv: function() {
    let sidebarListContent = "";
    sidebarListContent =
      '<div class="ui right vertical menu sidebar hrp-compare-sidebar" id="hrp-compare-sidebar">';
    sidebarListContent +=
      '<div class="item">Home</div><div class="item">Topics</div>';
    sidebarListContent +=
      '<div class="item">Friends</div><div class="item">History</div>';
    sidebarListContent += "</div>";
    jQuery("body").append(sidebarListContent);
  },

  sidebarCompareListBtn: function(sidebarBtn) {
    jQuery(sidebarBtn).on(
      "click",
      ".hrp-compare-sidebar-wrapper .hrp-sidebar-btn-container",
      function() {
        alert("view sidebar to compare list");
        jQuery(".menu.sidebar.hrp-compare-sidebar").sidebar("toggle");
      }
    );
  },
  addItemToCompareList: function(props) {
    //Add Item to sidebar compare list
    alert(props);
    let content = "";
    content += '<div class="item" data-id="' + props.id + '">';
    content +=
      "<p>" + props.heading + "</p><span>" + props.desc + "</span></div>";
    jQuery(".hrp-list-items").append(content);
  }
};

// Sidebar.prototype.addItemToCompareList = function(props = {}) {
//   let content = "";
//   content += '<div class="item" data-id="' + props.id + '">';
//   content +=
//     "<p>" + props.heading + "</p><span>" + props.desc + "</span></div>";
//   jQuery(".hrp-list-items").append(content);
// };

module.exports = Sidebar;
