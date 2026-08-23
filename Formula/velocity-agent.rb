class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "2ce0c4cf61432e6f9e3d65afeadb22b0862431b6cb75c4c5a2a92a5498233742"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "84ca7ef6b54f132e832a7619f02884ac707213dbb42fffc4a62b9447c7c78e42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-AI-Tooling/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "4e434348efd69dcf266efd5b8cb84212f57672163fe572d246bde8d34cf32d6d"
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
