from os.path import isfile
from pagegen.utility import appropriate_markup, DIRDEFAULTFILE


def source_link(site, page):
	''' Return link to source file, if it exists '''

	if isfile(page.target_path + '.txt'):

		url = page.url_path

		if url.endswith('/'):
			url += DIRDEFAULTFILE

		html = '<br /><a href="' + url + '.txt" title="Page source" target="_blank"><i class="fas code-999999"></i></a>'
	else:
		html = ''

	return html


def list_shortcodes(site, page):
	''' List built-in shortcodes '''

	sc_built_in_whitelist = [
		'figure',
		'image',
		'integrity_hash',
		'menu',
		'page_url',
		'youtube',
		'more',
		'list_authors',
		'gravatar',
		'list_posts'
	]

	scs = site.shortcodes.__repr__()

	html = '<ul>'

	for sc in scs.splitlines():
		for bsc in sc_built_in_whitelist:
			if sc.startswith(bsc + '('):
				html += '<li><code>' + sc + '</code></li>'
				break

	html += '</ul>'

	return appropriate_markup(page, html)
