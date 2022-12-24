require "application_system_test_case"

class UnitTypesTest < ApplicationSystemTestCase
  setup do
    @unit_type = unit_types(:one)
  end

  test "visiting the index" do
    visit unit_types_url
    assert_selector "h1", text: "Unit types"
  end

  test "should create unit type" do
    visit unit_types_url
    click_on "New unit type"

    fill_in "Name", with: @unit_type.name
    click_on "Create Unit type"

    assert_text "Unit type was successfully created"
    click_on "Back"
  end

  test "should update Unit type" do
    visit unit_type_url(@unit_type)
    click_on "Edit this unit type", match: :first

    fill_in "Name", with: @unit_type.name
    click_on "Update Unit type"

    assert_text "Unit type was successfully updated"
    click_on "Back"
  end

  test "should destroy Unit type" do
    visit unit_type_url(@unit_type)
    click_on "Destroy this unit type", match: :first

    assert_text "Unit type was successfully destroyed"
  end
end
