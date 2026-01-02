data "aws_vpc" "myalreadyvpc" {
    default = true
}
resource "aws_security_group" "myownsg" {
    name = "myopenallsg"
    description = "all network sg"
    vpc_id = data.aws_vpc.myalreadyvpc.id

}
resource "aws_vpc_security_group_ingress-rule" "myingressrules" {
    security_group_id =aws_security_group.myownsg.id 
    form_port = 22
    to port = 22
    ip_protocal = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}
resource "aws_key_pair" "myownkey" {
    key_name = "mysshownkey"
  public_key =file("~/.ssh/id_ed25519.pub")

}
resource "aws-instance" "myec2" {
    ami = "ami-02b8269d5e85954ef"
    instance_type ="t3.micro"
    key_name = aws_key_pair.myownkey.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_vpc_security_group.myowng.id]
    tags = {
        Name = "myterraformec2"
    }
}