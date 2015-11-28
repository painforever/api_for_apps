class Diabetes::RxsController < ApplicationController
  include RxsFuncs
  def index
  	@drugs = get_added_drugs
  end

  def create
  	create_selfadd_drug
  end
end
