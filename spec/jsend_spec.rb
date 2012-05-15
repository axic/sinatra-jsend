require 'backports'
require_relative 'spec_helper'
require 'json'

describe Sinatra::JSend do
  before do
    mock_app do
      helpers Sinatra::JSend
      set :json_encoder, JSON

      get '/success' do
        jsend_success({ :post => { :id => 1 } })
      end
      get '/fail' do
        jsend_fail({ :title => "A title is required" })
      end
      get '/error' do
        jsend_error("We have to fail")
      end
      get '/combined' do
        jsend_fail({ :title => "A title is required" }) if params[:title] == nil
        jsend_error("We have to fail") if params[:title] != "correct"
        jsend_success({ :post => { :id => 1 } })
      end
    end
  end

  it "should return success" do
    get '/success'
    body.should == '{"status":"success","data":{"post":{"id":1}}}'
  end

  it "should return failure" do
    get '/fail'
    body.should == '{"status":"fail","data":{"title":"A title is required"}}'
  end

  it "should return error" do
    get '/error'
    body.should == '{"status":"error","message":"We have to fail"}'
  end

  it "should return failure if title is not supplied" do
    get '/combined'
    body.should == '{"status":"fail","data":{"title":"A title is required"}}'
  end

  it "should return error if title is not supported" do
    get '/combined?title=invalid'
    body.should == '{"status":"error","message":"We have to fail"}'
  end

  it "should return success if title is supported" do
    get '/combined?title=correct'
    body.should == '{"status":"success","data":{"post":{"id":1}}}'
  end
end
