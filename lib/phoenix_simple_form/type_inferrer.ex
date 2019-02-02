defmodule PhoenixSimpleForm.TypeInferrer do
  def run(f, name, opts) do
    opts[:as] ||
      from_parameters(opts, name) ||
      from_model_types(f.source.types, name)
  end

  def from_parameters(opts, _name) do
    cond do
      opts[:rows] -> :textarea
      opts[:collection] -> :select
      true -> nil
    end
  end

  def from_model_types(types, name) do
    case types[name] do
      :integer -> :number_input
      :boolean -> :checkbox
      :string -> :text_input
      _ -> types[name]
    end
  end
end
