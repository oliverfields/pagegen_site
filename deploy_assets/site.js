function toggle_sub_menu(i) {
  var ul = i.nextSibling;
  if (ul.style.display == 'block') {
    ul.style.display = 'none'
    i.className = toggle_show_sub_menu;
  }
  else {
    ul.style.display = 'block';
    i.className = toggle_hide_sub_menu;
  }
}


function show_current_page_parent_menues(obj) {
  if (typeof obj === 'undefined') return;

  if (obj.id == 'menu') return;

  if (obj.parentElement.tagName == 'UL') {
    obj.parentElement.style.display = 'block';
  }

  show_current_page_parent_menues(obj.parentElement);
}


function adorn_previous_next_links() {
  var previous_link = document.querySelectorAll('#previous-link a');
  var next_link = document.querySelectorAll('#next-link a');

  if (previous_link.length > 0) {
    var previous_icon = document.createElement('i');
    previous_icon.className = 'fas arrow-left-3E4349';
    previous_link[0].prepend(previous_icon);
  }

  if (next_link.length > 0) {
    var next_icon = document.createElement('i');
    next_icon.className = 'fas arrow-right-3E4349';
    next_link[0].append(next_icon);
  }
}


var uls = document.querySelectorAll('#menu ul');
var toggle_show_sub_menu = 'sub-menu-toggle fas angle-down-3E4349';
var toggle_hide_sub_menu = 'sub-menu-toggle fas angle-up-3E4349';

for (var i = 0; i < uls.length; i++) {

  if (uls[i].parentElement.tagName === 'LI') {

    uls[i].style.display = 'none'; // Hide sub menu

    // Create icon to toggle sub menu
    var toggle_icon = document.createElement('i');
    toggle_icon.className = toggle_show_sub_menu;
    toggle_icon.onclick = function(event){
      toggle_sub_menu(this);
    }

    uls[i].parentNode.insertBefore(toggle_icon, uls[i]);
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

adorn_previous_next_links();
show_current_page_parent_menues(document.querySelectorAll('#pagegen-current-page')[0]);
