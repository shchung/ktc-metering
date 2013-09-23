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

d = get_openstack_service_template(get_interface_address("management"), "8777")
register_member("metering-api", d)

set_rabbit_servers "metering"
set_database_servers "metering"
set_service_endpoint "identity-api"
set_service_endpoint "image-api"
set_service_endpoint "metering-api"

include_recipe "openstack-common"
include_recipe "openstack-common::logging"
include_recipe "openstack-metering::api"
include_recipe "openstack-metering::identity_registration"
include_recipe "openstack-metering::agent-central"
include_recipe "openstack-metering::collector"

