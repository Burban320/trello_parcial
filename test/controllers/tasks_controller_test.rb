require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get redirected to login page when try to get new page and is not logged in" do
    get :new
    
    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should get new page when logged in" do
    sign_in authors(:one)
    get :new
    
    assert_response :success
  end

  test "should get redirected to login page when try to create a task and is not logged in" do
    post :create, task: {title: "Funciona!"}
    
    assert_response :redirect
    assert_redirected_to new_author_session_path
  end


  test "should create task when logged in" do
    sign_in authors(:one)
    
    assert_difference('Task.count') do
      post :create, task: { author_id: @task.author_id, description: @task.description, end_date: @task.end_date, title: @task.title }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get redirected to login page when try to get edit page and is not logged in" do
    get :edit, id:@task

    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should get edit page when logged in" do
    sign_in authors(:one)

    get :edit, id:@task

    assert_response :success
  end

  test "should get redirected to login page when try to update a post and is not logged in" do
    put :update, id: @task, task: { title: "Hello World" }

    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should update post when logged in" do
    sign_in authors(:one)

    put :update, id: @task, task: { title: @task.title, author_id: @task.author_id }

    assert_redirected_to task_path(assigns(:task))
  end

  test "should get redirected to login page when try to destroy a post and is not logged in" do
    delete :destroy, id: @task

    assert_response :redirect
    assert_redirected_to new_author_session_path
  end

  test "should destroy post when logged in" do
    sign_in authors(:one)

    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
