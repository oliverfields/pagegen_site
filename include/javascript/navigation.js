// Config
menu='#menu';
toggle_id='#hamburger';
sub_menu_class='sub_menu';
no_sub_menu_class='no_sub_menu';
toggle_class='sub_menu_toggle';
crumb_trail='#crumb_trail';
crumb_trail_separator='<span class="crumb_trail_separator">&rtri;</span>';
menu_shown_class='menu_shown'
sub_menu_shown_class='sub_menu_shown'


// Toggle menu visibility
$(function() {
  $(toggle_id).click(function() {
    $(menu).toggle();
    $(this).toggleClass(menu_shown_class);
    return false;
  });

  $(menu).mouseleave(function() {
    $(menu).toggle();
    $(toggle_id).toggleClass(menu_shown_class);
    return false;
  });

  // Add separators to crumb trail
  $(crumb_trail+' > ul li').each(function(){
    $(this).prepend(crumb_trail_separator);
  });

});


$(document).ready(function(){

  // Add class to each li that has a sub menu
  // Add toggle visibility icon to sub menu li
  $(menu+' li').each(function() {
    if($(this).has('ul').length){
      $(this).addClass(sub_menu_class);
    }
    else {
      $(this).addClass(no_sub_menu_class);
    }
  });

  // Add span around a tag to ease styling, need to add toggle in this span
  $(menu+' a').wrap('<span></span>');

  $(menu+' li:has(ul) > span').each(function() {
    $(this).append('<span class="sprite '+toggle_class+'"></span>');
  });

  // Toggle sub menu and menu visibility icon
  $('.'+sub_menu_class).click(function(event) {
    event.stopPropagation();
    $(this).children('ul').toggle();

    $(this).children('span').children('span').toggleClass(sub_menu_shown_class);
  });

  // Ensure non sub menu items don't trigger hide sub menu
  $('.'+no_sub_menu_class).click(function(event) {
    event.stopPropagation();
  });

  // Add icon to external links
  $("a").filter(function() {
    return this.hostname && this.hostname !== location.hostname;
  }).append('<span class="sprite"></span>');

});