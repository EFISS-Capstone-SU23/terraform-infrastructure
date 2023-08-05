# terraform-infrastructure

### NOTE: Only use CI/CD to update infrastructure, do not use local terraform unless you know what you are doing. This is to prevent terraform state from being out of sync.

You can update terraform.tfvars here [https://github.com/EFISS-Capstone-SU23/terraform-infrastructure/settings/variables/actions/TERRAFORM_TFVARS](https://github.com/EFISS-Capstone-SU23/terraform-infrastructure/settings/variables/actions/TERRAFORM_TFVARS)

## Setup using Github Action (recommended)

Add Github Actions with the following environment variables

1. Variables:

1.1. `TERRAFORM_TFVARS`

```bash
github_runner_token = ""
worker_join_token = ""
worker_join_hash_discover = ""
```

1.2. `SSH_KEYS`

```bash
thaiminhpv:ssh-rsa ... thaiminhpv@MinhDesktop
thaiminhpv:ssh-rsa ... minhpvt@minhpvt-PC
```

2. Secrets:

2.1. `GCS_BUCKET_CREDENTIALS_TFSTATE`

content of .json GCP file

2.2. `LONGNV_GCP`

content of .json GCP file

2.3. `MINHPVTHE172884FPT`

content of .json GCP file

## Local usage (not recommended)

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
