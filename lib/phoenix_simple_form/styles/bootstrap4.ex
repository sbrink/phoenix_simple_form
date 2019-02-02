defmodule PhoenixSimpleForm.Styles.Bootstrap4 do
  use PhoenixSimpleForm.StyleHelpers

  def default_wrapper(f, name, opts, do: block) do
    content_tag :div, wrapper_html(opts, %{class: "form-group"}) do
      [
        label(f, name, label_translation(f, name), class: "control-label"),
        block,
        error_tag(f, name)
      ]
    end
  end

  def input(:text_input, f, name, opts) do
    default_wrapper(f, name, opts) do
      text_input(f, name, input_html(opts, %{class: "form-control"}))
    end
  end

  def input(:prepend, f, name, opts) do
    default_wrapper(f, name, opts) do
      content_tag :div, class: "input-group" do
        [
          content_tag(:span, opts[:prepend_text], class: "input-group-addon"),
          text_input(f, name, input_html(opts, %{class: "form-control"}))
        ]
      end
    end
  end

  def input(:file_input, f, name, opts) do
    default_wrapper(f, name, opts) do
      file_input(f, name, input_html(opts, %{class: "form-control"}))
    end
  end

  def input(:number_input, f, name, opts) do
    default_wrapper(f, name, opts) do
      number_input(f, name, input_html(opts, %{class: "form-control"}))
    end
  end

  def input(:textarea, f, name, opts) do
    default_wrapper(f, name, opts) do
      textarea(f, name, input_html(opts, %{class: "form-control"}))
    end
  end

  def input(:select, f, name, opts) do
    default_wrapper(f, name, opts) do
      select(f, name, opts[:collection], input_html(opts, %{class: "form-control c-select"}))
    end
  end

  def input(:date_select, f, name, opts) do
    default_wrapper(f, name, opts) do
      date_select(f, name)
    end
  end

  def input(:checkbox_vertical, f, name, opts) do
    default_wrapper(f, name, opts) do
      checkbox(f, name, input_html(opts, %{class: "form-control"}))
    end
  end

  def input(:checkbox, f, name, opts) do
    content_tag :div, wrapper_html(opts, %{class: "checkbox"}) do
      [
        label(f, name, class: "checkbox") do
          [checkbox(f, name, input_html(opts, %{})), label_translation(f, name)]
        end,
        error_tag(f, name)
      ]
    end
  end

  def input(unknown_type, _f, name, _opts) do
    raise "Cannot find input with type #{unknown_type} for field #{name}"
  end

  def error_tag(form, field) do
    if error = form.errors[field] do
      content_tag(:span, translate_error(error), class: "help-block text-danger")
    else
      {:safe, ""}
    end
  end

  def error_notification(_changeset) do
    content_tag :div, class: "alert alert-danger" do
      content_tag(:p, Gettext.dgettext(WorkshopsDe.Gettext, "forms", "error_notification"))
    end
  end
end
