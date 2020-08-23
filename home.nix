{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";

  home.packages = [];

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Ruin0x11";
    userEmail = "ipickering2@gmail.com";
  };

  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile vim/vimrc;
  };
 
  home.file = {
     ".vim/bundle/Vundle.vim".source = pkgs.fetchFromGitHub {
        owner = "VundleVim";
        repo = "Vundle.vim";
        rev = "b255382";
        sha256 = "0fkmklcq3fgvd6x6irz9bgyvcdaxafykk3k89gsi9p6b0ikw3rw6";
     };
     ".vimrc.bundles".source = ./vim/vimrc.bundles;

     ".zshrc".source = ./zsh/zshrc;
     ".zshrc.functions".source = ./zsh/zshrc.functions;
     ".aliases".source = ./zsh/aliases;
     ".zsh/zsh-history-substring-search".source = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "0f80b8e";
        sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
     };
     ".zsh/zsh-syntax-highlighting".source = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "4cf464f";
        sha256 = "0s197576djz1ysk0s5zlmw4v657v0f598mkmqzk32wgs4yvfqabx";
     };
     ".zsh/zsh-autosuggestions".source = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "ae315de";
        sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
     };
     ".zsh/git.zsh".source = ./zsh/git.zsh;

     ".tmux.conf".source = ./tmux/tmux.conf;

     ".xinitrc".source = ./x11/xinitrc;

     ".bin".source = ./bin;
  };

  xdg.configFile = {
    "i3".source = ./i3;
    "i3blocks".source = ./i3blocks;

    "mpv".source = ./mpv;
  };
}
