defmodule <%= web_module %>.SimpleForm do
  @behaviour Phoenix.SimpleForm.FormInputStyle
  alias Phoenix.SimpleForm.FormInput
  alias Phoenix.SimpleForm.Styles.Bootstrap4

  alias Phoenix.HTML.Form
  alias Phoenix.HTML.Tag

  defdelegate checkbox(form_input), to: Bootstrap4
  # defdelegate date_select(form_input), to: Bootstrap4
  # defdelegate datetime_select(form_input), to: Bootstrap4
  defdelegate email_input(form_input), to: Bootstrap4
  defdelegate number_input(form_input), to: Bootstrap4
  defdelegate select(form_input), to: Bootstrap4
  defdelegate text_input(form_input), to: Bootstrap4
  defdelegate textarea(form_input), to: Bootstrap4

  # wrapper
  defdelegate wrapper(form_input, block), to: Bootstrap4
  defdelegate input_group(form_input, block), to: Bootstrap4
  defdelegate label(form_input), to: Bootstrap4
  defdelegate hint(form_input), to: Bootstrap4
  defdelegate error_tag(form_input), to: Bootstrap4
end
