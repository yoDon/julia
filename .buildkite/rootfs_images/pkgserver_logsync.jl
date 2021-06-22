#!/usr/bin/env julia

# This rootfs is used to run pkgserver log syncing

include("rootfs_utils.jl")

# Build debian-based image with the following extra packages:
packages = [
    "openssh-client",
    "awscli",
    "rsync",
    "curl",
    "jq",
]
tarball_path = debootstrap("pkgserver-logsync"; packages, force=true)

# Upload it
upload_rootfs_image(tarball_path)
