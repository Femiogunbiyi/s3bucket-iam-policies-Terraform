resource "aws_s3_bucket" "main" {
  bucket = "my-ami-bucket-policy"
}

resource "aws_iam_policy" "policydocument" {
  name   = "tf-policydocument"
  policy = data.aws_iam_policy_document.example.json
}

data "aws_iam_policy_document" "example" {
  statement {
    actions = ["s3:ListBucket"]
    resources = [aws_s3_bucket.main.arn,
    "${aws_s3_bucket.main.arn}/*"]
    effect = "Allow"
  }
  statement {
    actions = ["s3:GetObject", "s3:PutObject"]
    resources = [aws_s3_bucket.main.arn,
    "${aws_s3_bucket.main.arn}/*"]
    effect = "Allow"
  }
}
