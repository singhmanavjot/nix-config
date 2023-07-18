{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "kubectl" "minikube" "direnv" "terraform" "1password" ];
    };
  };
}
