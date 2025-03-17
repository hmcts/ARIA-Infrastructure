# Output URL of the repository (used in TBC)
output "repo_url" {
    value = databricks_repo.aria-db-repo-JOH.url
}

# Output the path of the repository (used in Pipeline)
output "repo_path" {
    value = databricks_repo.aria-db-repo-JOH.path
}