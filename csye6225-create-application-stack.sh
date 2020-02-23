if [ $# -ne 7 ] 
then
        echo "Script required 7 parameters!" 
        echo "./csye6225-create-application-stack.sh <stackname> <Ami_Image> <VPCName> <networkStackName> <s3bucketName> <EC2Size> <RDSize>"
        exit 1
fi
stackname="$1";
Ami_Image="$2";
VPCName="$3";
networkStackName="$4";
s3bucketName="$5";
EC2Size="$6";
RDSize="$7";

echo "$stackName Stack creation in progress..."

stackID=$(aws cloudformation create-stack --stack-name $1 --template-body file://application.json --parameters ParameterKey=AMI,ParameterValue=$Ami_Image ParameterKey=VPCName,ParameterValue=$VPCName ParameterKey=networkStackName,ParameterValue=$networkStackName ParameterKey=s3bucketName,ParameterValue=$s3bucketName ParameterKey=EC2Size,ParameterValue=$EC2Size ParameterKey=RDSize,ParameterValue=$RDSize --capabilities CAPABILITY_NAMED_IAM --query [StackId] --output text)

if [ $? -eq "0" ]
then
echo "Stack Name: $1 created!"
echo "Stack ID: $stackID"
fi

aws cloudformation wait stack-create-complete --stack-name $stackID
if [ $? -ne "0" ]
then 
	echo "Stack Creation Failed!"
else
	echo "Stack Creation Successful!"
fi