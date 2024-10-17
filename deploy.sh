#!/bin/bash

# Variables
REPO="TiannaLopes/zhoosh"
VERSION=$1
TARBALL_URL="https://github.com/$REPO/archive/refs/tags/$VERSION.tar.gz"
HOMEBREW_TAP_REPO="TiannaLopes/homebrew-zhoosh"
HOMEBREW_FORMULA_PATH="Formula/zhoosh.rb"

# Check if version number is provided
if [ -z "$VERSION" ]; then
  echo "Usage: ./deploy.sh <version>"
  exit 1
fi

# Tag the release and push it
git tag $VERSION
git push origin $VERSION

# Create the GitHub release
gh release create $VERSION --title "Zhoosh v$VERSION" --notes "Release version $VERSION" --target main

# Calculate the SHA256 of the tarball
curl -L -o zhoosh-$VERSION.tar.gz $TARBALL_URL
SHA256=$(shasum -a 256 zhoosh-$VERSION.tar.gz | awk '{ print $1 }')
rm zhoosh-$VERSION.tar.gz

# Update Homebrew formula
cd ../$HOMEBREW_TAP_REPO
sed -i.bak "s|url .*|url \"$TARBALL_URL\"|" $HOMEBREW_FORMULA_PATH
sed -i.bak "s|sha256 .*|sha256 \"$SHA256\"|" $HOMEBREW_FORMULA_PATH

# Commit and push the Homebrew update
git add $HOMEBREW_FORMULA_PATH
git commit -m "Update Zhoosh to version $VERSION"
git push origin main

echo "Zhoosh v$VERSION deployed and Homebrew tap updated!"
