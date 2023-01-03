provider "aws" {
  region     = "us-east-1"
}


resource "aws_instance" "web" {
   ami = "ami-0b5eea76982371e91"
   instance_type = "t2.micro"
   key_name = "terraform-key"

   connection {
   type     = "ssh"
   user     = "ec2-user"
   private_key = file("./trfm.pem")
   host     = self.public_ip
    }

 provisioner "remote-exec" {
   inline = [
     "sudo amazon-linux-extras install -y nginx1",
     "sudo systemctl start nginx",
     "sudo yum install -y git",
     "clone https://github.com/dharam123/hello-world.git"
    
   ]
 }
}
 
