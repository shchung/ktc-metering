#
# Cookbook Name:: ktc-metering
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "services"
include_recipe "ktc-utils"

ip = KTC::Network.address "management"

Services::Connection.new run_context: run_context
metering_api = Services::Member.new node.default.fqdn,
  service: "metering-api",
  port: 8777,
  proto: "tcp",
  ip: ip

metering_api.save

KTC::Attributes.set

include_recipe "openstack-common"
include_recipe "openstack-common::logging"
include_recipe "openstack-metering::api"
include_recipe "openstack-metering::identity_registration"
