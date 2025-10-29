class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def hello
    #we must render a template, can be done here but it shouldn't. should go to views folder
    render html: "Hello World!"
  end 
end
