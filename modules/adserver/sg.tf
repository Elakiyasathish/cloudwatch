#create security group for an Instance
resource "aws_security_group" "SG" {
  description = "Security group for ${var.ad_env} ${var.ad_instance_name}"
  name        = "${var.ad_instance_name}-${var.ad_env}-SG"
  vpc_id      = var.ad_vpc

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
