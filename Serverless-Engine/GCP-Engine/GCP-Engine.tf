resource "google_project_service" "cloud_run_api" {
    service = "run.googleapis.com"
  
}

resource "google_cloud_run_v2_service" "gcp-cloud-run" {
    name = var.resource_name
    location = ""
    ingress = ""
    project = ""

    template {
      containers {
        image = ""
        resources {
          limits = {
            cpu = "2"
            memory = "1024Mi"
          }
        }
      }
    }
    depends_on = [ google_project_service.cloud_run_api ]
  
}

data "google_iam_policy" "noauth" {
    binding {
      role = "roles/run.invoker"
      members = [
        "allUsers",
      ]
    }
  
}


resource "google_cloud_run_service_iam_policy" "noauth" {
    location = google_cloud_run_v2_service.gcp-cloud-run.location
    project = google_cloud_run_v2_service.gcp-cloud-run.project
    service = google_cloud_run_v2_service.gcp-cloud-run.name
    policy_data = data.google_iam_policy.noauth.policy_data
  
}