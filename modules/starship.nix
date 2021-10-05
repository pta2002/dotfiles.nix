{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;

      line_break.disabled = true;

      nix_shell.symbol = " ";

      character.success_symbol = "[»](bold green)";
      character.error_symbol = "[»](bold red)";

      format = "$username$directory$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$battery$time$status$shell$character";
    };
  };
}
