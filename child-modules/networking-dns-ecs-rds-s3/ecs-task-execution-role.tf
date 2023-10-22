#0. Create ECS task Execution Role

resource "aws_iam_role" "ecs-task-execution-role" {
  name = "${var.project_name}-ecsTaskExecutionRole"
 
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs-task-execution-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_iam_policy" "ecs-s3-access" {
  name        = "ecs-s3-access-policy"
  description = "Policy to grant ECS tasks access to S3 bucket"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
        ],
        Effect = "Allow",
        Resource = [
          aws_s3_bucket.aistartupstorage102023.arn,
          "${aws_s3_bucket.aistartupstorage102023.arn}/*",
        ],
      },
    ],
  })
 #depends_on = [module.s3-bucket]
}

resource "aws_iam_policy_attachment" "ecs-s3-access-attachment" {
  name       = "ecs-s3-access-attachment"
  policy_arn = aws_iam_policy.ecs-s3-access.arn
  roles      = [aws_iam_role.ecs-task-execution-role.name]
}




