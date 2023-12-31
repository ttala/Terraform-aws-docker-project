# Terraform-aws-docker-project
In this project I have set up a configuration to deploy a web game application using Terraform, AWS  Elastic Beanstalk and Docker. 
 Terraform will create an Elastic Beanstalk instance based on the provided Docker application file. Then Elastic Beanstalk will push the Docker image onto the instance and deploy the application. Finally, you'll be able to access your application using the URL provided by Elastic Beanstalk.  

![image](https://github.com/ttala/Terraform-aws-docker-project/assets/42340621/ce407110-0ab6-47cf-9d33-8e4cf42ab8f3)

# Prerequisites
AWS account.  
AWS CLI with required access and permissions to deploy resources.  
Terraform.  

# Installation 
Clone this repository to your local machine.  
Navigate to the project directory.  
Update the **vars.tf** with your variables.
Run the command **terraform init** to initialize Terraform and download the required providers.  
Run the command **terraform apply** to create the resources on AWS.  
After confirming that the application is running, remember to execute **terraform destroy** to deprovision the infrastructure on AWS and avoid incurring extra charges.    

![image](https://github.com/ttala/Terraform-aws-docker-project/assets/42340621/1a3d6495-eb0e-450b-8294-92da066a6d6c)


# Acknowledgements
The game app code used in this project has been taken from [gabrielecirulli](https://github.com/gabrielecirulli) repository.
