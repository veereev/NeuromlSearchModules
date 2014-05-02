require File.expand_path('../../test_helper', __FILE__)
require 'welcome_controller'

class WelcomeController; def rescue_action(e) raise e end; end
#class WelcomeControllerTest < Test::Unit::TestCase
class WelcomeControllerTest < ActionController::TestCase
#fixtures :search
  def setup
    User.current = nil

@controller=WelcomeController.new
@request=ActionController::TestRequest.new
@response=ActionController::TestResponse.new

  end

def test_one
get :search_process, :q => 'purkinje'
resultsCount=assigns(:model_ids)
assert_equal 14,resultsCount.size
assert_response :success
assert_template "keyword_results_list"
end

def test_two
get :search_process, :q => 'golgi'
resultsCount=assigns(:model_ids)
assert_equal 18,resultsCount.size
assert_response :success
assert_template "keyword_results_list"
end



end
