Spring::Commands::Rake.environment_matchers["spec"] = "test"
Spring::Commands::Rake.environment_matchers[/^cucumber/]     = "test"

# To change the environment when you run `rake` with no arguments
Spring::Commands::Rake.environment_matchers[:default] = "development"
