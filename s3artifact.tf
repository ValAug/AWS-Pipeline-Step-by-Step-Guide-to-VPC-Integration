#--artifact-s3bucket---

resource "aws_s3_bucket" "codepipeline_artifact" {
  bucket = "${var.artifact_bucket_name}-${random_string.unique_suffix.result}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "codepipeline_bucket_versioning" {
  bucket = aws_s3_bucket.codepipeline_artifact.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_public_access_block" "codepipeline_bucket_block_pub_access" {
    bucket = aws_s3_bucket.codepipeline_artifact.id
    
    block_public_acls   = true
    block_public_policy = true

}

resource "aws_s3_bucket_server_side_encryption_configuration" "codepipeline_artifactbucket_side_encryption" {
  bucket = aws_s3_bucket.codepipeline_artifact.id

  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}