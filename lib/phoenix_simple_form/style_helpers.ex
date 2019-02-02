defmodule PhoenixSimpleForm.StyleHelpers do
  @doc false
  defmacro __using__(_) do
    quote do
      use Phoenix.HTML

      def input_html(opts, defaults) do
        defaults |> Map.merge(opts[:input_html] || %{}) |> Map.to_list()
      end

      def wrapper_html(opts, defaults) do
        defaults |> Map.merge(opts[:wrapper_html] || %{}) |> Map.to_list()
      end

      def translate_error({msg, opts}) do
        Gettext.dngettext(WorkshopsDe.Gettext, "errors", msg, msg, opts[:count], opts)
      end

      def translate_error(msg) do
        Gettext.dgettext(WorkshopsDe.Gettext, "errors", msg)
      end

      def label_translation(f, name) do
        translation_key = "#{f.id}.#{name}.label"
        translation = Gettext.dgettext(WorkshopsDe.Gettext, "forms", translation_key)

        if translation == translation_key do
          Gettext.dgettext(WorkshopsDe.Gettext, "forms", "defaults.#{name}.label")
        else
          translation
        end
      end
    end
  end
end
