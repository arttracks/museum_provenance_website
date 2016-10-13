###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

page '/pages/*.md', layout: "layout"


activate :directory_indexes

# With alternative layout
page "reference/*", layout: :toc_layout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

activate :syntax

helpers do
  def custom_render(source)
    Tilt['markdown'].new {source}.render
  end

  def generate_toc(file, context)
    base_md = File.read(file)
    Middleman::Renderers::MiddlemanKramdownHTML.scope = context
    doc = Kramdown::Document.new("BEGIN\n\n* replace_me\n{:toc}\n\nEND\n\n#{base_md}")
    text, warnings = Middleman::Renderers::MiddlemanKramdownHTML.convert(doc.root,doc.options)
    regex = /BEGIN(.*)END/m
    toc = text.match(regex)[1]
    text.gsub!(regex,"") 
    [toc,text]
  end
end
# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
