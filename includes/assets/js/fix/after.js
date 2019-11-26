// jQuery(document).ready(function() {
//     console.log("After Dropdown");
//     // Dropdown semantic UI namespace conflict with boostrap themes
//     jQuery.fn.dropdown = jQuery.fn.dropdownY;
//     delete jQuery.fn.dropdownY;
// });

// alert(jQuery.fn.dropdown);
jQuery.fn.dropdownY = jQuery.fn.dropdown;
// delete jQuery.fn.dropdown;
// if (jQuery.fn.dropdown_other) {
//     jQuery.fn.dropdown = jQuery.fn.dropdown_other;
// }
