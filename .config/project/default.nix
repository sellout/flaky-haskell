### All available options for this file are listed in
### https://sellout.github.io/project-manager/options.xhtml
{...}: {
  project = {
    name = "flaky-haskell";
    summary = "Building Haskell libraries across many GHC versions";
  };

  ## publishing
  services.github.settings.repository.private = false;
  services.github.settings.repository.topics = ["build" "haskell"];
}
