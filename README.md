# AWS Transit Gateway + Site-to-Site VPN Lab

![alt](https://github.com/nawaz-ch/tranist-gateway-with-vpn/blob/2eaa5da1e8858a4ed207e9abba543dcd8a4e9c51/vpn_transit_gateway.png)

**Overview**
This project demonstrates a hybrid-cloud networking setup using:
- Site-to-Site VPN
- AWS Transit Gateway
- Simulated on-premises network
- Multi-VPC routing
- OpenSwan/Libreswan based IPsec tunnel

**In this architecture:**
- VPC-A acts as an on-premises environment
- An EC2 instance inside the public subnet acts as a Customer Gateway Router
- The router establishes an IPsec VPN tunnel with AWS Transit Gateway
- Traffic is routed securely to:
   - VPC-B private subnet
   - VPC-C private subnet
- This setup demonstrates centralized connectivity using AWS Transit Gateway.



# Components


| Component | Purpose|
|---------|-------------|
| VPC-A | Simulated on-premises network |
| EC2 Router | Customer Gateway device running OpenSwan/Libreswan |
| VPN Connection | Encrypted IPsec tunnel |
| Transit Gateway | Central routing hub |
| VPC-B | Target private network |
| VPC-C | Additional private network |

# Network Topology
| Network| CIDR|
|---------|-------------|
| VPC-A | 192.168.0.0/16 |
| VPC-B | 10.0.0.0/16 |
| VPC-C | 10.1.0.0/16 |

# Features Demonstrated
- AWS Transit Gateway routing
- Site-to-Site VPN configuration
- IPsec tunnel establishment using OpenSwan/Libreswan
- Secure communication between on-prem and AWS VPCs
- Multi-VPC connectivity through centralized routing
- Private subnet access over VPN
- Route table propagation and association


# Configure Customer Gateway Router
![alt](https://github.com/nawaz-ch/tranist-gateway-with-vpn/blob/50e028221f31301e3c84549e8328e7e391319fe1/vpc-connections-config.png)
 - Click on Download configuration
 - In vendor choose openswan
 - Launch an EC2 instance inside the public subnet of VPC-A.
```bash
sudo yum install libreswan -y
```
 - open the file downloaded and open /etc/sysctl.conf in the instance and paste:
```bash
   net.ipv4.ip_forward = 1
   net.ipv4.conf.default.rp_filter = 0
   net.ipv4.conf.default.accept_source_route = 0
```
 - Apply the changes in step 1 by executing the command 'sysctl -p'
 -  Open /etc/ipsec.conf and look for the line below. Ensure that the # in front of the line has been removed, then save and exit the file.
```bash
    #include /etc/ipsec.d/*.conf
```
 -  Create a new file at /etc/ipsec.d/aws.conf if doesn't already exist, and then open it. Append the following configuration to the end in the file:
 #leftsubnet= is the local network behind your openswan server, and you will need to replace the <LOCAL NETWORK> below with this value (don't include the brackets). If you have multiple subnets, you can use 0.0.0.0/0 instead.
 #rightsubnet= is the remote network on the other side of your VPN tunnel that you wish to have connectivity with, and you will need to replace <REMOTE NETWORK> with this value (don't include brackets).
 - remove `auth=esp`
 - modify `phase2alg` value with `aes128-sha256`
 - modify `ike` value with `aes128-sha256;modp2048`
   
```bash
conn Tunnel1
	authby=secret
	auto=start
	left=%defaultroute
	leftid=3.216.214.69
	right=44.209.227.93
	type=tunnel
	ikelifetime=8h
	keylife=1h
	phase2alg=aes128-sha256
	ike=aes128-sha256;modp2048
	keyingtries=%forever
	keyexchange=ike
	leftsubnet=192.168.0.0/16
	rightsubnet=10.0.0.0/8
	dpddelay=10
	dpdtimeout=30
	dpdaction=restart_by_peer

```
-  Create a new file at /etc/ipsec.d/aws.secrets if it doesn't already exist, and append this line to the file (be mindful of the spacing!):
```bash
32.194.215.232 34.200.72.110: PSK "N7jOkWDVtJXCnZRwwBufRX7D2TPpsBbP"
```

enter:
```bash
sudo systemctl start ipsec.service
```

 - Make sure update the route tables

 - from customer gateway router ping:
```bash
 ping <Private ec2-instance of VPC-B or VPC-C>
```
 - Disable Source / destination checking in the VPC-A private ec2 instance
 - ssh into that private ec2 instance and ping private ec-2 instance of VPC-B or VPC-C



