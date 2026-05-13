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
 - Launch an EC2 instance inside the public subnet of VPC-A.
 - 



