defmodule PhoenixSimpleForm.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_simple_form,
      version: "0.0.2",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      aliases: aliases(),
      description: "Easy form handling for phoenix",
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:phoenix_html, ">= 2.4.0"}, {:mix_test_watch, "~> 0.2", only: :dev}]
  end

  defp package do
    [
      maintainers: ["Sascha Brink"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sbrink/phoenix_simple_form"}
    ]
  end

  defp aliases do
    [t: ["test.watch"]]
  end
end
