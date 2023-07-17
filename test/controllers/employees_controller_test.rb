require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/employees.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Employee.count, data.length
  end

  test "show" do
    get "/employees/#{Employee.first.id}.json"
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal ["id", "first_name", "last_name", "email", "phone", "job_title", "department_id", "created_at", "updated_at", "department"], data.keys
  end

  test "create" do
    assert_difference "Employee.count", 1 do
      post "/employees.json", params: { first_name: "Dale", last_name: "Carnegie", email: "whatever@whatever.com", job_title: "ditchdigger", department_id: Department.first.id, phone: "1111111111", department: "engineering" }
      assert_response 200
    end
  end

  test "update" do
    employee_id = Employee.first.id
    patch "/employees/#{employee_id}", params: { first_name: "Amanda", department_id: "invalid_department_id" }
    assert_response 422
    data = JSON.parse(response.body)
    assert_equal ["Department must exist"], data["errors"]
  end
end  
