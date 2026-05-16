class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-Agents/velocity-agent"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "1045daf10cd071b3ca7585b691cd924fca5bd63f9a6d727bb593f99b1e2b9558"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "be0a33d6593f95c3a936d2394c92a3bfe43ab5dc0949bb4ad29b89e3dc86739d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "85fc188afd5073ac370d43848a47c76a3816b6e0bb83236fc010aa129166cff8"
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
