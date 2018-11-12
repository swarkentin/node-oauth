module "backend" {
  source = "../../modules/backend"

  bootstrap      = "${terraform.workspace == "base" ? 1 : 0}"
  operators      = "${local.operators}"
  bucket         = "${var.bucket}"
  dynamodb_table = "${var.dynamodb_table}"
  key            = "${var.key}"
}

provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

# This defines the ECR repository where docker images will be added
resource "aws_ecr_repository" "repository" {
  name = "${var.ecr-repository-name}"
}

# This policy removes all docker images without a tag that are older than 1 day
resource "aws_ecr_lifecycle_policy" "delete-untagged-policy" {
  repository = "${aws_ecr_repository.repository.name}"

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 1 day",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}