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
  };
}
