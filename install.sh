#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Clone the main repository
git clone https://github.com/barnevis/Korase.git
cd Korase/templates/

# Clone the template repository
git clone https://github.com/barnevis/KashkulTemplate.git
cd ../docs/

# Remove all existing files
rm -rf *

# Clone the documentation repository
git clone https://github.com/irantimeline/irantimeline.git .

# Navigate back to the main project directory
cd ..

# Clone the milestone repository into src/plugins/
mkdir -p src/plugins
cd src/plugins
git clone git@github.com:barnevis/korase-milestone.git
git clone git@github.com:barnevis/korase-neiltime.git
git clone git@github.com:barnevis/korase-timeline.git
git clone git@github.com:barnevis/korase-timetree.git
git clone git@github.com:barnevis/korase-wikiIcon.git
cd ../..

# Create the .env file with required content
cat > .env <<EOL
VITE_TEMPLATE_NAME=KashkulTemplate
VITE_TEMPLATE_PATH=../../templates
EOL

# Install dependencies and start the project
npm install
npm run render
npm run dev
