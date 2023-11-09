data "template_file" "cloudwatch_agent_config" {
  template = file("/home/ec2-user/terraform/templates/cloudwatch_agent_configuration.json")

  vars = {
    instance_id = aws_instance.insurity.id
  }
}

resource "aws_instance" "insurity" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "demo"
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "insurity-${var.ad_instance_name}-${var.ad_env}"
  }

  user_data = <<-EOF
<powershell>
# PowerShell script to install and configure the CloudWatch agent

# Specify the path to the rendered configuration file
$configFile = "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent.json"

# Download the CloudWatch Agent installer
Invoke-WebRequest -Uri "https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/AmazonCloudWatchAgent.zip" -OutFile "$env:TEMP\AmazonCloudWatchAgent.zip"

# Extract the installer
Expand-Archive -Path "$env:TEMP\AmazonCloudWatchAgent.zip" -DestinationPath "$env:TEMP\AmazonCloudWatchAgent"

# Install the agent
Set-Location -Path "$env:TEMP\AmazonCloudWatchAgent"
.\install.ps1

# Use the template_file data to get the rendered CloudWatch agent configuration
$cloudwatchConfig = Get-Content("/home/ec2-user/terraform/templates/cloudwatch_agent_configuration.json")

# Save the configuration to a file
$cloudwatchConfig | Set-Content -Path $configFile -Force

# Start the CloudWatch agent
Start-Process -NoNewWindow -FilePath "powershell.exe" -ArgumentList "-File `"C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1`" -a start -m ec2 -s"
</powershell>
EOF
}
