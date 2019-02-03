defmodule Phoenix.SimpleForm.TypeDetector do
  @moduledoc """
  The TypeDetector tries to to detect
  the type (e.g. text_field, textarea, select)
  based on the type from the ecto model oder
  params passed to it.

  Examples:
  input(f, :descripton, rows: 10) # is likely a textarea
  input(f, :state, collection: [...]) # is likely a select box
  """

  @doc """

  Detects the type of a input based on the ecto schema.

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :string}}), :name)
  :text_input

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :integer}}), :name)
  :number_input

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :boolean}}), :name)
  :checkbox

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :date}}), :name)
  :date_select

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :time}}), :name)
  :time_select

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :utc_datetime}}), :name)
  :datetime_select

  The use of the `rows` option results in `:textarea`

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :string}}), :name, rows: 10)
  :textarea

  The use of the `collection` option results in `:select`

  iex> get_input_type(Phoenix.SimpleForm.Factory.build(:form, source: %{types: %{name: :string}}), :name, collection: ["A"])
  :select
  """
  def get_input_type(form, field, opts \\ []) do
    from_parameters(opts) || Phoenix.HTML.Form.input_type(form, field)
  end

  defp from_parameters(opts) do
    cond do
      opts[:rows] -> :textarea
      opts[:collection] -> :select
      true -> nil
    end
  end
end
