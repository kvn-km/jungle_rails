class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV["NAME"], password: ENV["PASSWORD"]

def index
  @sales = Sale.all
end


end
