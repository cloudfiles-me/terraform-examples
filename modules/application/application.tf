provider "aws" {
  access_key = "AKIAJYL3I5F7S3NS4SAQ"
  secret_key = "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"
  region     = "${var.region}"
}

resource "aws_instance" "web-srv" {
  count             = 2
  ami               = "${var.ami_id}"
  instance_type     = "t2.micro"
  availability_zone = "${element(var.azs, count.index)}"

  # subnet_id              = "${var.az-a}"
  vpc_security_group_ids = ["${var.default_sg}"]
  iam_instance_profile   = "EC2-S3-ReadOnly"
  key_name               = "${var.keyname}"

  user_data = <<EOF
#!/bin/bash
apt-get update && apt-get install -y apache2 php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-simplexml git apg
export pass=`apg -n 1 -m 12`
echo "mysql-server mysql-server/root_password password $${pass}" | sudo debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password $${pass}" | sudo debconf-set-selections
echo $pass > /root/mysq_pass_remove.txt
apt-get install -y mysql-server
update-rc.d apache2 defaults
update-rc.d mysql defaults
rm -rf /var/www/html/index.html
echo "<html><body><h1>WEB SERVER :: web-srv-${var.region}-${count.index} :: ${var.region}</h1></body></html>" >> /var/www/html/index.html
EOF

  tags {
    Name = "web-srv-${var.region}-${count.index}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

/*
resource "aws_eip" "web_public_ip" {
  instance = "${aws_instance.web01-az-a.id}"
  vpc      = true
}
*/

