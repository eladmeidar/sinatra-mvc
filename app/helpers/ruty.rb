module Sinatra

 module Ruty

  def ruty(template, options={}, locals={})
   render :ruty, template, options, locals
  end

  def render_ruty(template, data, options, locals, &block)
   locals['content'] = block.nil? ? '' : yield
   ::Ruty::Template.new(data).render(locals)
  end

 end

 helpers Liquid

end
