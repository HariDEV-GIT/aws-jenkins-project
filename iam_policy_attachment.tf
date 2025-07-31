resource "aws_iam_role_policy_attachment" "policy_attach" {
  policy_arn = aws_iam_policy.policy.arn
  role       = aws_iam_role.s3.name
}
