REGION_CODE=us-east-1 CLUSTER_NAME=scrumptious-rainbow-1773235332 ACC_ID=139355608147
### OIDC PROVIDER
eksctl utils associate-iam-oidc-provider \
    --region $REGION_CODE \
    --cluster $CLUSTER_NAME \
    --approve

### create IAM role and k8 service account. Mapping between IAM role and K8 service account
eksctl create iamserviceaccount \
--cluster=$CLUSTER_NAME \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::139355608147:policy/ROBOSHOP-MYSQL-SECRET-READER \
--override-existing-serviceaccounts \
--region $REGION_CODE \
--approve