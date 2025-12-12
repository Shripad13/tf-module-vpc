# ## Creating this file for just to test connectivity

# resource "aws_instance" "web" {
#   ami = "ami-0fsckejenlkm3kdk2"
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [aws_security_group.allows_private.id]
#   subnet_id = aws_subnet.app.*.id[0]

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# resource "aws_security_groups" "allows_private" {
#   name = "allows_tls"
#   description ="Allow TLS"
#   vpc_id = aws_vpc,main.id

#   egress{
#     from_port      = 0
#     to_port        = 0
#     protocol       = "-1"
#     cidr_blocks    = ["0.0.0.0/0"]

#   }


#     ingress{
#     from_port      = 22
#     to_port        = 22
#     protocol       = "tcp"
#     cidr_blocks    = {"0.0.0.0/0"}
#     description = "SSH"

#   }
# }