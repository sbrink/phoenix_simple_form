defmodule Phoenix.SimpleForm.Factory do
  @moduledoc """
  Factories used for ex_machina.
  """
  use ExMachina

  def form_input_factory do
    %Phoenix.SimpleForm.FormInput{
      clean_opts: [],
      collection: nil,
      errors: [],
      errors_translated: [],
      field: :name,
      field_str: "name",
      form: build(:form),
      hint: nil,
      input_attrs: [],
      label: "Name",
      label_attrs: [],
      label_human: "Name",
      label_translated: nil,
      opts: [],
      required: false,
      style_module: Phoenix.SimpleForm.Styles.Bootstrap4,
      wrapper_attrs: []
    }
  end

  def form_factory do
    %Phoenix.HTML.Form{
      action: nil,
      data: nil,
      errors: [],
      hidden: [],
      id: nil,
      impl: Phoenix.HTML.FormData.Ecto.Changeset,
      index: nil,
      name: nil,
      options: [],
      params: %{},
      source: %{
        types: %{name: :string},
        required: [],
        validations: [],
        changes: %{},
        data: %{}
      }
    }
  end
end
