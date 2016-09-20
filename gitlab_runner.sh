#!/bin/sh

# Setup script for gitlab runner on debian dist

sudo apt-get update

# Install Docker Runner, needs kernel > 4.x
curl -sSL https://get.docker.com/ | sh

# Add GitLab's official repository via apt-get 
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash

# Prefere the gitlab source
cat > /etc/apt/preferences.d/pin-gitlab-runner.pref <<EOF
Explanation: Prefer GitLab provided packages over the Debian native ones
Package: gitlab-ci-multi-runner
Pin: origin packages.gitlab.com
Pin-Priority: 1001
EOF

sudo apt-get update

sudo apt-get install gitlab-ci-multi-runner

# Register, requires user input
sudo gitlab-ci-multi-runner register
# Enter gitlab coordinator
# Runner Token
# Runner description
