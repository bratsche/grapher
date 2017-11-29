defmodule Grapher.Mixfile do
  use Mix.Project

  def project do
    [
      app: :grapher,
      version: "0.6.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      dialyzer: [plt_add_deps: :transitive, ignore_warnings: "dialyzer.ignore-warnings"],
      deps: deps()
    ] ++ doc_config()
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Grapher, []},
      start_phases: [{:setup, []}],
      extra_applications: [:logger],
      env: [transport: HTTPoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:dialyxir, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:httpoison, ">= 0.0.0"},
      {:poison, ">= 0.0.0"}
    ]
  end

  defp doc_config do
    [
      name: "Grapher",
      source_url: "https://github.com/apartmenttherapy.com/grapher",
      docs: [extras: ["README.md"]]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end
