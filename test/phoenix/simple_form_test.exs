defmodule Phoenix.SimpleFormTest do
  use ExUnit.Case
  import Phoenix.HTML
  import Phoenix.SimpleForm

  doctest Phoenix.SimpleForm

  describe "build" do
    test "should build a input" do
      opts = []
      opts = Keyword.put(opts, :_style, Phoenix.SimpleForm.Styles.Bootstrap4)
      opts = Keyword.put(opts, :_translate_error_fn, fn x -> x end)

      form_input =
        Phoenix.SimpleForm.Factory.build(:form)
        |> input(:name, opts)
        |> safe_to_string()

      assert form_input ==
               ~s(<div class="form-group"><label class="control-label" for="name">Name</label><input class="form-control" id="name" name="name" type="text"></div>)
    end

    test "should raise an exeption of the style is not implemented" do
      defmodule EmptyStyleModule do
      end

      opts = []
      opts = Keyword.put(opts, :_style, EmptyStyleModule)
      opts = Keyword.put(opts, :_translate_error_fn, fn x -> x end)

      fn_that_raise_exeption = fn ->
        input(
          Phoenix.SimpleForm.Factory.build(:form),
          :name,
          opts
        )
      end

      assert_raise RuntimeError, "Input not defined text_input", fn_that_raise_exeption
    end
  end
end
