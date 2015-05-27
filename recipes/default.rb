service 'nginx' do
  action :nothing
end

template "#{node[:nginx][:dir]}/conf.d/real_ip.conf" do
  source 'real_ip.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  action :create
  notifies :reload, 'service[nginx]', :immediately
end
