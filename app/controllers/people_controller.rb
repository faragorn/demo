class PeopleController < ApplicationController
  def new
    if current_user && current_user.person == nil
      @person = Person.new
    else
      redirect_to :sign_in
    end
  end

  def create
    @person = Person.new(params[:person])

    if @person.valid?
      current_user.person = @person
      current_user.save
      flash[:notice] = "Thank you for completing your registration!"
      redirect_to :root
    else
      render :action => 'new'
    end
  end
end