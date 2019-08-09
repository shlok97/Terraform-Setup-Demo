resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"

  vpc_security_group_ids = ["sg-0e762a61"]
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"


}

resource "null_resource" "connect_bastion1" {
  connection {
    type = "ssh"
    host = "${self.public_ip}"
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
  provisioner "remote-exec" {
    inline = [
      "mkdir new_folder",
      "ls"
    ]
  }
  depends_on = ["aws_instance.example"]
}
