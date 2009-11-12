module Sinatra

 module Liquid

  def liquid (template, options={}, locals={})
   render :liquid, template, options, locals
  end

  def render_liquid(template, data, options, locals, &block)
   locals['content'] = block.nil? ? '' : yield
   ::Liquid::Template.parse(data).render(locals)
  end

 end

 helpers Liquid

end
