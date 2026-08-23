class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent"
  version "3.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "5346f7e66b9552b3ad5d8b358f04cc5043e665d94bbd6a16add979baa56d0223"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "3de2e091e9ed951cf15ea52dff99c5f24aff9f306e2040c9173c186c5892a268"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "be74ba9afed34f546cb553b60b44136287eb32745dfb97e489070e4b5c4cd743"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "velocity-agent-darwin-arm64" => "velocity-agent"
    elsif OS.mac?
      bin.install "velocity-agent-darwin-x64" => "velocity-agent"
    else
      bin.install "velocity-agent-linux-x64" => "velocity-agent"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velocity-agent --version")
  end
end
