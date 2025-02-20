#!/bin/bash

# /**
#  * @file collect-gradle-wrapper-distribution-urls.sh
#  * @brief This script searches for gradle-wrapper.properties files within a specified directory,
#  *        extracts the distribution URLs, and stores them in a text file.
#  *
#  * The script performs the following steps:
#  * 1. Searches for all gradle-wrapper.properties files in the specified directory.
#  * 2. Extracts the distribution URL from each found file.
#  * 3. Normalizes the URL to a standard format.
#  * 4. Checks if the URL is already present in the output file.
#  * 5. If not present, adds the URL to the output file.
#  *
#  * @author mturner
#  */

# Directory to search for gradle-wrapper.properties files contained in $HOME directory
SEARCH_DIR="$HOME"

# File to store the extracted Gradle wrapper distribution URLs
GRADLE_WRAPPER_URLS_FILE="$HOME/gradle-wrapper-urls.txt"

# Find all gradle-wrapper.properties files and extract distribution URLs
find "$SEARCH_DIR" -name "gradle-wrapper.properties" -print0 | while IFS= read -r -d '' file; do
    # Extract the distribution URL from the gradle-wrapper.properties file
    url=$(grep -E '^distributionUrl=' "$file" | cut -d'=' -f2)
    if [ -n "$url" ]; then
        # Normalize the URL to standard format by replacing escaped colons with colons
        normalized_url=$(echo "$url" | sed 's/\\:/:/g')
        echo "Found URL in $file: $normalized_url"

        # Check if the output file exists, if not, create it
        if [ ! -f "$GRADLE_WRAPPER_URLS_FILE" ]; then
            echo "$GRADLE_WRAPPER_URLS_FILE does not exist, creating it"
            touch "$GRADLE_WRAPPER_URLS_FILE"
        fi

        # Check if the normalized URL is already in the output file, if not, add it
        if ! grep -q "$normalized_url" "$GRADLE_WRAPPER_URLS_FILE"; then
            echo "Adding $normalized_url to $GRADLE_WRAPPER_URLS_FILE"
            echo "$normalized_url" >> "$GRADLE_WRAPPER_URLS_FILE"
        fi
        #else
          #echo "$normalized_url already exists in gradle-wrapper-urls.txt"
    fi
done
