resource "aws_s3_bucket" "game42" {
  bucket = var.BUCKET
}

resource "aws_s3_object" "game42-version" {
  bucket = aws_s3_bucket.game42.id
  key    = var.KEY
  source = "Dockerfile"
}

resource "aws_elastic_beanstalk_application" "game42" {
  name        = "game-2048"
  description = "2048 game building using Elastic Beanstlak"
}

resource "aws_elastic_beanstalk_application_version" "game42" {
  name        = "game42-version"
  application = aws_elastic_beanstalk_application.game42.name
  description = aws_elastic_beanstalk_application.game42.description
  bucket      = aws_s3_object.game42-version.bucket
  key         = aws_s3_object.game42-version.key
}


resource "aws_elastic_beanstalk_environment" "env-game42" {
  name                = "game-2048"
  application         = aws_elastic_beanstalk_application.game42.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.1.0 running Docker"
  version_label       = aws_elastic_beanstalk_application_version.game42.name
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = "aws-elasticbeanstalk-ec2-role"
  }

}

# To print the env CNAME after creation
output "env_cname" {
  value = "http://${aws_elastic_beanstalk_environment.env-game42.cname}"
}