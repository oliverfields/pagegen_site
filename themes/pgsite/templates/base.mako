<%!
from pathlib import Path
%><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${page.title} - Pagegen</title>
    <meta name="copyright" content="Copyright &#169; ${year} Oliver Fields" />
    <meta name="author" content="Oliver Fields">
    <meta name="contact" content="pagegen@phnd.net" />
    <!-- Open graph -->
    <meta property="og:image" content="${base_url}/include/images/pagegen_logo_300x300.png"/>
    <meta property="og:site_name" content="Pagegen - Static site generator"/>
    <meta property="og:title" content="${page.title}"/>
    <meta property="og:url" content="${page.absolute_url}"/>
	% if page.headers['description']:
	<meta property="og:description" content="${page.headers['description']}"/>
    <meta name="description" content="${page.headers['description']}" />
	% endif
    <!-- /Open graph -->
    <base href="${base_url}" />
    <link rel="canonical" href="${page.absolute_url}" />
    <link rel="shortcut icon" href="${base_url}/favicon.ico" type="image/x-icon" />
    <meta name="Generator" content="Pagegen" />
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <style>
<% css = Path(site_dir + '/build_assets/min.css').read_text() %>
${css}
    </style>
% if environment == 'production':
    <meta name=\"google-site-verification\" content=\"h9pxP5_cbPYfxaHUtlg4XGHgB_WR9G2pmapS8qShDSM\" />
    <script type=\"text/javascript\">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-9947760-1']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
  </script>
% endif
  </head>
  <body>
    <div id="page">
     <article id="content">
         <h1 class="first">${page.title}</h1>
        <%block name="content" />
        <div class="clearfix prev-next-links">
          % if page.previous_page:
          <div id="previous-link"><a href="${page.previous_page.url_path}"><i class="fas arrow-left-3E4349"></i> ${page.previous_page.title}</a></div>
          % endif
          % if page.next_page:
          <div id="next-link"><a href="${page.next_page.url_path}">${page.next_page.title} <i class="fas arrow-right-3E4349"></i></a></div>
          % endif
        </div>
        <div id="footer">Copyright &#169; ${year} Oliver Fields<br />Generated by <a id="footer-logo" href="https://pagegen.phnd.net"><svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#pagegen-then-factory-logo"></use></svg></a><br /><a href="${page.page_file_name}.txt" title="Page source" target="_blank"><i class="fas code-999999"></i></a></div>
      </article><!-- /content -->
      <div id="top-bar">
        <a href="${base_url}">
          <svg id="pagegen-then-factory-logo" version="1.1" viewBox="0 0 30.48 6.7734" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
            <title>Pagegen logo</title>
            <path d="m0.42333 6.7733h-0.42333v-4.2333h2.54v2.54h-1.6933v1.6933zm0.84667-2.54h0.42333v-0.84666h-0.84666v0.84666zm3.3867 2.54h-1.27v-2.54h1.6933v-0.84666h-1.6933v-0.84667h2.54v4.2333zm0-0.84666h0.42333v-0.84667h-0.84667v0.84667zm3.3867 0.84666h-1.27v-0.84666h1.6933v-0.84667h-1.6933v-2.54h2.54v4.2333zm0-2.54h0.42334v-0.84666h-0.84667v0.84666zm3.3867 2.54h-1.27v-4.2333h2.54v2.54h-1.6933v0.84667h1.6933v0.84666zm0-2.54h0.42333v-0.84666h-0.84666v0.84666zm3.3867 2.54h-1.27v-0.84666h1.6933v-0.84667h-1.6933v-2.54h2.54v4.2333zm0-2.54h0.42333v-0.84666h-0.84667v0.84666zm3.3867 2.54h-1.27v-4.2333h2.54v2.54h-1.6933v0.84667h1.6933v0.84666zm0-2.54h0.42334v-0.84666h-0.84667v0.84666zm2.54 2.54h-0.42333v-4.2333h1.6933v0.84667h0.84667v3.3867h-0.84667v-2.54h-0.84666v2.54zm6.7733 0h-2.9633v-6.7733h1.6933v2.54h4.2333v4.2333zm-1.27-1.6933h0.84666v-1.6933h-1.6933v1.6933zm2.54 0h0.84666v-1.6933h-1.6933v1.6933z" fill="currentColor" stroke-width="0"/>
          </svg>
        </a>
        <i class="fas bars-3E4349" id="hamburger"></i>
      </div><!-- /top-bar -->
      <div id="sidebar">
        <a id="page-logo" href="${base_url}">
          <svg version="1.1" viewBox="0 0 86.4 48" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
            <title>Pagegen logo</title>
            <path d="m1.6 48h-1.6v-16h9.6v9.6h-6.4v6.4zm3.2-9.6h1.6v-3.2h-3.2v3.2zm12.8 9.6h-4.8v-9.6h6.4v-3.2h-6.4v-3.2h9.6v16zm0-3.2h1.6v-3.2h-3.2v3.2zm12.8 3.2h-4.8v-3.2h6.4v-3.2h-6.4v-9.6h9.6v16zm0-9.6h1.6v-3.2h-3.2v3.2zm12.8 9.6h-4.8v-16h9.6v9.6h-6.4v3.2h6.4v3.2zm0-9.6h1.6v-3.2h-3.2v3.2zm12.8 9.6h-4.8v-3.2h6.4v-3.2h-6.4v-9.6h9.6v16zm0-9.6h1.6v-3.2h-3.2v3.2zm12.8 9.6h-4.8v-16h9.6v9.6h-6.4v3.2h6.4v3.2zm0-9.6h1.6v-3.2h-3.2v3.2zm9.6 9.6h-1.6v-16h6.4v3.2h3.2v12.8h-3.2v-9.6h-3.2v9.6zm-35.2-22.4h-11.2v-25.6h6.4v9.6h16v16zm-4.8-6.4h3.2v-6.4h-6.4v6.4zm9.6 0h3.2v-6.4h-6.4v6.4z" fill="currentColor" stroke-width="0"/>
          </svg>
        </a>
        <p id="blurb">Every page is a file<br /><span>Static site generator</span></p>
        <div id="search-form">
          <form action="${base_url}/search-results${default_extension}" method="GET">
            <input type="text" id="search-query" name="q" />
            <input type="submit" id="search-submit" value="Search" />
          </form>
        </div><!-- /search-form -->
        <div id="menu">${page.menu}</div>
        <ol id="project-info">
          <li><i class="fas bug-3E4349"></i> <a href="https://github.com/oliverfields/pagegen_site/issues">Issue tracker</a></li>
          <li><i class="fas envelope-3E4349"></i> <a href="mailto:pagegen@phnd.net">pagegen@phnd.net</a></li>
        </ol>
        <div class="github-button-container"><a class="github-button" href="https://github.com/oliverfields/pagegen" data-show-count="true" data-size="large" aria-label="Star oliverfields/pagegen on GitHub">Star</a></div>
      </div><!-- /sidebar -->
 
    </div><!-- /page -->
    <script>
<% js = Path(site_dir + '/build_assets/min.js').read_text() %>
${js}
    </script>
  </body>
</html>
