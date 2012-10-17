include "androguard::prereqs"

%w[psyco-dist networkx IPython pyparsing python-magic pyfuzzy zstream python-snappy].each do |x|
  python_pip x do
    action :install 
  end
end

bash "install_mercury" do
  interpreter "bash"
  user "root"
  cwd "/var/www"
  code <<-EOH
  curl http://labs.mwrinfosecurity.com/assets/299/mercury-v1.1.zip -O /var/www/mercury-v1.1.zip
  unzip /var/www/mercury-v1.1.zip
  ln -s /var/www/mercury-v1.1/mercury /usr/sbin/mercury
  EOH
end

git "/tmp/" do
  repository "git://github.com/brutall/brut.apktool.git"
  reference "master"
  action :sync
end

#bash "move_apk_jar" do
#  interpreter "bash"
#  user "root"
#  cwd "/tmp"
#  code <<-EOH
#  Install APKTool
#  EOH
#end

mercurial "/var/www/" do
  repository "https://code.google.com/p/androguard/"
  action :sync
end