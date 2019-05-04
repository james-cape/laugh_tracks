class ComediansController < ApplicationController
  def index
    if params[:age] == nil
      @comedians     = Comedian.all
      @unique_cities = @comedians.map { |comedian| comedian.birthplace}.uniq
      @unique_ages   = @comedians.map { |comedian| comedian.age}.uniq.sort
      @average_age   = @comedians.sum { |comedian| comedian.age} / @comedians.length
    else
      @comedians     = Comedian.filter_by_age(params[:age])
      @unique_cities = @comedians.map { |comedian| comedian.birthplace}.uniq
      @unique_ages   = @comedians.map { |comedian| comedian.age}.uniq.sort
      @average_age   = @comedians.sum { |comedian| comedian.age} / @comedians.length
    end
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(comedian_params)
    @comedian.save
    redirect_to comedians_path
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace)
  end

end
