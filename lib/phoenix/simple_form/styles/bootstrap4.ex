defmodule Phoenix.SimpleForm.Styles.Bootstrap4 do
  @moduledoc """

  FormInputStyle implementation for Bootstrap 4 Forms.

  """

  @behaviour Phoenix.SimpleForm.FormInputStyle
  alias Phoenix.HTML
  alias Phoenix.HTML.Form
  alias Phoenix.HTML.Tag

  alias Phoenix.SimpleForm.FormInput

  @doc """
  Renders an checkbox input for a form input.

  iex> checkbox(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-check"><input name="name" type="hidden" value="false"><input class="form-check-input" id="name" name="name" type="checkbox" value="true"><label class="control-label" for="name">Name</label></div>)

  You can overwrite the input attributes

  iex> checkbox(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-check"><input name="name" type="hidden" value="false"><input class="A" id="name" name="name" type="checkbox" value="true"><label class="control-label" for="name">Name</label></div>)

  """
  def checkbox(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    Tag.content_tag :div, class: "form-check" do
      [
        Form.checkbox(form, field, Keyword.merge([class: "form-check-input"], input_attrs)),
        style_module.label(form_input),
        style_module.hint(form_input),
        style_module.error_tag(form_input)
      ]
    end
  end

  @doc """
  Renders an date input for a form input.

  iex> date_select(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="text"></div>)

  You can overwrite the input attributes

  iex> date_select(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="A" id="name" name="name" type="text" value="someValue"></div>)

  """
  def date_select(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.text_input(form, field, Keyword.merge([class: "form-control"], input_attrs))
    end
  end

  @doc """
  Renders an datetime input for a form input.

  iex> datetime_select(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="text"></div>)

  You can overwrite the input attributes

  iex> datetime_select(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="A" id="name" name="name" type="text" value="someValue"></div>)

  """
  def datetime_select(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.text_input(form, field, Keyword.merge([class: "form-control"], input_attrs))
    end
  end

  @doc """
  Renders an number input for a form input.

  iex> number_input(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="number"></div>)

  You can overwrite the input attributes

  iex> number_input(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="A" id="name" name="name" type="number" value="someValue"></div>)

  """
  def number_input(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.number_input(form, field, Keyword.merge([class: "form-control"], input_attrs))
    end
  end

  @doc """
  Renders an input field with `type="text"`.

  iex> text_input(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: nil}}, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="text"></div>)

  iex> text_input(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="text" value="someValue"></div>)

  iex> text_input(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="A" id="name" name="name" type="text" value="someValue"></div>)

  """
  def text_input(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.text_input(form, field, Keyword.merge([class: "form-control"], input_attrs))
    end
  end

  @doc """
  Renders an email tag for a form input.

  Creates a select for every binary value in the collection array.

  iex> email_input(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="email"></div>)

  You can overwrite the input attributes

  iex> email_input(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="A" id="name" name="name" type="email" value="someValue"></div>)

  """
  def email_input(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.email_input(form, field, Keyword.merge([class: "form-control"], input_attrs))
    end
  end

  @doc """
  Renders an select tag for a form input.

  Creates a select for every binary value in the collection array.

  iex> textarea(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><textarea class="form-control" id="name" name="name">\n</textarea></div>)

  You can overwrite the input attributes

  iex> textarea(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A",rows: 9], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><textarea class="A" id="name" name="name" rows="9">\nsomeValue</textarea></div>)

  """
  def textarea(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.textarea(form, field, Keyword.merge([class: "form-control"], input_attrs))
    end
  end

  @doc """
  Renders an select tag for a form input.

  Creates a select for every binary value in the collection array.

  iex> plain(Factory.build(:form_input, style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control-plaintext" id="name" name="name" type="text" readonly></div>)

  You can overwrite the input attributes

  iex> plain(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: "someValue"}}, input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="A" id="name" name="name" type="text" value="someValue" readonly></div>)

  """
  def plain(%FormInput{form: form, field: field, input_attrs: input_attrs, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.text_input(form, field, Keyword.merge([class: "form-control-plaintext", readonly: true], input_attrs))
    end
  end

  @doc """
  Renders an select tag for a form input.

  Creates a select for every binary value in the collection array.

  iex> select(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: ""}}, collection: ["A","B","C"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><select class="form-control c-select" id="name" name="name"><option value="A">A</option><option value="B">B</option><option value="C">C</option></select></div>)

  With a list of tupels the name and value of each select can be set individually.

  iex> select(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: ""}}, collection: [{"A", "1"},{"B", "2"},{"C", "3"}], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><select class="form-control c-select" id="name" name="name"><option value="1">A</option><option value="2">B</option><option value="3">C</option></select></div>)

  You can overwrite the input attributes

  iex> select(Factory.build(:form_input, form: %Phoenix.HTML.Form{data: %{name: ""}}, collection: [{"A", "1"},{"B", "2"},{"C", "3"}], input_attrs: [class: "A"], style_module: Bootstrap4)) |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Name</label><select class="A" id="name" name="name"><option value="1">A</option><option value="2">B</option><option value="3">C</option></select></div>)

  """
  def select(%FormInput{form: form, field: field, input_attrs: input_attrs, collection: collection, style_module: style_module} = form_input) do
    style_module.wrapper form_input do
      Form.select(
        form,
        field,
        collection,
        Keyword.merge([class: "form-control c-select"], input_attrs)
      )
    end
  end

  @doc """
  Renders an debug tag for a form input.

  iex> debug(%FormInput{}) |> safe_to_string()
  ~s(<pre>#{%FormInput{} |> inspect(pretty: true)}</pre>)

  """
  def debug(%FormInput{} = form_opts) do
    Tag.content_tag(:pre, inspect(form_opts, pretty: true))
  end

  @doc """
  Renders a wrapper with label, input group hint an error.
  The inner block is rendered into the input group.

  iex>wrapper(Factory.build(:form_input, label: "Label", style_module: Bootstrap4), do: "#Inner Block#") |> safe_to_string()
  ~s(<div class="form-group"><label class="control-label" for="name">Label</label>#Inner Block#</div>)
  """
  def wrapper(%FormInput{style_module: style_module} = form_input, do: block) do
    Tag.content_tag :div, class: "form-group" do
      [
        style_module.label(form_input),
        style_module.input_group(form_input, block),
        style_module.hint(form_input),
        style_module.error_tag(form_input)
      ]
    end
  end

  @doc """
  Renders a input group

  Without any special attribute the function renders just the inner block.

  iex> input_group(Factory.build(:form_input, style_module: Bootstrap4), ~s(<div>Inner Block</div>))
  ~s(<div>Inner Block</div>)


  With `:prepend_text` you're able to prepend some text for the input group.

  iex> input_group(Factory.build(:form_input, wrapper_attrs: [prepend_text: "Some Test"], style_module: Bootstrap4), "#Inner Block#") |> safe_to_string()
  ~s(<div class="input-group"><div class="input-group-prepend"><span class="input-group-text">Some Test</span></div>#Inner Block#</div>)

  With `:append_text` you're able to append some text for the input group.

  iex> input_group(Factory.build(:form_input, style_module: Bootstrap4, wrapper_attrs: [append_text: "Some Test"]), "#Inner Block#") |> safe_to_string()
  ~s(<div class="input-group">#Inner Block#<div class="input-group-append"><span class="input-group-text">Some Test</span></div></div>)
  """
  def input_group(%FormInput{style_module: _style_module, wrapper_attrs: wrapper_attrs} = _form_input, block) do
    prepend_text_block =
      if prepend_text = Keyword.get(wrapper_attrs, :prepend_text) do
        Tag.content_tag :div, class: "input-group-prepend" do
          Tag.content_tag(:span, prepend_text, class: "input-group-text")
        end
      else
        HTML.raw("")
      end

    append_text_block =
      if append_text = Keyword.get(wrapper_attrs, :append_text) do
        Tag.content_tag :div, class: "input-group-append" do
          Tag.content_tag(:span, append_text, class: "input-group-text")
        end
      else
        HTML.raw("")
      end

    if prepend_text || append_text do
      Tag.content_tag :div, class: "input-group" do
        [
          prepend_text_block,
          block,
          append_text_block
        ]
      end
    else
      block
    end
  end

  @doc """
  Renders an label tag for a form input.

  iex> label(%FormInput{label: false}) |> safe_to_string()
  ""

  iex> label(Factory.build(:form_input, style_module: Bootstrap4, required: true)) |> safe_to_string()
  ~s(<label class="control-label required" for="name">Name</label>)

  iex> label(Factory.build(:form_input, style_module: Bootstrap4, required: true, label_attrs: [class: "A", disabled: "true"])) |> safe_to_string()
  ~s(<label class="A" disabled="true" for="name">Name</label>)

  iex> label(Factory.build(:form_input)) |> safe_to_string()
  ~s(<label class="control-label" for="name">Name</label>)

  iex> label(Factory.build(:form_input, label_attrs: [class: "A", disabled: "true"])) |> safe_to_string()
  ~s(<label class="A" disabled="true" for="name">Name</label>)

  """
  def label(%FormInput{label: false}), do: HTML.raw("")

  def label(%FormInput{form: form, field: field, label: label, label_attrs: label_attrs, required: true}) do
    Form.label(form, field, label, Keyword.merge([class: "control-label required"], label_attrs))
  end

  def label(%FormInput{form: form, field: field, label: label, label_attrs: label_attrs}) do
    Form.label(form, field, label, Keyword.merge([class: "control-label"], label_attrs))
  end

  @doc """
  Renders an hint tag for a form input.

  iex> hint(Factory.build(:form_input, hint: nil)) |> safe_to_string()
  ""

  iex> hint(Factory.build(:form_input, hint: "This is a hint")) |> safe_to_string()
  ~s(<small class="text-muted">This is a hint</small>)

  """
  def hint(%FormInput{hint: nil}), do: HTML.raw("")

  def hint(%FormInput{hint: hint}) do
    Tag.content_tag(:small, hint, class: "text-muted")
  end

  @doc """
  Renders an error tag for a form input.

  iex> error_tag(Factory.build(:form_input, errors_translated: [])) |> safe_to_string()
  ""

  iex> error_tag(Factory.build(:form_input, errors_translated: ["Some Error"])) |> safe_to_string()
  ~s(<span class="help-block text-danger">⚠ Some Error</span>)

  """
  def error_tag(%FormInput{errors_translated: []}), do: HTML.raw("")

  def error_tag(%FormInput{errors_translated: errors_translated}) do
    Tag.content_tag(:span, "⚠ #{errors_translated}", class: "help-block text-danger")
  end
end
