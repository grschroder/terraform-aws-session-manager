data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_instance_profile" "role-ec2-instance-profile" {
  name = "role-ec2-instance-profile"
  role = aws_iam_role.role-ec2-session-manager-role.name
}

resource "aws_iam_role" "role-ec2-session-manager-role" {
  name               = "role-ec2-session-manager-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy" "AmazonSSMManagedEC2InstanceDefaultPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
}

resource "aws_iam_role_policy_attachment" "attach-ec2-session-manager" {
  role       = aws_iam_role.role-ec2-session-manager-role.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedEC2InstanceDefaultPolicy.arn
}
