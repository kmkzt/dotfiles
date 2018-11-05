# AWS CLI Setup 
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-install-macos.html

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
./awscli-bundle/install -h