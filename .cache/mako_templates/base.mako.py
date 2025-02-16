# -*- coding:utf-8 -*-
from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
STOP_RENDERING = runtime.STOP_RENDERING
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 10
_modified_time = 1739725507.173974
_enable_loop = True
_template_filename = '/home/lemo/Documents/pg_site/themes/kiss/templates/base.mako'
_template_uri = 'base.mako'
_source_encoding = 'utf-8'
_exports = ['content']


def render_body(context,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(pageargs=pageargs)
        site = context.get('site', UNDEFINED)
        isinstance = context.get('isinstance', UNDEFINED)
        year = context.get('year', UNDEFINED)
        page = context.get('page', UNDEFINED)
        def content():
            return render_content(context._locals(__M_locals))
        str = context.get('str', UNDEFINED)
        __M_writer = context.writer()
        __M_writer('<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="UTF-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n    <base href="')
        __M_writer(str(site.base_url))
        __M_writer('" />\n    <link rel="canonical" href="')
        __M_writer(str(page.absolute_url))
        __M_writer('" />\n    <title>')
        __M_writer(str(page.headers['title']))
        __M_writer('</title>\n    ')

        # Meta description
        if 'description' in page.headers.keys() and isinstance(page.headers['description'], str) > 0:
            meta_desc = '<meta name="description" content="' + page.headers['description'].replace('"', '&quot;') + '" />'
        else:
            meta_desc = ''
            
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['meta_desc'] if __M_key in __M_locals_builtin_stored]))
        __M_writer('\n    ')
        __M_writer(str(meta_desc))
        __M_writer('\n')
        if ('sitemap exclude' in page.headers.keys() and page.headers['sitemap exclude']):
            __M_writer('    <meta name="robots" content="noindex" />\n')
        __M_writer('    <meta name="copyright" content="Copyright &#169; ')
        __M_writer(str(year))
        __M_writer('" />\n')
        __M_writer('    ')

        if 'og image' in page.headers.keys():
            og_image_url = page.headers['og image']
        
        
        
            # TODO update to automatically get stuff
        
            og_image_width = 400 # Need to get this value
            og_image_height = 400 # Need to get this value
            og_image_alt = 'Pagegen'
            og_image_type = 'image/svg'
        else:
            og_image_url = site.base_url + '/assets/theme/hero.png'
            og_image_width = 1200
            og_image_height = 630
            og_image_alt = 'Pagegen'
            og_image_type = 'image/png'
            
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['og_image_alt','og_image_width','og_image_type','og_image_height','og_image_url'] if __M_key in __M_locals_builtin_stored]))
        __M_writer('\n    <meta property="og:image" content="')
        __M_writer(str(og_image_url))
        __M_writer('"/>\n    <meta property="og:image:secure_url" content="')
        __M_writer(str(og_image_url))
        __M_writer('"/>\n    <meta property="og:image:width" content="')
        __M_writer(str(og_image_width))
        __M_writer('"/>\n    <meta property="og:image:height" content="')
        __M_writer(str(og_image_height))
        __M_writer('"/>\n    <meta property="og:image:alt" content="')
        __M_writer(str(og_image_alt))
        __M_writer('"/>\n    <meta property="og:image:type" content="')
        __M_writer(str(og_image_type))
        __M_writer('"/>\n    <meta property="og:site_name" content="pagegen.phnd.net"/>\n    <meta property="og:title" content="')
        __M_writer(str(page.headers['title']))
        __M_writer('"/>\n    <meta property="og:url" content="')
        __M_writer(str(page.absolute_url))
        __M_writer('"/>\n    <meta property="og:type" content="website"/>\n')
        if 'description' in page.headers.keys() and page.headers['description']:
            __M_writer('    <meta property="og:description" content="')
            __M_writer(str(page.headers['description']))
            __M_writer('"/>\n    <meta name="description" content="')
            __M_writer(str(page.headers['description']))
            __M_writer('" />\n')
        __M_writer('    <link rel="alternate" type="application/rss+xml" title="')
        __M_writer(str(site.conf['rss']['title']))
        __M_writer('" href="/feed.rss">\n    <meta name="Generator" content="Pagegen" />\n    <link rel="shortcut icon" href="/theme/favicon.ico" type="image/x-icon" />\n    <link rel="stylesheet" href="/theme/site.css" type="text/css" />\n    <script async defer src="https://buttons.github.io/buttons.js"></script>\n  </head>\n  <body>\n    <div id="content">\n      <article>\n        <h1>')
        __M_writer(str(page.headers['title']))
        __M_writer('</h1>\n        ')
        if 'parent' not in context._data or not hasattr(context._data['parent'], 'content'):
            context['self'].content(**pageargs)
        

        __M_writer('\n      </article>\n      <footer>Copyright &#169; ')
        __M_writer(str(year))
        __M_writer('</footer>\n    </div><!-- /content -->\n    <div id="menu">\n      <header>\n        <a href="/index">\n          <img width="120" height="66" src="/theme/pgn-logo.svg">\n        </a>\n        <h2>Every page is a file</h2>\n        <em>Static site generator</em>\n      </header>\n<!--\n      <div id="search-form">\n        <form action="')
        __M_writer(str(site.base_url))
        __M_writer('/search-results" method="GET">\n          <input type="text" id="search-query" name="q" />\n          <input type="submit" id="search-submit" value="🔍️" />\n        </form>\n      </div> --><!-- /search-form -->\n      ')
        __M_writer(str(site.cache['sitemenu']))
        __M_writer('\n      <ol>\n        <li>✉️ <a href="mailto:pagegen@phnd.net">pagegen@phnd.net</a></li>\n        <li>🐞 <a href="https://github.com/oliverfields/pagegen_site/issues">Issue tracker</a></li>\n      </ol>\n      <div class="github-button-container"><a class="github-button" href="https://github.com/oliverfields/pagegen" data-show-count="true" data-size="large" aria-label="Star oliverfields/pagegen on GitHub">Star</a></div>\n\n    </div><!-- /menu -->\n    <div id="menu-toggle">\n      <svg id="menu-open" width="2rem" height="2rem" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">\n        <path d="M5 6.5H19V8H5V6.5Z" fill="#1F2328"/>\n        <path d="M5 16.5H19V18H5V16.5Z" fill="#1F2328"/>\n        <path d="M5 11.5H19V13H5V11.5Z" fill="#1F2328"/>\n      </svg>\n      <svg id="menu-close" style="display: none;" width="2rem" height="2rem" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">\n        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 10.9394L16.9697 5.96961L18.0304 7.03027L13.0606 12L18.0303 16.9697L16.9697 18.0304L12 13.0607L7.03045 18.0302L5.96979 16.9696L10.9393 12L5.96973 7.03042L7.03039 5.96976L12 10.9394Z" fill="#1F2328"/>\n      </svg>\n    </div><!-- /menu-toggle -->\n    <script src="/theme/site.js"></script>\n  </body>\n</html>\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


def render_content(context,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        def content():
            return render_content(context)
        __M_writer = context.writer()
        return ''
    finally:
        context.caller_stack._pop_frame()


"""
__M_BEGIN_METADATA
{"filename": "/home/lemo/Documents/pg_site/themes/kiss/templates/base.mako", "uri": "base.mako", "source_encoding": "utf-8", "line_map": {"16": 0, "28": 1, "29": 7, "30": 7, "31": 8, "32": 8, "33": 9, "34": 9, "35": 10, "36": 11, "37": 12, "38": 13, "39": 14, "40": 15, "41": 16, "42": 17, "45": 16, "46": 17, "47": 17, "48": 18, "49": 19, "50": 21, "51": 21, "52": 21, "53": 25, "54": 25, "55": 26, "56": 27, "57": 28, "58": 29, "59": 30, "60": 31, "61": 32, "62": 33, "63": 34, "64": 35, "65": 36, "66": 37, "67": 38, "68": 39, "69": 40, "70": 41, "71": 42, "72": 43, "73": 44, "76": 43, "77": 44, "78": 44, "79": 45, "80": 45, "81": 46, "82": 46, "83": 47, "84": 47, "85": 48, "86": 48, "87": 49, "88": 49, "89": 51, "90": 51, "91": 52, "92": 52, "93": 54, "94": 55, "95": 55, "96": 55, "97": 56, "98": 56, "99": 59, "100": 59, "101": 59, "102": 68, "103": 68, "108": 69, "109": 71, "110": 71, "111": 83, "112": 83, "113": 88, "114": 88, "120": 69, "131": 120}}
__M_END_METADATA
"""
