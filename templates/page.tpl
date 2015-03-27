<!DOCTYPE html>
<html>
<head>
<meta name="Generator" content="Pagegen" />
<meta name=viewport content="width=device-width, initial-scale=1">
<title>{{title}} - Pagegen</title>
<base href="{{base_url}}" />
<link rel="canonical" href="{{absolute_url}}" />
<link rel="stylesheet" href="/include/css/style.min.css" type="text/css" />
<link rel="shortcut icon" href="/include/graphics/favicon.ico" type="image/x-icon" />
<script async src="/include/javascript/site.min.js"></script>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-9947760-1']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</head>
<body>
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
<footer>
<div id="copyright">Copyright &copy; {{year}}</div>
<div id="pagegend" class="sprite"></div>
</footer>
</body>
</html>
