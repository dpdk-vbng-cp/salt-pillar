systemd:
  networkd:
    configs:
      10-dummy0.netdev: |
        [NetDev]
        Name=dummy0
        Kind=dummy

      10-dummy0.network: |
        [Match]
        Name=dummy0
        
        [Link]
        MTUBytes=1500
        
        [Network]
        Address=10.0.0.1/32
        VXLAN=vx_ctl

      10-vx_ctl.netdev: |
        [NetDev]
        Name=vx_ctl
        Kind=vxlan

        [VXLAN]
        Id=100
        MacLearning=true

      10-vx_ctl.network: |
        [Match]
        Name=vx_ctl

        [Network]
        Address=10.10.10.1/24
