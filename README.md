### TERRAFROM

Below is the environment setup.

**Softwares Required:**

* VS Code
* Terraform
* AWS CLI V2

**Steps:**

* Create IAM administrator user. Copy the access key and secret key. Don't push to any GitHub or internet.
* Configure user in your laptop using
```
aws configure
```
* Add the terraform path to system variables.

![alt text](terraform.jpg)


Terraform is popular IaC (Infrastructure as a Code) tool. It is best in the market now.

* **Version Control:** <br />

    Since it is code, we can maintain in Git to version control. We can completely maintain the history of infra and collaboration is easy.

* **Consistent Infra:** <br />

    Often we face the problem of different configurations in different environments like DEV, QA, PROD, etc. Using terraform we can create similar infra in multiple environments with more reliability.

* **Automated Infra CRUD:** <br />

    Using terraform we can create entire infra in minutes reducing the human errors.
    Updating infra using terraform is also easy.
    Using Terraform we can delete infra.

* **Inventory Management:** <br />

    If we create infra manually it is very tough to maintain the inventory of resources in diff region. But by seeing terraform you can easily tell the resources you are using in different regions.

* **Cost Optimisation:** <br />

    When you need infra you can create in minutes. When you don't you can delete in minutes, so you can save the cost.

* **Automatic dependency management:** <br />

    terraform can understand the dependency of resources. It can tell us the dependency clearly.

* **Modular Infra:** <br />
    Code reuse. We can develop our own modules our use open source modules to reuse the infra code. instead of spending more time to create infra from the scratch we can reuse modules.

#### Terraform Commands

* First command is to initialize the terraform, at this stage terraform downloads the provider into .terraform folder.

```
terraform init
```

* Next we need to run plan command, at this stage terraform compares the infra between declared and existing. This is only plan terraform will not create

```
terraform plan
```

* Next we need to apply the infra, at this stage terraform create the infra with approval.

```
terraform apply
```

# State
Terraform is a declarative way of approach. Declarative means whatever you write(declare) you will get it provided you will follow proper syntax.

Whenever terraform creates infra, it will create file called terraform.tfstate, it needs someway to track what it created, that is state file

TF files = whatever we want = Desired infra
terraform.tfstate = Actual Infra = current state of Infra

Terraform responsibility is to maintain

Desired Infra = Actual Infra

# Remote State
keeping terraform.tfstate in local is a problem,

    if you lose the data then terraform can't track what happened earlier. It will try to recreate again.

    In case of version control, keeping the terraform state in GitHub also causes problem while infra is creating through CICD. If multiple triggers to the pipeline then duplicate infra would be created.
    It is best practice to keep the state file in remote locations like S3 for better collaboration between team members.
Now where ever we run terraform apply it connects to S3 and avoid the situations of duplicate infra. We need to lock with dynamodb so that multiple persons can't apply at the same time.

# Variables
Variables are useful to define values that can be reused across many resources. A central place where a change of value can be reflected everywhere it is used.

Datatypes of variables in terraform are

string
number
list
map
boolean
variable "region" {
  type = string
  default = "us-west-2"
}

variable "port" {
  type = number
  default = 8080
}

variable "subnets" {
  type = list(string)
  default = ["subnet-1234abcd", "subnet-5678efgh"]
}

variable "tags" {
  type = map(string)
  default = {
    Name = "web-server"
    Environment = "dev"
  }
}
We use variables.tf file to declare variables, we can place default values here. terraform.tfvars is the file we declare the default values. We can override variable values from command line using -var "key=value".

# Best Way:
Create variables.tf and terraform.tfvars
    Place default values in variables.tf
    Override default values using terraform.tfvars. We usually don't commit terraform.tfvars into Git so that users can define their own values.
    Any variable can be overriden at run time using -var "key=value"