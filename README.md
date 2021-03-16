# awsdevbot-app (uat env)

====================================

ECS app

1 )
+ UAT (305631072082) -> 
+ module: VPC, SG, ECS cluster
2 UAT -> 
+ CI CD pipeline for the ECS app 
(https://github.com/aws-samples/building-java-apps-using-code-pipeline)

3 Export logs to the external acc
https://aws.amazon.com/blogs/architecture/stream-amazon-cloudwatch-logs-to-a-centralized-account-for-audit-and-analysis/
https://github.com/aws-samples/amazon-cloudwatch-log-centralizer
https://github.com/awslabs/aws-data-lake-solution

====================================

4 +/- Tagging
  Enable logs for all resources
  SSM ec2 Bastion host, 
  Tag IAM Policy constrains, 
5 API Gateway custom auth + S3 Proxy, 
6 Step function with callback

https://github.com/aws-samples/amazon-rekognition-video-analyzer
https://github.com/aws-samples/lambda-refarch-imagerecognition
https://github.com/aws-samples/aws-xray-rekognition-lambda-sample
https://github.com/aws-samples/amazon-rekognition-custom-labels-demo
