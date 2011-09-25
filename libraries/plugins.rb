class Chef::Recipe
  def necessary_rmq_plugins
    %w(mochiweb webmachine rabbitmq_mochiweb amqp_client rabbitmq_management_agent rabbitmq_management).map { |name| rmq_plugin(name) }
  end
  
  def rmq_plugin(name)
    unless %w(mochiweb webmachine).include?(name)
      "#{ name }-#{ node[:rabbitmq_management][:version] }.ez"
    else
      case name
      when 'mochiweb'
        "mochiweb-1.3-rmq#{ node[:rabbitmq_management][:version] }-git9a53dbd.ez"
      when 'webmachine'
        "webmachine-1.7.0-rmq#{ node[:rabbitmq_management][:version] }-hg0c4b60a.ez"
      end
    end
  end
end
