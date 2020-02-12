require 'erb'

class Controller
  TEMPLATE = File.read('page.html.erb')

  def initialize
    @user = 'Sarah'
    @messages = [
      {title: 'Hello!'},
      {title: 'Goodbye!'}
    ]
  end

  def render
    ERB.new(TEMPLATE).result(binding)
  end
end

# run line below in terminal to puts the html
# ruby -r ./controller.rb -e 'puts Controller.new.render' 

# Model - View - Controller
# new(form) create(submit) delete show index edit update
# controller --> 
  # class UsersController
    # def new

    # end
    # def create

    # end
    # def show

    # end
# view --> users/new.html.erb, users/create.html.erb, users/show.html.erb
# model --> database connections
  # class User <
  #   whatever is special. Keeping information. Validation
  #   name
  #   email