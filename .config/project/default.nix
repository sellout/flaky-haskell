### All available options for this file are listed in
### https://sellout.github.io/project-manager/options.xhtml
{config, ...}: {
  project = {
    name = "flaky-haskell";
    summary = "Building Haskell libraries across many GHC versions";
  };

  programs.vale.vocab.${config.project.name}.accept = [
    ## I don’t know why the `formatter` entry from Flaky isn’t good enough.
    ## Normally plurals are handled automatically. But this gets caught
    ## here.
    "formatters"
  ];

  ## publishing
  services.github.settings.repository.topics = [];
}
