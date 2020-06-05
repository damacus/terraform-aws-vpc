package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestTerraformAwsVpc(t *testing.T) {
	t.Parallel()
	awsRegion := aws.GetRandomStableRegion(t, []string{"us-east-1", "eu-west-1"}, nil)

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples",

		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	publicSubnetIds := terraform.OutputList(t, terraformOptions, "public_subnets")
	require.Equal(t, 3, len(publicSubnetIds))
	assert.True(t, aws.IsPublicSubnet(t, publicSubnetIds[0], awsRegion))

	privateSubnetIds := terraform.OutputList(t, terraformOptions, "private_subnets")
	require.Equal(t, 3, len(privateSubnetIds))
	assert.False(t, aws.IsPublicSubnet(t, privateSubnetIds[0], awsRegion))

	databaseSubnetIds := terraform.OutputList(t, terraformOptions, "database_subnets")
	require.Equal(t, 3, len(databaseSubnetIds))
	assert.False(t, aws.IsPublicSubnet(t, privateSubnetIds[0], awsRegion))

	vpc := terraform.OutputMap(t, terraformOptions, "vpc")
	require.Equal(t, "172.32.0.0/16", vpc["cidr_block"])

	natGateways := terraform.OutputList(t, terraformOptions, "nat_gws")
	require.Equal(t, 1, len(natGateways))
}
