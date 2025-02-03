# we use tf vars when we dont want to print from variables fiel,
# tf vars will replace values in variables file
# if we dont even want to get op as in tf vars then we will go with command line
# 1st preference is CLI >>> 2nd is tfvars >>> 3rd is environment variable >>>4th is variables file or default values
# CLI usage ===> terraform plan -var="instance_type=t3.medium"
# Environment variables usage ===> export TF_VAR_instance_type=t3.large

instance_type = "t3.micro"

