require "formula"

class Kf5Kdiagram < Formula
  desc "Powerful libraries for creating business diagrams"
  homepage "http://www.kde.org/"
  url "https://download.kde.org/stable/kdiagram/2.6.0/src/kdiagram-2.6.0.tar.xz"
  sha256 "02788dad7e15c64b74a2d1073c5910469ab4cf46ba905030c1713dce45981882"

  head "git://anongit.kde.org/kdiagram.git"

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  def install
    args = std_cmake_args

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
