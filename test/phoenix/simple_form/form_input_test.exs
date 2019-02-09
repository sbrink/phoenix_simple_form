defmodule Phoenix.SimpleForm.FormInputTest do
  use ExUnit.Case
  import Phoenix.SimpleForm.FormInput
  doctest Phoenix.SimpleForm.FormInput

  describe "form_input" do
    test "takes a form and generates input opts" do
      input_opts =
        build(
          Phoenix.SimpleForm.Factory.build(:form),
          :name,
          [],
          fn x -> x end,
          Phoenix.SimpleForm.Styles.Bootstrap4
        )

      assert input_opts == Phoenix.SimpleForm.Factory.build(:form_input)
    end

    test "detect required state from ecto schema." do
      input_opts_with_required =
        build(
          Phoenix.SimpleForm.Factory.build(:form, source: %{required: [:name], types: %{name: :string}, validations: []}),
          :name,
          [],
          fn x -> x end,
          Phoenix.SimpleForm.Styles.Bootstrap4
        )

      input_opts_without_required =
        build(
          Phoenix.SimpleForm.Factory.build(:form, source: %{required: [], types: %{name: :string}, validations: []}),
          :name,
          [],
          fn x -> x end,
          Phoenix.SimpleForm.Styles.Bootstrap4
        )

      assert input_opts_with_required.required == true
      assert input_opts_without_required.required == false
    end
  end
end
