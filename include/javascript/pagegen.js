// Config
menu='#menu';
search='#search'
search_query='#search_query'
toggle_id='#hamburger';
toggle_search_id='#search_toggle';
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

  // Set search value if in query string
  // Read a page's GET URL variables and return them as an associative array.
  function getUrlVars()
  {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++) {
      hash = hashes[i].split('=');
      vars.push(hash[0]);
      vars[hash[0]] = hash[1];
    }
    return vars;
  }

  q=getUrlVars()['q'];
  if (typeof q !== 'undefined') {
    $(search_query).val(decodeURIComponent(q));
  }

  // Toggle menu visibility
  $(toggle_id).click(function() {
    $(search).css('display', 'none');
    $(toggle_search_id).removeClass(menu_shown_class);
    $(menu).toggle();
    $(this).toggleClass(menu_shown_class);
    return false;
  });
  
  // Hide menu on mouse out
  $(menu).mouseleave(function() {
    $(menu).toggle();
    $(toggle_id).toggleClass(menu_shown_class);
    return false;
  });

  // Toggle search menu visibility
  $(toggle_search_id).click(function() {
    $(menu).css('display', 'none');
    $(toggle_id).removeClass(menu_shown_class);
    $(search).toggle();
    $(this).toggleClass(menu_shown_class);
    return false;
  });
  
  // Hide search menu on mouse out
  $(search).mouseleave(function() {
    $(search).toggle();
    $(toggle_search_id).toggleClass(menu_shown_class);
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

  // Search
  function hit_in_result(hit, result){
    for (var i=0;i<result.length;i++) {
      if (result[i].url == hit.url) {
        return true
      }
    }
    return false
  }

  function do_search() {
    original_query=$(search_query).val().toLowerCase();
    query=original_query.split(' ');
    query_string=encodeURIComponent($(search_query).val())
    result=[];

    // Get search index json
    $.getJSON('/search-index.json', function(data) {
      for (var i=0;i<query.length; i++) {
        var term=query[i];
        if (typeof data.terms[term] !== 'undefined') {
          for (var x=0;x<data.terms[term].length; x++) {
            url_id=data.terms[term][x];
            hit={
              url:data.urls[url_id][0],
              desc:data.urls[url_id][2],
              title:data.urls[url_id][1]
            }
            if (hit_in_result(hit, result) == false) {
              result.push(hit);
            }
          }
        }
      }
      // Build result content
      if(result.length>0) {
        html='<div id="hit_count">'+result.length+' results</div>'
        for (var n=0;n<result.length;n++) {
          html+='<div class="search_hit"><a href="'+result[n].url+'?q='+query_string+'">'+result[n].title+'</a>'
          if (result[n].desc.length > 0) {
            html+='<p>'+result[n].desc+'</p>';
          }
          html+='</div>'
        }
      }
      else {
        html='Sorry, nothing found.'
      }

      $('#search_results').remove()
      $(search).append('<div id="search_results">'+html+'</div>');

    });
  }
 
  $(search_query).keypress(function(e){
    if (e.which == 13){
      do_search();
    }
  });

  // end Search
});