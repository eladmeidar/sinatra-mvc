require 'sinatra/base'

class FlashObject
  
  VALID_KEYS = [:notice, :message, :error, :warning]
  private 
  attr_accessor :flash_hash
  
  public
  def initialize
    @flash_hash = Hash.new(nil)
  end
  
  def [](flash_key)
    if VALID_KEYS.include?(flash_key)
      @flash_hash[flash_key]
    else
      raise "'#{flash_key}' is not a valid flash key"
    end
  end
  
  def []=(flash_key, value)
    if VALID_KEYS.include?(flash_key)
      @flash_hash[flash_key] = value
    else
      raise "'#{flash_key}' is not a valid flash key"
    end
  end
  
  def clear
    @flash_hash = Hash.new(nil)
  end
  
  def now
    clear
    @flash_hash
  end
  
  def empty?
    @flash_hash.empty?
  end
  
  VALID_KEYS.each do |key|
    define_method("pending_#{key}?") do
      !(@flash_hash[key].nil?)
    end
  end
end

module Sinatra
  module Flash
    
    def flash
      @_flash ||= FlashObject.new
    end
    
    def redirect(uri, *args)
      session[:_flash] = flash unless flash.empty?
      status 302
      response['Location'] = uri
      halt(*args)
    end
    
    def flash_helper(specific_flash_key = nil)
      flash_keys = (specific_flash_key.nil? ? FlashObject::VALID_KEYS : [specific_flash_key.to_sym])
      flash_content = ""
      flash_keys.each do |flash_key|
        if flash.send("pending_#{flash_key}?")
          flash_content += "<div id='flash_#{flash_key}'>#{flash[flash_key]}</div>"
        end
      end
      flash_content
    end
  end
  
  helpers Flash
  
  before do
    @_flash, session[:_flash] = session[:_flash], nil if session[:_flash]
  end

end