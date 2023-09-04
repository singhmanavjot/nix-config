{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "kubectl" "minikube" "direnv" "terraform" "1password" ];
    };

    shellAliases = {
      argo-pw = "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\" | base64 -d | xargs echo";
      argo-tunnel = "kubectl port-forward -n argocd services/argo-cd-argocd-server 8080:80";
    };
  };
}
