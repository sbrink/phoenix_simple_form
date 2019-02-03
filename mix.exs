defmodule Phoenix.SimpleForm.MixProject do
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :phoenix_simple_form,
      version: "0.3.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      package: package(),
      description: "Easy form handling for phoenix",
      preferred_cli_env: [
        cov: :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.post": :test,
        credo: :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:phoenix_html, ">= 2.0.0"},
      {:phoenix_ecto, "~> 4.0", only: :test},
      {:excoveralls, "~> 0.10.0", only: :test},
      {:credo, "~> 1.0", only: :test},
      {:ex_machina, "~> 2.2", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    [
      maintainers: ["Sascha Brink", "Robin Boehm"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sbrink/phoenix_simple_form"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      cov: ["coveralls.html", "open cover/excoveralls.html"],
      t: ["test.watch"]
    ]
  end
end
