node[:deploy].each do |app_name, deploy|
  template '/etc/logstash-forwarder.conf' do
    cookbook 'logstash-forwarder'
    source 'logstash-forwarder.conf.erb'

    mode '0600'
    owner 'root'
    group 'root'

    variables( logstash: deploy[:logstash] || {} )

    only_if { deploy_config[:logstash].present? }
  end
end
