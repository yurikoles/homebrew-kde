class Kf5Kjs < Formula
  desc "Support for JS scripting in applications"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.67/portingAids/kjs-5.67.0.tar.xz"
  sha256 "8718ea6a963e39c26f1fd98c4b55041c724b32ec3dbf71814f39ee04afbcd356"

  head "git://anongit.kde.org/kjs.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build
  depends_on "KDE-mac/kde/kf5-kdoctools" => :build
  depends_on "ninja" => :build

  depends_on "pcre"
  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"
    args << "-DKDE_INSTALL_QTPLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "-G", "Ninja", "..", *args
      system "ninja"
      system "ninja", "install"
      prefix.install "install_manifest.txt"
    end
  end

  def caveats; <<~EOS
    You need to take some manual steps in order to make this formula work:
      "$(brew --repo kde-mac/kde)/tools/do-caveats.sh"
  EOS
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(KF5JS REQUIRED)")
    system "cmake", ".", "-Wno-dev"
  end
end
