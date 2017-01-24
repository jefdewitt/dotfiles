#!/bin/sh 

${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

# from: https://gist.github.com/patrickhammond/4ddbe49a67e5eb1b9c03

# Make sure the doctor is happy (do what it tells you):
brew doctor

# Use Homebrew to install Android dev tools:
brew install ant
brew install maven
brew install gradle
brew install android-sdk
brew install android-ndk

# Install all of the Android SDK components (you will be prompted to agree to license info and then this will take a while to run)
android update sdk --no-ui

# Update your environment variables:
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk

export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH

# Install tools 
$DEV_PROJECTS_ROOT/dotfiles/scripts/apps/intel-haxm/install.sh
$DEV_PROJECTS_ROOT/dotfiles/scripts/apps/android-studio/install.sh
