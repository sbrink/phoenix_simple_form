defmodule Phoenix.SimpleForm do
  @moduledoc """
  Documentation for SimpleForm.
  """
  alias Phoenix.SimpleForm.FormInput
  alias Phoenix.SimpleForm.TypeDetector

  def input(form, field, opts \\ []) do
    {input_type, opts} = Keyword.pop(opts, :as, TypeDetector.get_input_type(form, field, opts))
    {style_module, opts} = get_style_module(opts)
    {translate_fn, opts} = get_translate_fn(opts)

    input_opts = FormInput.build(form, field, opts, translate_fn, style_module)

    Code.ensure_loaded(style_module)

    if function_exported?(style_module, input_type, 1) do
      apply(style_module, input_type, [input_opts])
    else
      raise "Input not defined #{input_type}"
    end
  end

  defp get_style_module(opts) do
    {opts_style, opts} = Keyword.pop(opts, :_style)
    app_style = Application.get_env(:phoenix_simple_form, :style)
    {opts_style || app_style || raise("Please set a style for phoenix_simple_form"), opts}
  end

  defp get_translate_fn(opts) do
    {opts_translate_fn, opts} = Keyword.pop(opts, :_translate_error_fn)
    app_translate = Application.get_env(:phoenix_simple_form, :translate_error_fn)
    {opts_translate_fn || app_translate || raise("Please set a translate function for simple_form"), opts}
  end
end
