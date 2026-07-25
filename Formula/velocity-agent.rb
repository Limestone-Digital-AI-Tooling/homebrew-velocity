class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-Agents/velocity-agent"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "b6943e7a2b54e964dc6c36187fd04cffb3789ed983f35c1c23452634c5816bd0"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "34ccb61d94db756afed22ad28515ec72d1d9364833f0088ddd35047d394aaef6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "d91ddf49a3c0af5d0aaa562422208384779902bd2734d1dde1efd4d66357dcc8"
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
