#--main/iam--

resource "aws_iam_role" "codepipeline-role" {
  
  name = "${var.codepipeline_role_name}-${random_string.unique_suffix.result}"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action":"sts:AssumeRole",
            "Principal": {
                "Service": "codepipeline.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

data "aws_iam_policy_document" "cicd-pipeline-policies" {
   
    statement{
        sid = ""
        actions = ["codestar-connections:UseConnection"]
        resources = ["*"]
        effect = "Allow"
    }
    statement{
        sid = ""
        actions = ["cloudwatch:*", "s3:*", "codebuild:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "cicd-pipeline-policy" {
   
    name = "cicd-pipeline-policy-${random_string.unique_suffix.result}"
    path = "/"
    description = "Pipeline policy"
    policy = data.aws_iam_policy_document.cicd-pipeline-policies.json
}

resource "aws_iam_role_policy_attachment" "cicd-pipeline-attachment" {
   
    policy_arn = aws_iam_policy.cicd-pipeline-policy.arn
    role = aws_iam_role.codepipeline-role.id
}

data "aws_iam_policy_document" "cicd-build-policies" {
   
    statement{
        sid = ""
        actions = ["logs:*", "s3:*", "codebuild:*", "secretsmanager:*","iam:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "cicd-build-policy" {
   
    name = "cicd-build-policy-${random_string.unique_suffix.result}"
    path = "/"
    description = "Codebuild policy"
    policy = data.aws_iam_policy_document.cicd-build-policies.json
}

#--codebuild-role-policies--

resource "aws_iam_role" "codebuild-role" {
 
  name = var.codebuild_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "cicd-codebuild-attachment1" {
   
    policy_arn  = aws_iam_policy.cicd-build-policy.arn
    role        = aws_iam_role.codebuild-role.id
}

resource "aws_iam_role_policy_attachment" "cicd-codebuild-attachment2" {
   
    policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    role        = aws_iam_role.codebuild-role.id
}


# Attach policies to the role
resource "aws_iam_role_policy_attachment" "codebuild_logs" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeBuildAdminAccess"
  role       = aws_iam_role.codebuild-role.name
}

resource "aws_iam_role_policy_attachment" "cloudwatch_sns" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCloudWatchFullAccess"
  role       = aws_iam_role.codebuild-role.name
}



