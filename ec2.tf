resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
          #!/bin/bash
          apt-get update  -y
          apt-get install -y nginx git
          systemctl enable nginx
          syatemctl start nginx
          rm -rf /var/www/html/*
          git clone https://github.com/abhipraydhoble/templates.git /tmp/templates
          cp -r /tmp/templates/${var.website_folder}/* /var/www/html/
          chown -R www-data:www-data /var/www/html
          systemctl restart nginx
          
          EOF

  tags = {
    Name = "terraform-web-server"
  }



}
