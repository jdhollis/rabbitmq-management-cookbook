maintainer       "J.D. Hollis"
license          "Apache 2.0"
description      "Installs the rabbitmq-management plugin and dependencies"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends          "rabbitmq"

attribute "rabbitmq_management",
  :display_name => "rabbitmq-management",
  :description => "Hash of rabbitmq-management attributes",
  :type => "hash"

attribute "rabbitmq_management/version",
  :display_name => "RabbitMQ version",
  :description => "Target version of RabbitMQ",
  :type => "string"
