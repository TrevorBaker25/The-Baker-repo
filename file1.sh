#!/bin/bash

# Define the Terraform version and download URL
TERRAFORM_VERSION="1.8.1"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Define the installation directory
INSTALL_DIR="/usr/local/bin"

echo "Downloading Terraform..."
wget $DOWNLOAD_URL

echo "Unzipping Terraform..."
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

echo "Moving Terraform to ${INSTALL_DIR}..."
sudo mv terraform $INSTALL_DIR

echo "Copying Terraform to /bin for universal access..."
sudo cp "${INSTALL_DIR}/terraform" /bin/terraform

echo "Cleaning up the downloaded zip file..."
rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

echo "Installation complete. Verifying installation..."
terraform -version

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Terraform is installed successfully."
else
    echo "There was a problem installing Terraform."
fi