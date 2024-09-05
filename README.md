# EIBer - Edge Image Builder

This repository contains a boilerplate configuration for Gitlab CICD / Repository for building custom ISO images using the SUSE Edge Image Builder. The pipeline is designed to automate the process of downloading base ISO images, modifying configuration files, and building new ISO images tailored for different sites or shops. This setup allows multiple ISOs to be built at the same time.

** This repository is mirrored from a Private Gitlab Repository by @Aetrius. The Gitlab CICD Pipelines are based on that project.

## GITLAB Pipeline Stages

The pipeline consists of a single stage, you can update the pipeline to handle stages for pushing or testing components:

- **build_iso**: This stage is responsible for creating ISO images for different sites or shops. Each job in this stage uses a template to perform the following actions:
  - Download the base ISO image.
  - Customize the configuration based on specific variables.
  - Build the new ISO image.
  - Upload the resulting ISO image to a GitLab package registry.

## Global Variables

The pipeline defines several global variables that can be overridden for different jobs:

- **GITLAB_API_V4_URL**: The base URL for the GitLab API (constructed dynamically using the project ID).
- **BASE_FOLDER**: The default base folder path containing site/shop-specific files (`site/shop`).
- **IMAGE_VERSION**: The version of the Edge Image Builder to use (`1.0.2`).
- **CUSTOM_OUTPUT_IMAGE_NAME**: The name for the custom output ISO image (`custom_output.iso`).
- **OUTPUT_IMAGE_NAME**: The default output image name (`SLE-Micro.x86_64-5.5.0-Default-RT-SelfInstall-GM2.install.iso`).
- **BASE_IMAGE_NAME**: The name of the base image to use (`SLE-Micro.x86_64-5.5.0-Default-RT-SelfInstall-GM2.install.iso`).
- **GOLDEN_IMAGE_ISO_PATH**: The path to the base ISO image in the GitLab package registry.
- **GITLAB_ISO_OUTPUT_PATH**: The output path for storing the built ISO image in the GitLab package registry.
- **SUSE_REGISTRY_CODE**: The SUSE registry code (this should be provided as an environment variable). Contact SUSE for a registry code, you can make a free account for a trial code.

## Template Job for Building ISOs

### `.build_iso_template`

The template job `.build_iso_template` is used to define the steps required to build an ISO image. It includes:

1. **Preparing the environment**:
   - Install necessary tools like `curl` and `tree`.
   - Create required directories.

2. **Downloading the Base ISO**:
   - Use `curl` to download the base ISO image from the GitLab package registry.

3. **Customizing Configuration Files**:
   - Replace placeholders in configuration files with specified variables, such as `CUSTOM_OUTPUT_IMAGE_NAME`, `BASE_IMAGE_NAME`, and `SUSE_REGISTRY_CODE`.

4. **Building the ISO**:
   - Use Docker to run the SUSE Edge Image Builder container and build the new ISO image based on the provided configuration.

5. **Uploading the Built ISO**:
   - Upload the resulting ISO image to the GitLab package registry.

6. **Storing Logs**:
   - Collect and store logs as artifacts for later analysis.

## Specific Jobs for Different Sites or Shops

The pipeline defines several jobs that extend from the `.build_iso_template` to create ISO images for specific sites or shops, a few examples are below:

### `build_iso_site_shop1`

- **Base Folder**: `site/shop1`
- **Custom Output Image Name**: `shop1_output.iso`
- **Edge Image Builder Version**: `1.0.2`

### `build_iso_site_shop2`

- **Base Folder**: `site/shop2`
- **Custom Output Image Name**: `shop2_output.iso`
- **Edge Image Builder Version**: `1.0.2`

### `build_iso_site_shop3`

- **Base Folder**: `site/shop3`
- **Custom Output Image Name**: `shop3_output.iso`
- **Edge Image Builder Version**: `1.0.2`

## How to Use

To use this pipeline:

1. **Set up the necessary environment variables**:
   Ensure you have the required variables, such as `SUSE_REGISTRY_CODE` and `PRIV_TOKEN`, set in your GitLab CI/CD settings or secret variables. PRIV_TOKEN is just a Gitlab Registry token to handle uploading or downloading from the gitlab registry.

2. **Run the Pipeline**:
   The pipeline can be triggered manually or automatically based on your GitLab project's configuration.

3. **Monitor the Jobs**:
   View the job logs and artifacts to monitor the progress and results of the ISO-building process.

## Artifacts

Each job generates log files that are stored as artifacts for troubleshooting and record-keeping purposes. The artifacts are set to expire in 1 hour by default.

## Sample Statistics

Base Shops with just a definition.yaml and no SUSE repository access on a regular gitlab runner takes ~ 7 minutes to build.
Custom Shops with a definition.yaml and SUSE repository access with multiple binaries takes ~20 minutes to build.