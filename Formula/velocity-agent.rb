class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent"
  version "3.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "226acbc57591f4a95af5bdf94a2486786dcc8f64fcd26094bc0a2af87194e41b"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "80199538a7ea44e16fd873181d26051413dde47b85a109797a7d21012427e1a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "0829dd1843abeb4989041cc9657756334148d18bacfd4f1610d18dd734555128"
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
