class RegistrationsController < Devise::RegistrationsController

def new
    super
end

  def create
    # add custom create logic here
    #super
    @user = User.create(params.require(:user).permit(:name, :username, :email, :password))
    company_name = params[:company]["company"].downcase
    @company = Company.find_by(:name => company_name).nil? ? Company.create(:name=>company_name) : Company.find_by(:name=>company_name)
    @user.company = @company
    @user.save
    flash[:notice] = "Registration Successful."
    render "app/views/devise/sessions/new" 
  end

  def update
    super
  end

end
