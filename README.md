# tf-module-vpc
This is the backend module for expense-terraform.
> All the code needed to create VPC will be hosted here.
> This repository contains the needed aws vpc components and this is the backend module for the root module from the repo "roboshop-terraform"

# moved block in terraform
It will change the name of resource without destroying & creating by programmatically.

# merge function in terraform

# Steps to Provision VPC and Enable VPC Peering to default vpc -
1. Provision VPC
2. Provision Public & Private subnets under the provisioned vpc.
3. VM's provisioned on public subnet should have public & Private IP Address & VM;s provisioned on priavte subnet should have only private IP address.
4. Provision an IGW & attach that to the vpc. (you can attach one igw to a single vpc) and this enables the connectivity from internet to VPC.
5. Create a routeTable and attach that routeTable for the public subnet respectively.
6. Now add the route as 0.0.0.0/0 as IGW
7. We should be able to SSH to this public server from the internet.
8. Launch an instance in the private subnet and this wont be having public IP address, that means you cannot access from the internet.
9. How to access this at this point of time? you can access this from the public-instance, SSH to the public-server from the internet and from there the private server.
10. How can we enable private communication from workstation node to the test-vpc network?
    Lets do the peering between default-vpc to test-vpc (As both of them are in the same vpc and in the same region, we can do this by our self)
11. Once peering has been enabled, we need to update the routeTables on both the sides, stating of the source is this , use the peering as the route 
    > Now if you notice, servers that has public IP has access to the internet. But private servers or the servers in the private subnet which dont have the public IP are not accessible from the internet and the server themselves cannot connect to the internet.
    > If you dont have access to the internet, how can we download packages, how can do the patching instance?

12. We need to ensure, that servers with private IP are not accessible from the internet. But if the server want to talk to internet, we need to let them do that.


Scope:
    1. The scope of security group, routeTable of a vpc are specific to a vpc only.
    2. If you create security group or route-table on vpc-x, you can only use them in vpc-x resource only.