# PhoenixSimpleForm

Simple. Explicit. Extensible.

Easy form handling for phoenix. Write `<%= input f, :name %>` and get wrappers with labels and error messages.
Infers the type, comes with styles for bootstrap.

## Why

Usually you're styling your forms the same across your app. Generators are okay but if you're writing
the same code over and over again. But the better solution is to find a good abstraction.
Simple form for phoenix does exactly that. Things you may encounter:

* Automatically set a **required flag** if you have the attribute in `validate_required` in your ecto schema: Yes, it's possible. After you figured it out, you have to write and manage the code for it. With simple_form get a struct with the information required: true/false.

* **Translating labels**: Sounds easy, right? But what if you want to have default translations? You don't want to translate "Save" in every form. What happens if no translation is found? Show an error or fallback to the humazied form? What if you want to override the label? These things are already solved so you don't have to.

* Adding new ways to display a selection list (e.g. radio buttons):
  If you look at the select input, there are multiple create a list for it.
  E.g.: `[1, 2, 3]` or `[one: 1, two: 2, three: 3]`. If you don't want to break the developers expectation, you likely want to support all theses formats. So you have to figure out what lists/maps are support and you have to transform them. The alternative: get an already normalized version.

* Test: often overlooked. Tests are not free at all. You have to maintain them. We did all the tests for transformations, etc. You just have to write you new inputs and you're done. Less code to maintain.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_form` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_form, "~> 0.1.0"}
  ]
end
```

## What

## How to

### Create a new or replace an existing field

### Modify the wrapper

### Detect an input field from paramters

### Mix and match different styles

## Thoughts while developing Simple Form

* One file: I have so many files in my project. If I can reduce limit files for
  form customization it's a big win.
* Extensibility: If you want to share your custom style and customize it later -
  it should be easy. Not everybody uses Boostrap and that's fine ;)
* No macro magic if possible: I've written a lot of macros. The more I write them
  the less I need they are really necessary. (defdelegate if fine e.g.)
* Super explicit: if you open the created simple_form.ex file you see all all possible
  input types at a glance. If you want to use `as:`, you don't have to guess. That's
  why I choose the original names from phoenix_html and the style need to do sth.
  inconvenient like `Form.text_input(...)`.
* Mix and match: You may want to support the default bootstrap style with some fancy
  extensions you created yourself - cool! do it. Simple Form should support it easily.
