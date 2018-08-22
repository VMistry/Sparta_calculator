# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
require 'spec_helper'

describe "Testing the calc engine" do

  before(:all) do
    @calc = CalcEngine.new()
  end

  it "should add two numbers together" do
    expect(@calc.add(1,1)).to eq(2)
  end

  it "should multiple two numbers together" do
    expect(@calc.multiple(2,2)).to eq(4)
  end

  it "should divide two numbers together" do
    expect(@calc.divide(2,2)).to eq(1)
  end

  it "should minus two numbers together" do
    expect(@calc.minus(2,2)).to eq(0)
  end

  it "should minus two numbers together" do
    expect(@calc.operation_selector("-",2,2)).to eq(0)
  end

  it "should add two numbers together" do
    expect(@calc.operation_selector("+",2,2)).to eq(4)
  end

  it "should multiple two numbers together" do
    expect(@calc.operation_selector("*",2,2)).to eq(4)
  end

  it "should divide two numbers together" do
    expect(@calc.operation_selector("/",2,2)).to eq(1)
  end

  it "should return as a float using metic measurements" do
    expect(@calc.metric(50, 1.5)).to be_kind_of(Float)
  end

  it "should return as a float using imperial measurements" do
    expect(@calc.imperial(50, 1.5)).to be_kind_of(Float)
  end

  it "This should return a string once the travel is calculated" do
    expect(@calc.trip_calculator(70, 30, 1.5, 70)).to be_kind_of(String)
  end
end
