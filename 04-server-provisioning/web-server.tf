resource "aws_instance" "web" {
  ami = "ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              # Update the apt-get cache
              sudo apt-get update

              # Install Apache
              sudo apt-get install -y apache2

              # Install PHP
              sudo apt-get -y install libapache2-mod-php

              # Copy code repository
              sudo git clone https://github.com/doxic/php-app /var/www/html/app

              # Start Apache
              sudo service apache2 start
              EOF

  tags {
    Name = "web1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "instance" {
  name = "teachtalk-example-instance"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}
