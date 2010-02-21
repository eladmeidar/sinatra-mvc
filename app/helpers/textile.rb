module Sinatra

 module Textile

  def textile(template, options={}, locals={})
   render :textile, template, options, locals
  end

  def tx(template, options={}, locals={})
   render :textile, template, options, locals
  end

  def render_textile(template, data, options, locals, &block)
   RedCloth.new(data).to_html
  end

 end

 helpers Textile

end
