#create the bucket
resource "aws_s3_bucket" "long_term_data_store" {
  bucket = "learn-aft-sdi-archive"
}

#create the crowdstrike folder
resource "aws_s3_object" "crowdstrike_folder" {
  bucket = "learn-aft-sdi-archive"
  key    = "crowdstrike-archive/"
}

#create the corelight folder
resource "aws_s3_object" "corelight_folder" {
  bucket = "learn-aft-sdi-archive"
  key    = "corelight-archive/"
}

#add a lifecycle configuration to the bucket
resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.long_term_data_store.id

  rule {
    id     = "intelligent-tiering-and-glacier-instant-retrieval"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "INTELLIGENT_TIERING"
    }

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}