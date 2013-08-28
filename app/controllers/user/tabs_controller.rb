class User::TabsController < User::BaseController
  def index
    @category = Category.new
    @tab = Tab.new
    @categories = current_user.categories.all.blank? ? [current_user.categories.create(name: "Default")] :  current_user.categories
  end

  def create
    @tab = current_user.tabs.build(params[:tab])
    @tab.save
  end

  def destroy
    @tab = current_user.tabs.find(params[:id])
    @tab.destroy
  end
end

