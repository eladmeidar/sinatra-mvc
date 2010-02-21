module Sinatra

 module Markdown

  def markdown(template, options={}, locals={})
   render :markdown, template, options, locals
  end

  def md(template, options={}, locals={})
   render :markdown, template, options, locals
  end

  def render_markdown(template, data, options, locals, &block)
   RDiscount.new(data).to_html
  end

 end

 helpers Markdown

end
