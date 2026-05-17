class VelocityAgent < Formula
  desc "Polling agent that picks up tracker tickets and runs an AI coding agent on them"
  homepage "https://github.com/Limestone-Digital-Agents/velocity-agent"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-arm64"
      sha256 "28b72612d873fa799bce003f270956623b3ebde97b7d47eb97f79b38ff3fcd28"
    end
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-darwin-x64"
      sha256 "43b0edb2aa965fbd66cd055b476c4d77fbf0affbb8a06c750789be3bf5849cd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Limestone-Digital-Agents/velocity-agent-dist/releases/download/v#{version}/velocity-agent-linux-x64"
      sha256 "401787e127ad6234d067a8354d1fa6db5a7a4c4b44c8b341745e175a12e3577c"
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
