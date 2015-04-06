<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="Generator" content="Pagegen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{title}} - Pagegen</title>
<meta name="copyright" content="Copyright &#169; {{year}} Oliver Fields" />
<meta name="author" content="Oliver Fields">
<meta name="contact" content="pagegen@phnd.net" />
<base href="{{base_url}}" />
<link rel="canonical" href="{{absolute_url}}" />
<link rel="stylesheet" href="PAGEGEN_SITE_CSS" type="text/css" />
<link rel="shortcut icon" href="/include/graphics/favicon.ico" type="image/x-icon" />
<meta name="description" content="{{description}}" />
<script async src="PAGEGEN_SITE_JAVASCRIPT"></script>
PAGEGEN_ANALYTICS_SCRIPT
</head>
<body>
 <a name="top"></a> 
<header>
<nav>
<div id="hamburger" class="sprite"></div>
<a href="/" id="logo" class="sprite"></a>
<div id="crumb_trail">{{crumb_trail}}</div>
<div id="menu">
<div id="search"></div>
{{menu}}
<div id="issue_tracker"><a href="https://github.com/oliverfields/pagegen_v2_site/issues">Report a bug<span class="sprite bug"></span></a></div>
<div id="contact">Get in touch <a href="mailto:pagegen@phnd.net">pagegen@phnd.net</a></div>
</div>
</nav>
</header>
<article>{{content}}</article>
<div id="shortcuts">
<div id="previous_link">&#8592; {{previous_link}}</div>
<a id="goto_top" href="{{absolute_url}}#top">&#8593;</a>
<div id="next_link">{{next_link}} &#8594;</div>
</div>
<footer>
<div id="copyright">Copyright &#169; {{year}} Oliver Fields</div>
<div id="pagegend" class="sprite"></div>
</footer>
<!-- Google Custom Site Engine - https://cse.google.com/cse/all -->
<script>
  (function() {
    var cx = '013365502467450085413:kkur9yhecwy';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<!-- end CSE -->
</body>
</html>
