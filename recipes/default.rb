#
# Cookbook Name:: ktc-metering
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

class Chef::Recipe
  include KTCUtils
end

set_rabbit_servers "metering"
set_database_servers "metering"
set_service_endpoint_ip "metering-api"

include_recipe "openstack-common"
include_recipe "openstack-common::logging"
include_recipe "openstack-metering::api"
include_recipe "openstack-metering::identity_registration"

