resource "google_project_service" "container-service" {
    project = var.project-id
    service = "container.googleapis.com"
  
}

resource "google_project_service" "storage-service" {
    project = var.project-id
    service = "storage.googleapis.com"
  
}

resource "google_project_iam_member" "cluster-admin" {
    project = var.project-id
    role = "roles/container.clusterAdmin"
    member = "user:kumarmarimuthu99@gmail.com"
  
}

resource "google_project_iam_member" "storage-menber" {
    project = var.project-id
    role = "roles/storage.objectAdmin"
    member = "user:kumarmarimuthu99@gmail.com"
  
}

resource "google_container_registry" "gcr-1" {
    project = var.project-id
    location = "us-west2"
  
}

resource "google_container_cluster" "gcc-1" {
    project = var.project-id
    name = var.resource_name
    location = "us-wset2"
    initial_node_count = 3

    node_config {
      machine_type = "n1-standard-1"
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }

    network = "default"
    subnetwork = "default"
  
}