class User::CategoriesController < User::BaseController
  before_filter :find_catergory, except: [:create]
  def create
    @category = current_user.categories.build(params[:category])
    @category.save
  end

  def recolor
  	@category.recolor(params[:color])
  end

  def destroy
  	@category.destroy
  end

  private
  def find_catergory
  	@category = current_user.categories.find(params[:id])
  end
end

