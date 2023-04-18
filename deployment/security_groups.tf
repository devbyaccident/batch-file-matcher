# Create a security group
resource "aws_security_group" "my_security_group" {
  name_prefix = "my-security-group"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
