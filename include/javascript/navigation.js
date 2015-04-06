// Config
menu='#menu';
search='#search'
search_query='#search_query'
search_button='#search_button'
toggle_id='#hamburger';
sub_menu_class='sub_menu';
no_sub_menu_class='no_sub_menu';
toggle_class='sub_menu_toggle';
crumb_trail='#crumb_trail';
crumb_trail_separator='<span class="crumb_trail_separator">&raquo;</span>';
menu_shown_class='menu_shown';
sub_menu_shown_class='sub_menu_shown';
previous_link='#previous_link';
next_link='#next_link';

$(document).ready(function(){

  // Toggle menu visibility
  $(toggle_id).click(function() {
    $(menu).toggle();
    $(this).toggleClass(menu_shown_class);
    return false;
  });
  
  // Hide menu on mouse out
  $(menu).mouseleave(function() {
    //$(menu).toggle();
    //$(toggle_id).toggleClass(menu_shown_class);
    return false;
  });
  
  // Add separators to crumb trail
  $(crumb_trail+' > ul li').each(function(){
    $(this).prepend(crumb_trail_separator);
  });

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
  $(menu+' > ul a').wrap('<span></span>');

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

  // Ensure menu a tags don't trigger toggle menu events
  $(menu+' a').click(function(event) {
    event.stopPropagation();
  });

  // Add icon to external links
  $("a").filter(function() {
    return this.hostname && this.hostname !== location.hostname;
  }).append('<span class="sprite"></span>');

  // Add admonition icons
  $('div.admonition p.admonition-title, div.hint p.admonition-title, div.important p.admonition-title, div.note p.admonition-title, div.tip p.admonition-title').prepend('<span class="sprite admonition-good"></span>');
  $('div.attention p.admonition-title, div.caution p.admonition-title, div.danger p.admonition-title, div.error p.admonition-title, div.warning p.admonition-title').prepend('<span class="sprite admonition-bad"></span>');

  // Hide previous or next links if they are empty (first or last pages in link sequence
  if($(previous_link+' a').length == 0) { $(previous_link).remove() }
  if($(next_link+' a').length == 0) { $(next_link).remove() }

  // Setup search
  $(search).css('display', 'block');
  $(search).append('<input type="text" id="search_query" /><span class="sprite" id="search_button">Search</span>')

  function do_search() {
    query=$(search_query).val().split(' ');
    result=[];

    // Get search index json
    $.getJSON('/search-index.json', function(data) {

      // Split query into words and return result for each word that matches
      var q_length = query.length;
      for (var i=0;i<q_length; i++) {
        if (typeof data.terms[query[i]] !== 'undefined') {
          var r_length = data.terms[query[i]].length;
          for (var x=0;x<r_length; x++) {
            url_id=data.terms[query[i]][x][0];
            weight=data.terms[query[i]][x][1];
            url=data.urls[url_id];
            result.push([url, weight]);
            alert('Matched '+url+', weight '+weight);
          }
        }
      }

    });

    // Loop over query words and get results for each word

  }

  $(search_query).keypress(function(e){
    if (e.which == 13){
      do_search();
    }
  });

  $(search_button).click(function(){
    do_search();
  });

  // end Search
});