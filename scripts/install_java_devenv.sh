#!/usr/bin/env bash

curl -s "https://get.sdkman.io?ci=true" | bash

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "Installing Java Temurin 24.0.1"
sdk install java 24.0.1-tem

echo "Installing GraalVM 24.0.1"
sdk install java 24.0.1-graalce


echo "Installing Quarkus CLI"
sdk install quarkus

echo "Installing Apache Ant"
sdk install ant

echo "Installing Apache Maven"
sdk install maven

echo "Installing Gradle"
sdk install gradle

echo "Installing Jbang"
sdk install jbang

echo "Installing JBake"
sdk install jbake

