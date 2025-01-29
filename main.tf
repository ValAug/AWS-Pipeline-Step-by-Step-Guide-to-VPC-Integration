#---main/pipeline--

resource "aws_codebuild_project" "plan" {
  
  name          = "${var.buildproject_plan_name}-${random_string.unique_suffix.result}"
  description   = "Plan stage for terraform"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

    environment {
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    
}

 source {
     type   = "CODEPIPELINE"
     buildspec = "buildspec-plan.yml"
 }
 logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.codebuild_log_group.name
      stream_name = "plan-build-log"
    }
  }
}

resource "aws_codebuild_project" "apply" {
    
  name          = "${var.buildproject_apply_name}-${random_string.unique_suffix.result}"
  description   = "Apply stage for terraform"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    
}

 source {
     type   = "CODEPIPELINE"
     buildspec = "buildspec-apply.yml"
 }
 logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.codebuild_log_group.name
      stream_name = "apply-build-log-${random_string.unique_suffix.result}"
    }
  }
}

resource "aws_codepipeline" "cicd_pipeline" {
    
    name = "${var.cicd_pipeline_name}-${random_string.unique_suffix.result}"
    role_arn = aws_iam_role.codepipeline-role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.codepipeline_artifact.id
    }

    stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["code"]
            configuration = {
                FullRepositoryId = "ADD FULL REPO ID HERE/REPO NAME"
                BranchName   = "dev"
                ConnectionArn = var.codestart_connector_credential
                OutputArtifactFormat = "CODE_ZIP"
            }
        }
    }

    stage {
        name ="Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["code"]
            output_artifacts = [ "build" ]
            configuration = {
                ProjectName = aws_codebuild_project.plan.name
            }
        }
    }

    stage {
        name ="Deploy"
        action{
            name = "Deploy"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["build"]
            configuration = {
                ProjectName = aws_codebuild_project.apply.name
            }
        }
    }

}


