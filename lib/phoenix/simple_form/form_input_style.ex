defmodule Phoenix.SimpleForm.FormInputStyle do
  @moduledoc """

  Behaviour that defines the structure of a style adapter.

  """
  @callback checkbox(SimpleForm.FormInput.t()) :: tuple
  @callback date_select(SimpleForm.FormInput.t()) :: tuple
  @callback datetime_select(SimpleForm.FormInput.t()) :: tuple
  @callback number_input(SimpleForm.FormInput.t()) :: tuple
  @callback email_input(SimpleForm.FormInput.t()) :: tuple
  # @callback radio_buttons(SimpleForm.FormInput.t) :: tuple
  @callback select(SimpleForm.FormInput.t()) :: tuple
  @callback text_input(SimpleForm.FormInput.t()) :: tuple
  @callback textarea(SimpleForm.FormInput.t()) :: tuple
  # @callback time_select(SimpleForm.FormInput.t) :: tuple
end
