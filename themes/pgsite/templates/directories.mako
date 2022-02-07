<%inherit file="base.mako"/>

<%block name="content">
	<ul>
	% for c in page.children:
		<li><a href="${c.url_path}">${c.title}</a></li>
	% endfor
	</ul>
</%block>

