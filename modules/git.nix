{
  programs.git = {
    enable = true;
    userName = "Pedro Alves";
    userEmail = "pta2002@pta2002.com";
    extraConfig = {
      pull.rebase = true;
      init.defaultBranchName = "main";
    };
  };
}
