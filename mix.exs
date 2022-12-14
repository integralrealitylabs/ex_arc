defmodule Arc.Mixfile do
  use Mix.Project

  @version "0.8.0"

  def project do
    [app: :arc,
     version: @version,
     elixir: "~> 1.4",
     deps: deps(),

    # Hex
     description: description(),
     package: package()]
  end

  defp description do
    """
    Flexible file upload and attachment library for Elixir.
    """
  end

  defp package do
    [maintainers: ["Sean Stavropoulos"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/stavro/arc"},
     files: ~w(mix.exs README.md CHANGELOG.md lib)]
  end

  def application do
    [
      applications: [
        :logger,
        :httpoison,
      ] ++ applications(Mix.env)
    ]
  end

  def applications(:test), do: [:ex_aws, :poison]
  def applications(_), do: []

  defp deps do
    [
      {:httpoison, "~> 0.8"}, # Required for downloading remote files
      {:ex_aws, git: "https://github.com/ex-aws/ex_aws.git", override: true},
      {:ex_aws_s3, git: "https://github.com/MixedDimensionsLib/ex_aws_s3.git"},
      {:mock, "~> 0.1.1", only: :test},
      {:ex_doc, "~> 0.14", only: :dev},

      # If using Amazon S3:
      {:poison, "~> 2.2 or ~> 3.1", optional: true},
      {:sweet_xml, "~> 0.6", optional: true}
    ]
  end
end
