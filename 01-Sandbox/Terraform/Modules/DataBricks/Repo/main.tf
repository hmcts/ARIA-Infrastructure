resource "databricks_repo" "aria-db-repo-JOH" {
  url = "https://dev.azure.com/amcdevitt/Terraform%20CICD%20Test/_git/CarWorkshop.MVC.git"
  git_provider = "azureDevOpsServices"
  path = "/Repos/test/JOH"
}