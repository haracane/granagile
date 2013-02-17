execute "install rst2pdf" do
  user "root"
  command "easy_install rst2pdf"
  creates "/usr/bin/rst2pdf"
end

include_recipe "agile::VL-Gothic-font-20091202"

include_recipe "agile::IPAex-font-00201"

execute "fix reportlab" do
  user "root"
  command "sed \"s/simple = last or abs(extraSpace)<=1e-8 or line.lineBreak/simple = last or abs(extraSpace)<=1e-8 or getattr(line, 'lineBreak', False)/g\" -i /usr/lib/python2.6/site-packages/reportlab-2.6-py2.6-linux-x86_64.egg/reportlab/platypus/paragraph.py"
end
