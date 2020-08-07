Ohai.plugin(:Scsipairings) do
  provides 'scsipairings'
  collect_data do
    so = shell_out('powershell.exe -NoLogo -NonInteractive -NoProfile -Command "c:\scsi-vmware.ps1"')
    if so.exitstatus == 0
      scsiinfo = Mash.new
      scsi_info = {}
      so.stdout.strip.each_line do |line|
        kv = line.strip.split(/\s+/, 2)
        scsi_info[kv[0]] = kv[1] if kv.length == 2
      end
      scsiinfo[:sizebytes] = scsi_info['SizeBytes']
      scsiinfo[:usedbytes] = scsi_info['UsedBytes']
      scsiinfo[:partitionstartingaddress] = scsi_info['PartitionStartingAddress']
      scsiinfo[:partitionendingaddress] = scsi_info['PartitionEndingAddress']
      scsiinfo[:vmdk_uuid] = scsi_info['vmdk_UUID']
      scsiinfo[:partitionStyle] = scsi_info['PartitionStyle']
      scsiinfo[:computername] = scsi_info['ComputerName']
      scsiinfo[:smbios_uuid] = scsi_info['SMBIOS_UUID']
    end
    scsipairings scsiinfo
  end
end
