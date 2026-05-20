resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install git -y
              dnf install nodejs -y

              cd /home/ec2-user

              git clone https://github.com/FerSV4/legacy-billing.git

              cd legacy-billing

              npm install

              nohup npm start > app.log 2>&1 &
              EOF

  tags = {
    Name = "legacy-billing-server"
  }
}