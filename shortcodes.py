def figure(page, caption, alternative_text, src_path):

	if page.markup == 'rst':
		html_prefix = '.. raw:: html\n\n\t'
		indent = '\t'
	else: # Markdown
		html_prefix = ''
		indent = ''

	html = html_prefix + '<figure>\n'
	html += indent + '<img src="' + src_path + '" alt="' + alternative_text + '">\n'
	html += indent + '<figcaption>' + caption + '</figcaption>\n'
	html += indent + '</figure>\n'

	return html
