include_recipe "apt"
include_recipe "apache2"
include_recipe "build-essential"
include_recipe "java"
include_recipe "maven"
include_recipe "mercurial"
include_recipe "python"

%w[python-setuptools python-dev libbz2-dev libmuparser-dev libsparsehash-dev python-pygments python-ptrace python-pydot graphviz liblzma-dev libsnappy-dev].each do |x|
  package x do
    action :install 
  end
end