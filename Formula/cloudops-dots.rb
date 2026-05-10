class CloudopsDots < Formula
  desc "Interactive TUI installer for CloudOps.Dots development environment"
  homepage "https://github.com/cloudopstudio/cloudops-dots"
  version "2.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-darwin-arm64"
      sha256 "8d202fb89d9a0700d20b9ff077a74065aaee76dfe034de72a03e82e1b30b813b"
    end
    on_intel do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-darwin-amd64"
      sha256 "c5051fad8de165ff02aa3994b75972627fc1ddb499913acca04ce1d7e39ac750"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-linux-arm64"
      sha256 "2db1e76ec79b205c09e0776855bc30871559d143ce70aae99dac5a88c9e09430"
    end
    on_intel do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-linux-amd64"
      sha256 "34a3a119cbc3b53d419f5d2bb98ca9bb77272f21e6bbda4618057aff60bed51c"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cloudops-installer-darwin-arm64" => "cloudops-dots"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cloudops-installer-darwin-amd64" => "cloudops-dots"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cloudops-installer-linux-arm64" => "cloudops-dots"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "cloudops-installer-linux-amd64" => "cloudops-dots"
    end
  end

  test do
    system "#{bin}/cloudops-dots", "--help"
  end
end
