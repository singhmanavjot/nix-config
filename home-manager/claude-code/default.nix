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
        ];
      };
    };
    memory.text = builtins.readFile ./memory.md;
  };
}
