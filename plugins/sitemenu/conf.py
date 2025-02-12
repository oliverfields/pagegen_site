conf = {
    'menu': {
        '/quick-start': 'Quick start',

        'Manual': {
            'Core': {
                '/manual/core/command': 'Command usage',
                    bash completion
                    vim extras
                '/manual/core/pages': 'Pages',
                    headers
                        render
                    body
                    render (page.out)
                '/manualsite.conf
                    walkthru of settings
                site structure
                    content
                    build
                    assets
                    themes
                    plugins
                    .pgn_lock
            Plugins
                Built in
                    excerpt
                    mako_templates
                    minify
                    pgn_markdown
                    rss
                    rss_feed
                    shortcodes
                    sitemap
                    tags
                Developing plugins
                    Build cycle
                        Site.Index
                        Hooks
                            site and page objects
                    Example plugin


        'Manual': {
            'Content management': {
                '/manual/content-management/page-markup': 'Page markup'
             },
            '/manual/installation': 'Installation',
            'Design and layout': {
                '/manual/design-and-layout/templates-and-themes': 'Templates and themes'
            },
            '/manual/shortcodes': 'Shortcodes',
        },
        'Articles': {
            '/articles/pipleline-with-github-actions': 'Pipeline with Github Actions'
        }
    },
    'ignore': [
        '/index',
        '/404',
        '/manual/installation',
        '/manual/shortcodes',
        '/quick-start',
        '/articles/pipleline-with-github-actions'
    ]
}
