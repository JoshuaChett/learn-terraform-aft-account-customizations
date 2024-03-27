resource "aws_s3_bucket" "long_term_data_store" {
  bucket = "learn-aft-sdi-archive"
}

resource "aws_s3_object" "crowdstrike_folder" {
  bucket = "learn-aft-sdi-archive"
  key    = "crowdstrike-archive/"
}

resource "aws_s3_object" "corelight_folder" {
  bucket = "learn-aft-sdi-archive"
  key    = "corelight-archive/"
}