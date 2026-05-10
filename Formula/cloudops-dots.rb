class CloudopsDots < Formula
  desc "Interactive TUI installer for CloudOps.Dots development environment"
  homepage "https://github.com/cloudopstudio/cloudops-dots"
  version "2.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-darwin-arm64"
      sha256 "8a5c371cf1b323442cc7e8e543487587210fc6038fa1f6b5d98cec9a5419ed0a"
    end
    on_intel do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-darwin-amd64"
      sha256 "51479e991b4f6525d6cf170ca6500e81d040625f37b0124755652d390950627f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-linux-arm64"
      sha256 "4d9201732ac822a608d4b317351bb5f176165116efcc14bdbd191a68ae02175f"
    end
    on_intel do
      url "https://github.com/cloudopstudio/cloudops-dots/releases/download/v#{version}/cloudops-installer-linux-amd64"
      sha256 "34c66ca50902dcc651dfb00ff666008ae7f14a557d71eee2dc3beaa3f343a513"
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
