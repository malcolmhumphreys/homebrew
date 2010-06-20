require 'formula'

class Pyyaml <Formula
  url 'http://pyyaml.org/download/pyyaml/PyYAML-3.09.tar.gz'
  version "3.09"
  homepage 'http://pyyaml.org/wiki/PyYAML'
  md5 'f219af2361e87fdc5e85e95b84c11d87'

# build without libyaml, ie pure-python parser and emitter
# depends_on 'libyaml' => :optional

def install
  system "python", "setup.py", "--without-libyaml", "install", "--prefix=#{prefix}"
end

  def caveats; <<-EOS
Because the Python search path on OSX doesn't point to #{HOMEBREW_PREFIX}
which means you will need to set the PYTHONPATH:

    export PYTHONPATH=#{HOMEBREW_PREFIX}/lib/python2.6/site-packages

    EOS
  end

end
