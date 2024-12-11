class DietRailsController < ApplicationController

  def show_doc
    @body_layout = "layout_a"
  end

  def base_styles
    @body_layout = "layout_a"
  end

  def demo 
    @user = User.first
    @categories = @user.categories.not_draft
  end

  def new_category
    sleep(0.2)
    @category = Category.new(
      is_draft: true,
      user_id: User.first.id
    )
    @category.save
    redirect_to diet_rails_demo_path
  end

  def delete_category
    sleep(0.2)
    @user = User.first
    @categories = @user.categories.not_draft
    @category = Category.find(params[:category_id])
    @category.destroy
    render template: "diet_rails/demo"
  end

  def demo_update
    sleep(0.2)
    @user = User.first
    @user.update(user_params)
    @categories = @user.categories.not_draft
    flash[:toasts] = [
      { title: 'Categories Updated', message: 'Your categories have been successfully created.', style: "success" }
    ]
    redirect_to diet_rails_demo_path
  end

  def user_params
    params.require(:user).permit(:categories_attributes => [:id, :title, :description])
  end
  
end