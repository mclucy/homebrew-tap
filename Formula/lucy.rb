class Lucy < Formula
  desc "Minecraft server environment manager"
  homepage "https://github.com/mclucy/lucy"
  license "Apache-2.0"

  # Pre-beta tap: install from the latest main-branch source until Lucy ships
  # tagged release archives with checksums suitable for a stable formula.
  head "https://github.com/mclucy/lucy.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"lucy"), "."
  end

  test do
    assert_match "lucy", shell_output("#{bin}/lucy --help")
  end
end
