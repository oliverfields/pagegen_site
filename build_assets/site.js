function toggle_sub_menu(i) {
  var ol = i.nextSibling;
  if (ol.style.display == 'block') {
    ol.style.display = 'none'
    i.className = toggle_show_sub_menu;
  }
  else {
    ol.style.display = 'block';
    i.className = toggle_hide_sub_menu;
  }
}


function show_current_page_parent_menus(obj) {
  if (typeof obj === 'undefined') return;

  if (obj.id == 'menu') return;

  if (obj.parentElement.tagName == 'OL') {
    obj.parentElement.style.display = 'block';
  }

  show_current_page_parent_menus(obj.parentElement);
}


var ols = document.querySelectorAll('#menu ol');
var toggle_show_sub_menu = 'sub-menu-toggle fas angle-down-3E4349';
var toggle_hide_sub_menu = 'sub-menu-toggle fas angle-up-3E4349';

for (var i = 0; i < ols.length; i++) {

  if (ols[i].parentElement.tagName === 'LI') {

    ols[i].style.display = 'none'; // Hide sub menu

    // Create icon to toggle sub menu
    var toggle_icon = document.createElement('i');
    toggle_icon.className = toggle_show_sub_menu;
    toggle_icon.onclick = function(event){
      toggle_sub_menu(this);
    }

    ols[i].parentNode.insertBefore(toggle_icon, ols[i]);
  }
}


function toggle_sidebar() {
  var c = document.getElementById('content');
  var m = document.getElementById('sidebar');
  var h = document.getElementById('hamburger');

  // Hide sidebar
  if(m.style.display === "block") {
    m.style.display="none";
    c.style.display="block";
    h.className="fas bars-3E4349"
    document.body.style.backgroundColor = '#FCFDFF';
  }
  // Show sidebar
  else {
    m.style.display="block";
    c.style.display="none";
    h.className="fas times-3E4349"
    document.body.style.backgroundColor = '#EEEEEE';
  }
}


window.onresize = function() {
    var sidebar = document.getElementById('sidebar');
    if(window.innerWidth > 940) {
      if(sidebar.style.display != 'block') sidebar.style.display = 'block';
    }
    if(window.innerWidth <= 940) {
      if(sidebar.style.display = 'block') sidebar.style.display = 'none';
    }
};

var hamburger = document.getElementById('hamburger');
hamburger.onclick = function (event) { toggle_sidebar() };

show_current_page_parent_menus(document.querySelectorAll('#pagegen-current-page')[0]);
