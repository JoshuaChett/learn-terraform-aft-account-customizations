resource "aws_s3_bucket" "long_term_data_store" {
  bucket = "archive"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.long_term_data_store.id
  acl    = "private"
}





#An IAM user with full access to S3 - Unless this should be configured through the root identity center
#I think it may actually make sense to have a bucket per data source, 
