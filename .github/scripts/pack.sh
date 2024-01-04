#!/bin/bash
set -e
set -o pipefail

export HELM_CHART_VERSION=$(node -p "require('./package.json').version");

echo "::group::Building helm dependencies and package"
helm dep build ./helm
helm package ./helm --version="${HELM_CHART_VERSION}"
echo "::endgroup::"