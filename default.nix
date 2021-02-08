with import <nixpkgs> {};

stdenv.mkDerivation {
  pname = "waveplus-reader";
  version = "20201204-mk";

  src = ./.;

  buildInputs = [ (python2.withPackages (ps: [ ps.bluepy ])) ];

  prePatch = ''
    echo "#!/usr/bin/env python" > read_waveplus
    cat read_waveplus.py >> read_waveplus
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m 755 read_waveplus $out/bin/read_waveplus
  '';
}
