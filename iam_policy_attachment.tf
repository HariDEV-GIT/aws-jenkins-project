resource "aws_iam_role_policy_attachment" "policy_attach" {
  policy_arn = aws_iam_policy.policy.arn
  role       = aws_iam_role.s3.name
}

//backend deny
resource "aws_iam_policy_attachment" "attach_deny_policy" {
  name       = "attach_deny_policy"
  policy_arn = aws_iam_policy.deny_s3_access.arn
  roles      = [aws_iam_role.terraform_role.name]
}
