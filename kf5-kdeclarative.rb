require "formula"

class Kf5Kdeclarative < Formula
  url "http://download.kde.org/stable/frameworks/5.4/kdeclarative-5.4.0.tar.xz"
  sha1 "d093ffdbdc79a116c130bd4c7d5136fc37849f5f"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdeclarative.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  depends_on "haraldf/kf5/kf5-kio"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
