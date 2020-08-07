win_temp_directory = inspec.command("echo $env:TEMP").stdout.strip
plugin_directory   = "#{win_temp_directory}/kitchen/ohai/plugins"
plugin_name        = 'scsipairings'

describe command("ohai -d #{plugin_directory} #{plugin_name}") do
  its(:stdout) { should match(/sizebytes/) }
end
