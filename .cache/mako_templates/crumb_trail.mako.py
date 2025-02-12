# -*- coding:utf-8 -*-
from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
STOP_RENDERING = runtime.STOP_RENDERING
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 10
_modified_time = 1739387128.1065114
_enable_loop = True
_template_filename = '/home/lemo/Documents/pg_site/themes/kiss/templates/crumb_trail.mako'
_template_uri = 'crumb_trail.mako'
_source_encoding = 'utf-8'
_exports = []


def render_body(context,page,site,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(site=site,page=page,pageargs=pageargs)
        len = context.get('len', UNDEFINED)
        range = context.get('range', UNDEFINED)
        __M_writer = context.writer()
        __M_writer('\n')

        from os.path import sep, join, isfile, isdir
        from configparser import NoOptionError
        
        try:
            dir_index = site.conf.get('site', 'directory_index')
        except NoOptionError:
            dir_index = 'index.html'
        
        try:
            crumb_home_title = site.conf.get('site', 'home_title')
        except NoOptionError:
            crumb_home_title = 'Home'
        
        path_parts = page.source_path[len(site.content_dir):].split(sep)
        
        crumbs = ''
        
        path_parts = path_parts[1:len(path_parts)]
        
        if page.source_path.endswith(sep + dir_index):
            path_parts = path_parts[0:len(path_parts) - 2]
        else:
            path_parts = path_parts[0:len(path_parts) - 1]
        
        if page.source_path != join(site.content_dir, dir_index):
        
            for i in range(0, len(path_parts)):
                maybe_index = join(site.content_dir, sep.join(path_parts), dir_index)
        
                if isfile(maybe_index):
                    p = site.index[maybe_index]
                    crumbs = f'<li><a href="{p.relative_url}">{p.headers["title"]}</a></li>{crumbs}'
        
                path_parts.pop()
        
            crumbs = f'<ol><li><a href="/">{crumb_home_title}</a></li>{crumbs}</ol>'
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['crumb_home_title','i','maybe_index','isdir','sep','path_parts','isfile','dir_index','crumbs','NoOptionError','p','join'] if __M_key in __M_locals_builtin_stored]))
        __M_writer('\n')
        __M_writer(str(crumbs))
        __M_writer('\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


"""
__M_BEGIN_METADATA
{"filename": "/home/lemo/Documents/pg_site/themes/kiss/templates/crumb_trail.mako", "uri": "crumb_trail.mako", "source_encoding": "utf-8", "line_map": {"16": 1, "23": 1, "24": 2, "25": 3, "26": 4, "27": 5, "28": 6, "29": 7, "30": 8, "31": 9, "32": 10, "33": 11, "34": 12, "35": 13, "36": 14, "37": 15, "38": 16, "39": 17, "40": 18, "41": 19, "42": 20, "43": 21, "44": 22, "45": 23, "46": 24, "47": 25, "48": 26, "49": 27, "50": 28, "51": 29, "52": 30, "53": 31, "54": 32, "55": 33, "56": 34, "57": 35, "58": 36, "59": 37, "60": 38, "61": 39, "62": 40, "65": 39, "66": 40, "67": 40, "73": 67}}
__M_END_METADATA
"""
