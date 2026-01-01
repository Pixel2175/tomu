{
  lib,
  stdenv,
  ffmpeg,
  pkgs,
  makeWrapper,
  ...
}:

stdenv.mkDerivation rec {
  pname = "tomu";
  version = "unstable-2026-00-01";

  dontFixup = true;

  src = lib.cleanSource ./.;

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    ffmpeg
    pkgs.alsa-lib
    pkgs.pulseaudio
  ];

  postPatch = ''
    sed -i 's/-lpthread/-lpthread -lpulse/g' Makefile
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 tomu $out/bin/tomu

    wrapProgram $out/bin/tomu \
      --set AUDIODEV pulse

    runHook postInstall
  '';

  meta = {
    description = "Is just a Music player";
    homepage = "https://github.com/6z7y/tomu";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "tomu";
    platforms = lib.platforms.all;
  };
}
