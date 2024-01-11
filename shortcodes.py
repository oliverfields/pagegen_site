from os.path import isfile
from pagegen.utility import appropriate_markup, write_file
from pagegen.constants import DIRDEFAULTFILE
from urllib.parse import urlparse
from shutil import copyfile


def source_link(site, page):
	"""Copy source file and generate link to it. The actual source files are copied using post_generate_page hook"""

	html = ''

	if page.headers['menu exclude'] == False or 'home page' in page.custom_headers.keys():
		url = page.url_path

		if url.endswith('/'):
			url += DIRDEFAULTFILE

		html = '<br /><a href="' + url + '.txt" title="Page source" target="_blank"><i class="fas code-999999"></i></a>'

	return html


def figure(site, page, caption, alternative_text, src_path):
	"""Make html figure"""

	html = '<figure>\n'
	html += '<img src="' + src_path + '" alt="' + alternative_text + '">\n'
	html += '<figcaption>' + caption + '</figcaption>\n'
	html += '</figure>\n'

	return appropriate_markup(page, html)


def list_shortcodes(site, page):
	"""List built-in shortcodes"""

	sc_built_in_whitelist = [
		'image',
		'menu',
		'page_url',
		'list_authors',
		'list_posts',
		'tags',
		'categories',
	]

	scs = site.shortcodes.__repr__()

	html = '<table><tr><th>Shortcode name</th><th>Description</th></tr>'

	for sc in scs.splitlines():
		for bsc in sc_built_in_whitelist:
			if sc.startswith(bsc + '('):
				html += '<tr><td>' + sc + '</td><td>' + site.shortcodes[bsc].__doc__ + '</td></tr>'
				break

	html += '</table>'

	return appropriate_markup(page, html)


def series_navigation(site, page):
	"""Navigation for series (related pages/blog posts)"""

	if not page.headers['series']:
		return ''

	series_id = page.headers['series']

	# Check if we have series html cached
	if 'series' in site.shortcodes.cache.keys() and series_id in site.shortcodes.cache['series'].keys():
		html = site.shortcodes.cache['series'][series_id]
	else:
		html = ''

		# Find other pages in series
		sorted_posts = sorted(site.page_list, key=lambda d: d.headers['publish'])

		for p in sorted_posts:
			if p.headers['series'] == series_id:
				html += '<li><a href="' + p.url_path + '">' + p.title + '</a></li>'

		html = '<ol>' + html + '</ol>'

		# Cache html for use by other pages in series
		site.shortcodes.cache['series'] = { series_id: html }

	return appropriate_markup(page, html)


def social_links(site, page, **links):
	"""List social links, try to guess font awesome icon to use with each link.
		Example:
			<sc>social_links(Facebook='https://www.facebook.com/oliverjfields', Github='https://github.com/olvfie')</sc>

		Requires font-awesome link in html, e.g. 
    		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/brands.min.css" integrity="sha512-OivR4OdSsE1onDm/i3J3Hpsm5GmOVvr9r49K3jJ0dnsxVzZgaOJ5MfxEAxCyGrzWozL9uJGKz6un3A7L+redIQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	"""

	html = '<ul>'

	domain_icon_map = {
		'facebook.com': 'fa-facebook-f',
		'twitter.com': 'fa-twitter',
		#'linkedin.com': 'fa-linkedin-in',
		'github.com': 'fa-github',
		'instagram.com': 'fa-instagram',
	}

	for name, link in links.items():
		try:
			pl = urlparse(link)
			domain = pl.hostname.lower()
			domain = domain.replace('www.', '')
			if domain in domain_icon_map.keys():
				icon = '<i class="fa-brands ' + domain_icon_map[domain] + '"></i> '
			else:
				icon = ''
		except:
			icon = ''

		html += '<li><a href="' + link + '">' + icon + name + '</a></li>' 

	return appropriate_markup(page, html + '</ul>')

