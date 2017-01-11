
#################################################
#                 ROUTING                       #
#################################################

activate :directory_indexes

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

page '/pages/*.md', layout: "layout"
page "reference/*", layout: :toc_layout

#################################################
#                 HELPERS                       #
#################################################

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

#################################################
#                 CONFIGURATION                 #
#################################################


configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
