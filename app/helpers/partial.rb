
module Sinatra
  
  module Partials
    
    def partial(template, *args)
      
      tmp = template.to_s.split('/')
      template = tmp[0..-2].join('/') + "/_#{tmp[-1]}"
      options = args.last.is_a?(Hash) ? args.pop : {}
      options.merge!(:layout => false)
      if options[:render].nil?
        erb(:"#{template}", options)
      else
        render_engine = options[:render]
        options.delete :render
        instance_eval("#{render_engine}(:\"#{template}\",options)")
      end

    end    

  end
  
  helpers Partials

end