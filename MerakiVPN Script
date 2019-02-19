$Shared = <Shared Key>
$Public = <Public IP Address>
$Internal = <Internal LAN Subnet>
$Domain = <Internal Domain Name>


Add-VpnConnection -L2tpPsk $Shared -name MerakiVPN -ServerAddress $Public-AllUserConnection -AuthenticationMethod Pap -TunnelType L2tp -SplitTunneling -Force -DNSSuffix $Domain

Add-VpnConnectionRoute -AllUserConnection -ConnectionName MerakiVPN -DestinationPrefix $Internal
