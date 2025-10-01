{
  config,
  lib,
  ...
}: {
  project = {
    name = "flaky-haskell";
    summary = "Building Haskell libraries across many GHC versions";
  };

  ## dependency management
  services.renovate.enable = true;

  ## development
  programs = {
    direnv = {
      enable = true;
    };
    # This should default by whether there is a .git file/dir (and whether it’s
    # a file (worktree) or dir determines other things – like where hooks
    # are installed.
    git.enable = true;
  };

  ## formatting
  editorconfig.enable = true;
  programs = {
    treefmt.enable = true;
    vale = {
      enable = true;
      vocab.${config.project.name}.accept = [
        ## I don’t know why the `formatter` entry from Flaky isn’t good enough.
        ## Normally plurals are handled automatically. But this gets caught
        ## here.
        "formatters"
      ];
    };
  };

  ## CI
  services.garnix.enable = true;

  ## publishing
  services = {
    flakehub.enable = true;
    github.enable = true;
  };
}
