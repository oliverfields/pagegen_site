<!DOCTYPE html>
<html>
<head>
<meta name="Generator" content="Pagegen" />
<meta name=viewport content="width=device-width, initial-scale=1">
<title>{{title}} - Pagegen</title>
<meta name="copyright" content="Copyright &copy; {{year}} Oliver Fields" />
<meta name="author" content="Oliver Fields">
<meta name="contact" content="pagegen@phnd.net" />
<base href="{{base_url}}" />
<link rel="canonical" href="{{absolute_url}}" />
<link rel="stylesheet" href="/include/css/style.min.css" type="text/css" />
<link rel="shortcut icon" href="/include/graphics/favicon.ico" type="image/x-icon" />
<meta name="description" content="{{description}}" />
<script async src="/include/javascript/site.min.js"></script>
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
<div id="copyright">Copyright &copy; {{year}} Oliver Fields</div>
<div id="pagegend" class="sprite"></div>
</footer>
</body>
</html>
