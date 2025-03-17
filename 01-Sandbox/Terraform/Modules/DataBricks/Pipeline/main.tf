resource "databricks_pipeline" "aria-pipeline" {
  name    = "aria-pipeline"
  storage = "/test/first-pipeline"
  configuration = {
    repo_path = var.repo_path
    notebook_path = var.notebook_path
  }

  cluster {
    label       = "default"
    num_workers = 1
    custom_tags = {
      cluster_type = "default"
    }
  }

  cluster {
    label       = "maintenance"
    num_workers = 1
    custom_tags = {
      cluster_type = "maintenance"
    }
  }

  library {
    notebook {
      path = var.notebook_path
    }
  }

}