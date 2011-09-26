#
# Cookbook Name:: rabbitmq-management
# Recipe:: default
#
# Copyright 2011, J.D. Hollis
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

necessary_rmq_plugins.each { |plugin|
  remote_file "/usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins/#{ plugin }" do
    source "http://www.rabbitmq.com/releases/plugins/v2.6.1/#{ plugin }"
    owner "rabbitmq"
    group "rabbitmq"
    action :create_if_missing
    notifies :restart, "service[rabbitmq-server]"
  end
}
