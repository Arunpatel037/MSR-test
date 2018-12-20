provider "aws" {
    access_key = "XXXXXXXXXXXXXX"
    secret_key = "XXXXXXXXXXXXXX"
    region = "ap-southeast-1"
}
resource "aws_security_group" "My_SG" {
    name = "allow_SSH"
    description = "Allow inbound SSH traffic"
    vpc_id = "vpc-5f87db38"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        Name = "Allow SSH"
    }
}
resource "template_file" "userdata" {
    filename = "user-data.sh"
}

resource "aws_instance" "MSR_test_Instance" {

    ami              = "ami-0eb1f21bbd66347fe"
    instance_type    = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.My_SG.id}"]
    user_data       = "${template_file.userdata.rendered}"
    key_name         = "myKey"
    count            = "2"

   tags {
         Name = "MSR-test-Instance-${count.index+1}"
     }
}

