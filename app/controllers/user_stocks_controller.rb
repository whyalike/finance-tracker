class UserStocksController < ApplicationController
  
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      #If stock can not be found..
      stock = Stock.new_from_lookup(params[:stock_ticker])
      # Then save stock
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
    redirect_to my_portfolio_path
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_id, stock_id: stock.id).first
    @user_stock.destroy
  end
  
end
