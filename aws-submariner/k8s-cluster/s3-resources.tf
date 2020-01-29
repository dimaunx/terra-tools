resource "aws_s3_bucket" "thanos_store_bucket" {
  bucket        = "${var.base_name}-${var.aws_region}-prom"
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "${var.base_name}-${var.aws_region}-prom"
    Environment = "prometheus-thanos"
  }
}