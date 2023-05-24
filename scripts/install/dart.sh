#!/bin/sh

if test ! $(which dart); then
  echo "Installing dart..."
  brew tap dart-lang/dart
  brew install dart
fi