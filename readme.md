<!DOCTYPE html>
<html>

<body>
<h1>AWS Infrastructure Deployment with Terraform</h1>

<h2>Overview</h2>

<p>This Terraform project automates the creation of an AWS Virtual Private Cloud (VPC) and deploys an EC2 instance and an RDS instance within it. It follows best practices, utilizing Terraform modules for modularity, AWS S3 for remote state management, and DynamoDB for state locking.</p>

<h2>Prerequisites</h2>

<p>Before running the Terraform scripts, ensure you have the following:</p>
    <ul>
        <li><a href="https://www.terraform.io/downloads.html">Terraform</a> installed.</li>
        <li>AWS credentials configured with sufficient permissions.</li>
    </ul>

<h2>Project Structure</h2>

 <ul>
        <li><strong><code>version.tf</code>:</strong> Specifies the version of the required provider</li>
        <li><strong><code>main.tf</code>:</strong> Defines the AWS resources using Terraform modules.</li>
        <li><strong><code>vpc.tf</code>:</strong> Defines the VPC and Subnets</li>
        <li><strong><code>variables.tf</code>:</strong> Contains input variables to make the modules reusable.</li>
        <li><strong><code>outputs.tf</code>:</strong> Specifies essential information about the deployed resources.</li>
        <li><strong><code>backend.tf</code>:</strong> Configures remote state management using AWS S3 and DynamoDB.</li>
        <li><strong><code>security.tf</code>:</strong> Configures the security groups.</li>

</ul>

<h2>Usage</h2>

<ol>
        <li>Clone the repository:
            <pre><code>git clone https://github.com/Ycaptn/terraform_module.git
cd terraform_module
            </code></pre>
        </li>
        <li>Update the <code>variables.tf</code> file with your desired configurations.</li>
        <li>Initialize the Terraform configuration:
            <pre><code>terraform init
            </code></pre>
        </li>
        <li>Review the planned changes:
            <pre><code>terraform plan
            </code></pre>
        </li>
        <li>Apply the changes:
            <pre><code>terraform apply
            </code></pre>
        </li>
        <li>Confirm the changes when prompted.</li>
    </ol>

<h2>Outputs</h2>

<p>After deployment, the following information will be displayed:</p>
    <ul>
        <li>EC2 Instance IP</li>
        <li>RDS Instance DNS Name</li>
        <li>Other relevant details</li>
    </ul>

<h2>Cleanup</h2>

<p>To destroy the created infrastructure:</p>
    <pre><code>terraform destroy
    </code></pre>
    <p>Confirm the destruction when prompted.</p>

<h2>Notes</h2>

<ul>
        <li>Make sure to handle sensitive information (like AWS credentials) securely.</li>
        <li>Refer to Terraform documentation for advanced configurations and customization.</li>
    </ul>
    </body>
    </html>