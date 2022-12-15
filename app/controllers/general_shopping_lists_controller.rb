class GeneralShoppingListsController < ApplicationController
  def general
    @general_shopping_lists = current_user.foods
  end
end
