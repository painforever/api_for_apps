class Diabetes::RxsController < ApplicationController
  include RxsFuncs
  def index
  	@drugs = get_added_drugs
  end
end
