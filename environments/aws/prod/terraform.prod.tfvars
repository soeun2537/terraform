region              = "ap-northeast-2"
profile             = "default"
project_name        = "festabook"
key_name            = "soeun2537"

vpc_cidr            = "10.50.0.0/16"
public_subnet_cidr  = "10.50.1.0/24"

instance_type        = "t4g.micro"
root_block_device_size = 8
additional_tags = {
    Environment = "prod"
}