{
  lib,
  appimageTools,
  fetchzip,
}:

let
  version = "2.12.2";
  pname = "stability-matrix";

  extracted-zip = fetchzip {
    url = "https://github.com/LykosAI/StabilityMatrix/releases/download/v${version}/StabilityMatrix-linux-x64.zip";
    sha256 = "sha256-30QtL8pnVcNplEEMXerZBsNMSB06hKveEQN3V2+COyI=";
  };

  src = "${extracted-zip}/StabilityMatrix.AppImage";

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: [ pkgs.libxcrypt pkgs.libxcrypt-legacy pkgs.icu ];

  extraInstallCommand = ''
    mv $out/bin/StabilityMatrix.Avalonia $out/bin/${pname}
    mkdir -p $out/share/applications
    install -Dm444 ${appimageContents}/zone.lykos.stabilitymatrix.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/512x512/apps/zone.lykos.stabilitymatrix.png $out/share/icons/hicolor/256x256/apps
    substituteInPlace $out/share/applications/zone.lykos.stabilitymatrix.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = {
    description = "Multi-Platform Package Manager for Stable Diffusion";
    homepage = "https://lykos.ai/";
    downloadPage = "https://github.com/LykosAI/StabilityMatrix/releases";
    license = lib.licenses.agpl3Only;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = with lib.maintainers; [ onny ];
    platforms = [ "x86_64-linux" ];
  };
}