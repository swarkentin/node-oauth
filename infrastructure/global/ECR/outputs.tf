output "ecr-arn" {
  value = "${aws_ecr_repository.repository.arn}"
}