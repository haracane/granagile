include_recipe "python::setuptools-0.6c11-2.6"

execute "install rst2pdf" do
  user "root"
  command "easy_install-2.6 rst2pdf"
  creates "/usr/bin/rst2pdf"
end

include_recipe "sphinx::VL-Gothic-font-20091202"

include_recipe "sphinx::IPAex-font-00201"

execute "fix reportlab" do
  user "root"
  command "sed \"s/simple = last or abs(extraSpace)<=1e-8 or line.lineBreak/simple = last or abs(extraSpace)<=1e-8 or getattr(line, 'lineBreak', False)/g\" -i /usr/lib/python2.6/site-packages/reportlab-2.6-py2.6-linux-x86_64.egg/reportlab/platypus/paragraph.py"
end
