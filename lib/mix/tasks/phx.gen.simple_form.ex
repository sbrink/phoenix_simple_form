defmodule Mix.Tasks.Phx.Gen.SimpleForm do
  @moduledoc """
  Generates a starter form.
      mix phx.gen.simple_form
  The generated files will contain:
    * an adapter in lib/myapp_web/simple_form/simple_form.ex
  """
  use Mix.Task

  alias Mix.Generator

  @doc false
  def run(_args) do
    IO.inspect otp_app()
    binding = [
      web_module: web_module(),
      web_path: web_path()
    ]

    copy_templates "priv/templates/phx.gen.simple_form", binding, [
      {"simple_form.ex", "lib/#{web_path()}/simple_form/simple_form.ex"},
    ]

    Mix.shell.info """
      SimpleForm generated in #{"lib/#{web_path()}/simple_form/simple_form.ex"}
    """
  end

  defp copy_templates(root, binding, mappings) when is_list(mappings) do
    for {source_file_path, target} <- mappings do
      source = Path.join(root, source_file_path)
      Generator.create_file(target, EEx.eval_file(source, binding))
    end
  end

  def web_module() do
    base = Macro.camelize(to_string(otp_app()))
    "#{base}Web"
  end

  defp web_path do
    "#{otp_app()}_web"
  end

  defp otp_app do
    Mix.Project.config |> Keyword.fetch!(:app)
  end
end
