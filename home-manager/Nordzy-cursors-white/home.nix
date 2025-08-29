{  
  pkgs, 
  ... 
}: 
{
  home = {
  stateVersion = "25.11";
  username = "user";
  homeDirectory = "/home/user";
  pointerCursor =
  let
    getFrom = url: hash: name: {
      gtk.enable = false;
      x11.enable = true;
      name = name;
      size = 18;
      package =
        pkgs.runCommand "moveUp" {} ''
          mkdir -p $out/share/icons
          ln -s ${pkgs.fetchzip {
            url = url;
            sha256 = hash;
          }} $out/share/icons/${name}
      '';
    };
  in
  getFrom
    "https://github.com/guillaumeboehm/Nordzy-cursors/releases/download/v2.4.0/Nordzy-cursors-white.tar.gz"
    "sha256-WHNkEZL3yJaS8TNcUllph5MHSCwPcCgxQvP6Zc+nT/Y="
    "Nordzy-cursors-white";
  };
}
