import os
import json
import requests
import yaml

from jinja2 import Environment, PackageLoader, select_autoescape

repo_owner = os.environ.get('REPO_OWNER', os.environ.get('GITHUB_REPOSITORY_OWNER')).lower()
repo_name = os.environ.get('REPO_NAME', os.environ.get('GITHUB_REPOSITORY')).lower()

env = Environment(
  loader=PackageLoader("render-readme"),
  autoescape=select_autoescape()
)


def load_metadata_file_yaml(file_path):
  with open(file_path, "r") as f:
    return yaml.safe_load(f)


def load_metadata_file_json(file_path):
    with open(file_path, "r") as f:
        return json.load(f)


def load_metadata_file(file_path):
    if file_path.endswith(".json"):
        return load_metadata_file_json(file_path)
    elif file_path.endswith(".yaml"):
        return load_metadata_file_yaml(file_path)
    return None


def get_scheduled_release_workflow_url():
    r = requests.get(
      f"https://api.github.com/repos/{repo_name}/actions/workflows",
      headers={
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token " + os.environ["GITHUB_TOKEN"]
      }
    )
    if r.status_code != 200:
        print(f"Failed to get workflows for {repo_name}: {r.status_code}: {r.text}")
        return None
    data = r.json()
    for workflow in data["workflows"]:
        if workflow["name"] == "Scheduled Release":
            return workflow["html_url"]
    print(f"Couldn't find Scheduled Release workflow for {repo_name}")
    return None


def get_latest_image(name):
    r = requests.get(
      f"https://api.github.com/users/{repo_owner}/packages/container/{name}/versions",
      headers={
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token " + os.environ["GITHUB_TOKEN"]
      },
    )
    if r.status_code != 200:
        print(f"Failed to get versions for {name}: {r.status_code}: {r.text}")
        return None
    data = r.json()
    for image in data:
        tags = image["metadata"]["container"]["tags"]
        if "rolling" in tags:
            return image
    print(f"Couldn't find latest tag for {name}")
    return None


if __name__ == "__main__":
    base_images = []
    app_images = []
    latest_run_url = get_scheduled_release_workflow_url()
    if latest_run_url is None:
        print("Failed to get workflow URL, defaulting to repo actions")
        latest_run_url = f"https://github.com/{repo_name}/actions"
    for subdir, dirs, files in os.walk("./apps"):
        for file in files:
            if file != "metadata.yaml" and file != "metadata.json":
                continue
            meta = load_metadata_file(os.path.join(subdir, file))
            if meta is None:
                print(f"Failed to load metadata from {file}")
                continue
            print(meta)
            for channel in meta["channels"]:
                name = ""
                if channel.get("stable", False):
                    name = meta["app"]
                else:
                    name = "-".join([meta["app"], channel["name"]])
                image = {
                  "name": name,
                  "channel": channel["name"],
                  "html_url": "",
                  "owner": repo_owner,
                  "description": meta["description"]
                }
                if meta.get("environment", False):
                    print(name)
                    for key, value in meta["environment"].items():
                        value = str(value)
                        if value == "__EMPTY":
                            default = ""
                        else:
                            default = value
                        image["environment"] += {
                          "name": key,
                          "default": default
                        }
                gh_data = get_latest_image(name)
                if gh_data is not None:
                    image["html_url"] = f"https://github.com/{repo_name}/pkgs/container/{name}"
                    image["id"] = gh_data["id"]
                    image["tags"] = sorted(gh_data["metadata"]["container"]["tags"])
                if meta["base"]:
                    base_images.append(image)
                else:
                    app_images.append(image)
    template = env.get_template("container-README.md.j2")
    for image in base_images:
        with open(f"./apps/{image['name']}/README.md", "w") as f:
            f.write(template.render(image=image))
    for image in app_images:
        if image.channel == "stable" or image.channel == "master" or image.channel == "main":
            with open(f"./apps/{image['name']}/README.md", "w") as f:
                f.write(template.render(image=image))
    template = env.get_template("README.md.j2")
    with open("./README.md", "w") as f:
        f.write(template.render(base_images=base_images, app_images=app_images, latest_run_url=latest_run_url))
