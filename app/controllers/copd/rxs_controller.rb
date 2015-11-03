class Copd::RxsController < ApplicationController
  include RxsFuncs
  def index
    @added_drugs = get_added_drugs
  end

  def create
    create_selfadd_drug
  end
end
