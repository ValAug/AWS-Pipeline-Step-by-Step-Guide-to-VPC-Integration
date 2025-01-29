#--main/variable--

variable "artifact_bucket_name" {
    default = "cicd-pipeline-artifacts-bucket"
}


variable "codestart_connector_credential" {
  type = string
}

variable "buildproject_plan_name" {
  default = "cicd-plan"
}

variable "buildproject_apply_name" {
  default = "cicd-apply"
}


variable "cicd_pipeline_name" {
  default = "backend-pipeline"
}

variable "codepipeline_role_name" {
  default = "codepipeline-role"
}

variable "codebuild_role_name" {
  default = "codebuild-role"
}


variable "notification_emails" {
  default = ["email1@example.com", "email2@example.com", "email3@example.com"]
  }