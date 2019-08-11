Generate key using:

ssh-keygen -f mykey

chmod 400 mykey

terraform init
terraform apply <<< "yes"

https://medium.com/faun/building-repeatable-infrastructure-with-terraform-and-ansible-on-aws-3f082cd398ad

https://alex.dzyoba.com/blog/terraform-ansible/

# Install pip
sudo apt-get install python-setuptools
sudo apt install python-pip
# Install Ansible

pip install ansible

or

sudo apt install ansible


# Running the following command gets the Ansible inventory

terraform-inventory --list ./

TF_STATE=./ /usr/local/bin/terraform-inventory --inventory

TF_STATE=./ ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory playbook.yml

TF_STATE=./ ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory --private-key=./mykey playbook.yml

# Setup ansible config file

sudo nano /etc/ansible/ansible.cfg
