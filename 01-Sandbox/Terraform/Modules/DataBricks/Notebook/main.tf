resource "databricks_notebook" "aria-joh" {
  path = "/Users/a.mcdevitt@reply.com/test_notebooks/test"
  language = "PYTHON"
  format = "SOURCE"

  # Create an empty notebook
  content_base64 = base64encode("test string")

}