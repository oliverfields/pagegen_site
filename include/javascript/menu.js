// Config
menu='#menu > ul';
toggle_id='#hamburger';
sub_menu_class='sub_menu';
toggle_class='sub_menu_toggle';
crumb_trail='#crumb_trail > ul';

// Arrows
sub_menu_show='\u25B2';
sub_menu_hide='\u25BC';
// +/- box
//sub_menu_show='\u229F';
//sub_menu_hide='\u229E';
menu_show='\u2261';
//Cross: menu_hide='\u2A2F';
menu_hide='x'
crumb_trail_separator='\u25B9';

// Toggle menu visibility
$(function() {
  $(toggle_id).click(function() {
    $(menu).toggle();

    if($(this).html()==menu_show){
      $(this).html(menu_hide);
    }
    else {
      $(this).html(menu_show);
    }
    return false;
  });

  $(menu).mouseleave(function() {
    $(menu).toggle();
    $(toggle_id).html(menu_show);
    return false;
  });

  // Add separators to crumb trail
  $(crumb_trail+' li:not(:last)').each(function(){
    $(this).append(' '+crumb_trail_separator+' ');
  });

});


$(document).ready(function(){

  // Add class to each li that has a sub menu
  // Add toggle visibility icon to sub menu li
  $(menu+' li:has(ul)').each(function() {
    $(this).addClass(sub_menu_class);
  });

  // Add span around a tag to ease styling, need to add toggle in this span
  $(menu+' a').wrap('<span></span>');

  $(menu+' li:has(ul) > span').each(function() {
    $(this).append('<span class="'+toggle_class+'">'+sub_menu_hide+'</span>');
  });

  // Toggle sub menu and menu visibility icon
  $('.'+sub_menu_class).click(function(event) {
    event.stopPropagation();
    $(this).children('ul').toggle();

    if($(this).children('span').children('span').html()==sub_menu_show){
      $(this).children('span').children('span').html(sub_menu_hide);
    }
    else {
      $(this).children('span').children('span').html(sub_menu_show);
    }
  });

});