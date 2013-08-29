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

  def new
    @tab = Tab.new
    @categories = current_user.categories.all.blank? ? [current_user.categories.create(name: "Default")] :  current_user.categories
  end

  def set_category
    @tab = current_user.tabs.find(params[:id])
    @tab.update_attribute(:category_id, params[:category_id]) if current_user.categories.find(params[:category_id])
    respond_to  do |format|
      format.js{render layout: false}
    end
  end


end

