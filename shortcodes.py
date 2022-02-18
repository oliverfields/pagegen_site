from os.path import isfile
from pagegen.utility import appropriate_markup, DIRDEFAULTFILE


def source_link(page):
	''' Return link to source file, if it exists '''

	if isfile(page.target_path + '.txt'):

		url = page.url_path

		if url.endswith('/'):
			url += DIRDEFAULTFILE

		html = '<br /><a href="' + url + '.txt" title="Page source" target="_blank"><i class="fas code-999999"></i></a>'
	else:
		html = ''

	return html
