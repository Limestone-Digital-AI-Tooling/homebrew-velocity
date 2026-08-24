class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent"
  version "3.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "4e05b6d3c7330586e682cd5340f32c7d7675a8700cdb889d20940ed99ba4ffad"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "1562c3a4367bde0533b7958b67a2b4167b6d3f51bddcf98d7eadc4e237c3da21"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "e82d6c30c7d6970c24b596688f0b09a38afc6534585a43efdcf5958b9cc9f513"
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
