# terraform-infrastructure

1. Create `ssh-keys.txt`

    ```bash
    thaiminhpv:ssh-rsa ... thaiminhpv@MinhDesktop
    thaiminhpv:ssh-rsa ... minhpvt@minhpvt-PC
    ```

2. Create `terraform.tfvars`

    ```bash
    cp terraform.tfvars.example terraform.tfvars
    ```

    Then, fill in the variables.

3. Run

    ```bash
    terraform init
    terraform plan
    terraform apply
    # terraform apply -auto-approve
    # terraform destroy
    ```
