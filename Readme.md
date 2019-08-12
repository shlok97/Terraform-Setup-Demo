# Make sure you're in the setup-library
# Generate a key using:

ssh-keygen -f mykey

chmod 400 mykey

# Install Terraform
sudo snap install terraform

# Add your AWS Credentials by creating the terraform.tfvars file
touch terraform.tfvars
sudo nano terraform.tfvars

# Paste the following values and set them to your IAM values
AWS_ACCESS_KEY=""
AWS_SECRET_KEY=""

# Add "StrictHostKeyChecking no" in your /etc/ssh/ssh_config file by running
sudo sh -c "echo '    StrictHostKeyChecking no' >> /etc/ssh/ssh_config"

# Initialise terraform and apply to generate the servers:
terraform init
terraform apply <<< "yes"

# to destroy the terraform created servers:
terraform destroy <<< "yes"

https://medium.com/faun/building-repeatable-infrastructure-with-terraform-and-ansible-on-aws-3f082cd398ad

https://alex.dzyoba.com/blog/terraform-ansible/

# Install pip
sudo apt-get install python-setuptools
sudo apt install python-pip
# Install Ansible

pip install ansible

or

sudo apt install ansible

# Install terraform-inventory to connect with ansible from the following link using wget
https://github.com/adammck/terraform-inventory/releases/download/v0.9/terraform-inventory_0.9_darwin_amd64.zip

# Running the following command gets the Ansible inventory (Optional)

terraform-inventory --list ./

TF_STATE=./ /usr/local/bin/terraform-inventory --inventory

TF_STATE=./ ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory --private-key=./mykey playbook.yml

# Edit ansible config file

sudo nano /etc/ansible/ansible.cfg

# Add the following lines below [default] in ansible.cfg file

remote_user = ec2-user
private_key_file = /home/shlokkapoor/Terraform-Setup-Demo/mykey
ansible_ssh_private_key_file = /home/shlokkapoor/Terraform-Setup-Demo/mykey

# Run the below command to deploy the app into the servers created

TF_STATE=./ ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory playbook.yml


# To conclude, the main steps required to set up and deploy projects on servers, navigate to setup directory

terraform destroy <<< "yes"
terraform init
terraform apply <<< "yes"

TF_STATE=./ ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory playbook.yml
