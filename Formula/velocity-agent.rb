class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-Agents/velocity-agent"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "e94d33c4dcba6aad745f0a9eee58b2256658407297f3d1d114fa88d35d39ac4c"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "7ab119c551e8efbc5b604cd0b796eac7ce873f927a9881452b83b87579af0978"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "65cad173af8d04d3d8fbe243c393a1868794a671f25cd6f2eb8c4c3c455430e0"
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
