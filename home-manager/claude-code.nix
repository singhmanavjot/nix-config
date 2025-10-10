{
  programs.claude-code = {
    enable = true;
    settings = {
      permissions = {
        allow = [
          "Edit(*)"
          "Bash(mkdir:*)"
          "Bash(rg:*)"
          "Bash(fd:*)"
          "Bash(grep:*)"
          "Bash(tree:*)"
          "Bash(find:*)"
          "Bash(ls:*)"
          "Bash(git checkout:*)"
          "Bash(gh pr view:*)"
          "Bash(git cherry-pick:*)"
          "Bash(gh repo view:*)"
        ];
      };
    };
  };
}
