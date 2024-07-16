{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Benjamin Palko";
      userEmail = "ext.benjamin.palko@mastery.net";
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
