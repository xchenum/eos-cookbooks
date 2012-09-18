#
# Cookbook Name:: eos_demo
# Recipe:: default
#
# Copyright 2012, Opscode, Inc
#

if node['eos_demo']['enabled']
  eos_interface "Ethernet1" do
    action :enable
    description "Upstream WAN Interface"
  end
else
  eos_interface "Ethernet1" do
    action :disable
    description "Out of action"
  end
end

ohai "reload_sysdb" do
  action :nothing
  plugin "sysdb"
  subscribes :reload, resources(:eos_interface => "Ethernet1")
end
