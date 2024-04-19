# #Script to deploy ec2 into a subnet, within a VPC and network interface

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}
 
provider "aws" {
  # Configuration options
  region = "us-east-1"
}

#VPCs Resources

resource "aws_vpc" "bastion_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    name = "Bastion"
  }
     
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    name = "main"
  }  
     
}


resource "aws_internet_gateway" "bastion_gw" {
  vpc_id = aws_vpc.bastion_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main"
  }
}


resource "aws_nat_gateway" "main_nat_gw" {
  subnet_id     = aws_subnet.main_public_subnet.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.main_gw]

}


  

resource "aws_route_table" "Bastion_vpc" {
  vpc_id = aws_vpc.bastion_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bastion_gw.id
  }

  tags = {
    Name = "Bastion"
  }
}

resource "aws_route_table" "main_vpc" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bastion_gw.id
  }

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "bastion_public_subnet" {
  vpc_id            = aws_vpc.bastion_vpc.id 
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
 

}

resource "aws_subnet" "main_public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
 

}

resource "aws_subnet" "main_public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1b"
 

}

resource "aws_subnet" "main_private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1a"
 

}

resource "aws_subnet" "main_private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.1.2.0/24" 
  availability_zone = "us-east-1b "
 

}




resource "aws_route_table_association" "bastion" {
  subnet_id      = aws_subnet.bastion_public_subnet.id
  route_table_id = aws_route_table.Bastion_vpc.id
}


#Security groups

resource "aws_security_group" "bastion_vpc" {
 name        = "permission for VPC"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.bastion_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}


resource "aws_security_group" "main_vpc" {
 name        = "permission for VPC"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    from_port        = 80
    to_port          = 80 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

   ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }

    ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
    
  }

   egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "UDP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


}


#Elastic IPs

resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.main.id
  depends_on                = [aws_internet_gateway.custom_gw]
}

resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.main.id
  depends_on                = [aws_internet_gateway.custom_gw]
}














resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOljUMVeoE4DnxOiZwyECc19obQsYT0MJideH4U/I8cyvbHMiAx5QC9cavh7ak9DpEwogjKICXCBnljbHLm6/2xOiWkswZbVgUMn9ATbXbZhgestNcoAdY4LJwpF0T8QewYIuC2oHnCc3MHfK9KFjqSF8HDxv7tW6I/550rYChKj423uRBRm9sqbWKAzfvh+qQ1IHefQZ9vw7ilx9LVmW+RLaJLWxVvJhPUssB9DVXXqTVo8TkP8qtkjaKL2swXbbstCO6P1cnzGXbM/Nhmp1J7fiFIgvFjjA3HiiF+BUTEeNIZoyeaaAFcLMxeSevDQ99Dhad0UyJ4q2b7nO/VMefipEJ2MKdF7BBb6mjqSuSviw2UCY4Bu+M9bjZx2JPqEYI4uzsh/zCnEmgGX73WrHf9IOniPXdohiI1KLREsPaYJMoO9PckcipJPR4ZRJJUsCZECVDdpIYwyUkq0gwYLHcbqdBjbbKwF3koiZvWe/myq5eI3AWChmYV3yUYE49D6k= patri@DESKTOP-C1I06IV"
}

#Network Interface

resource "aws_network_interface" "main" {
  subnet_id   = aws_subnet.public_subnet.id
  # public_ips = ["10.0.1.37"]
  private_ips     = ["10.0.1.57"]
  security_groups = [aws_security_group.vpc.id]

  tags = {
    name = "primary_network_interface"
  }
}

resource "aws_network_interface" "main" {
  subnet_id   = aws_subnet.public_subnet.id
  # public_ips = ["10.0.1.37"]
  private_ips     = ["10.0.1.57"]
  security_groups = [aws_security_group.vpc.id]

  tags = {
    name = "primary_network_interface"
  }
}

#AWS EC2 Instance with user data and instance profile which attaches the IAM role
resource "aws_instance" "linux" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  iam_instance_profile = "${aws_iam_instance_profile.EC2_profile.name}"
  user_data = "${file("install.sh")}" 

  network_interface {
    network_interface_id = aws_network_interface.main.id
    device_index         = 0
  }

tags = {

  Name = "Linux"
}
              
}

# Systems manager parameter creation -- This will store the custom metrics configuration

resource "aws_ssm_parameter" "secret" {
  name        = "/alarm/AWS-CWAgentLinConfig"
  description = "Custom Metrics"
  type        = "String"
  value       = "${file("SSM_Parameter.json")}"

}
