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
<link rel="shortcut icon" href="/include/graphics/favicon.ico" type="image/x-icon" />
<meta name="description" content="{{description}}" />
<link type="text/css" href="/include/css/site.min.css" rel="stylesheet"></link>
<script src="/include/javascript/site.min.js" async=""></script>
</head>
<body>
<a name="top"></a>
<header>
<nav>
<div id="hamburger" class="sprite"></div>
<div id="search_toggle" class="sprite"></div>
<a href="/" id="logo" class="sprite"></a>
<div id="crumb_trail">{{crumb_trail}}</div>
<div id="menu">
{{menu}}
<div id="issue_tracker"><a href="https://github.com/oliverfields/pagegen_v2_site/issues">Report a bug<span class="sprite bug"></span></a></div>
<div id="contact">Get in touch <a href="mailto:pagegen@phnd.net">pagegen@phnd.net</a></div>
</div><!-- /menu -->
<div id="search">
<input type="text" id="search_query" value="Search" />
</div><!-- /search -->
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
</body>
</html>
