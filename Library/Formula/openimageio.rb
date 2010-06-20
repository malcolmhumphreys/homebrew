require 'formula'

class Openimageio <Formula
  head 'http://svn.openimageio.org/oiio/tags/Release-0.8.1/', :using => :svn
  version "0.8.1"
  homepage 'http://openimageio.org'

  depends_on 'pkg-config'
  depends_on 'cmake'
  depends_on 'ilmbase'
  depends_on 'openexr'
  depends_on 'boost'

  # build plugins
  depends_on 'libpng' => :optional
  depends_on 'libtiff' => :optional
  depends_on 'jpeg' => :optional
  depends_on 'jasper' => :optional

  # Qt linking not currently working.
  # # build iv
  # depends_on 'qt' => :optional
  # depends_on 'glew' => :optional

  depends_on 'tbb' => :optional

  def install
    system "cmake src/ #{std_cmake_parameters} -DUSE_QT:BOOL=OFF -DEMBEDPLUGINS:BOOL=ON -DUPDATE_TYPE:STRING=svn"
    system "make install"
  end
end
