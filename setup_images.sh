#!/bin/bash

IMAGES=(
  "abyanmajid/yan-broker:latest"
  "abyanmajid/yan-compiler:latest"
  "abyanmajid/yan-cms:latest"
)
TAGS=(
  "localhost:5000/compiler"
  "localhost:5000/cms"
)

for IMAGE in "${IMAGES[@]}"; do
  echo "Pulling image $IMAGE"
  docker pull $IMAGE
done

for i in "${!IMAGES[@]}"; do
  IMAGE="${IMAGES[$i]}"
  TAG="${TAGS[$i]}"
  
  echo "Retagging image $IMAGE to $TAG"
  docker tag $IMAGE $TAG

  echo "Pushing image $TAG to local registry"
  docker push $TAG
done

echo "All images have been pulled, retagged, and pushed to the local registry."
