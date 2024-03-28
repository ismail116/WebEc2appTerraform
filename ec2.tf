#instance
resource "aws_instance" "instancen" {
  ami                         = "ami-080e1f13689e07408" # this desired AMI ID
  instance_type               = var.ec2                 # this desired instance type
  subnet_id                   = aws_subnet.subnetn.id
  associate_public_ip_address = true                                # Assign a public IP address to the instance
  security_groups             = [aws_security_group.instance_sg.id] # Associate the instance with the security group

  # user_data                   = <<-EOF
  #             #!/bin/bash
  #             sudo apt-get update
  #             sudo apt-get install -y apache2
  #             sudo systemctl start apache2
  #             sudo systemctl enable apache2
  #             EOF
  user_data = file("script.sh")

  tags = {
    Name = "task1-instance"
  }
  volume_tags = {
    Name = "web_instance"
  }
}