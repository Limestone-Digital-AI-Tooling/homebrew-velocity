class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent"
  version "3.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "be5ccd5b5ee341b75b1baeac16dba8d0976721851ccc732247e66e08cc1a6273"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "718a55f83ff280e0a1c4a160f5f76bbb01fec520a77d958578b609f960b0853e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "dd09028f731b5a5ccdeea0b7dbfaed98f1924ea906d377c12614211013b34e06"
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
