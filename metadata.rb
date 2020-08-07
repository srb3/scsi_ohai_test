name 'scsi_ohai_test'
maintainer 'Steve Brown'
maintainer_email 'sbrown@chef.io'
license 'Apache-2.0'
description 'Installs/Configures scsi_ohai_test'
long_description 'Installs/Configures scsi_ohai_test'
version '0.1.0'
chef_version '>= 14.0'

%w(windows).each do |os|
  supports os
end


issues_url 'https://github.com/srb3/scsi_ohai_test/issues'
source_url 'https://github.com/srb3/scsi_ohai_test'
