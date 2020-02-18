### Pre-requisites:
* Install AWS CLI
* Set profile, config, credentials

### For creation:
* On terminal navigate to path :infrastructure/
* Run chmod +x csye6225-create-stack.sh
* Run ./csye6225-create-stack.sh <stackname> <awsregion> <vpccidr> <subnet1cidr> <subnet2cidr> <subnet3cidr> <vpcname>

### For Termination:
* On terminal navigate to path :infrastructure/
* Run chmod +x csye6225-terminate-stack.sh <variables>
* Run ./csye6225-terminate-stack.sh