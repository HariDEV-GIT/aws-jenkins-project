resource "aws_iam_role_policy_attachment" "policy_attach" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.s3_role.name
}

/*resource "aws_iam_role_policy_attachment" "role1_policy2" {
  policy_arn = aws_iam_policy.example_policy_2.arn
  role       = aws_iam_role.example_role_1.name
}

resource "aws_iam_role_policy_attachment" "role1_policy3" {
  policy_arn = aws_iam_policy.example_policy_3.arn
  role       = aws_iam_role.example_role_1.name
}

resource "aws_iam_role_policy_attachment" "role2_policy1" {
  policy_arn = aws_iam_policy.example_policy_1.arn
  role       = aws_iam_role.example_role_2.name
}

resource "aws_iam_role_policy_attachment" "role2_policy2" {
  policy_arn = aws_iam_policy.example_policy_2.arn
  role       = aws_iam_role.example_role_2.name
}

resource "aws_iam_role_policy_attachment" "role2_policy3" {
  policy_arn = aws_iam_policy.example_policy_3.arn
  role       = aws_iam_role.example_role_2.name
}

resource "aws_iam_role_policy_attachment" "role3_policy1" {
  policy_arn = aws_iam_policy.example_policy_1.arn
  role       = aws_iam_role.example_role_3.name
}

resource "aws_iam_role_policy_attachment" "role3_policy2" {
  policy_arn = aws_iam_policy.example_policy_2.arn
  role       = aws_iam_role.example_role_3.name
}

resource "aws_iam_role_policy_attachment" "role3_policy3" {
  policy_arn = aws_iam_policy.example_policy_3.arn
  role       = aws_iam_role.example_role_3.name
}
*/
