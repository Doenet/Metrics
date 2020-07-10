# Metrics
A container for running python, R, and rpy2.

## Commands
### Start Container
`npm start`

### Build/Re-build Container
`npm run build`

## Usage
### Your First Startup
Build the container with `npm run build` and then start it with `npm start`. On following startups you just need to use `npm start`.

### Exit the container
Simply type `exit` in the container's console.

### Install dependencies
To install dependencies not already present in the container, put each new dependency on a separate line in requirements.txt.

After doing so, you must rebuild the container with `npm run build` otherwise the changes won't take effect.

### Modifying Source files
The container watches the src directory, so source files can be modified and tested without needing to restart the container. Additionally, any files written to the container /src will be written to the host /src.

### Don't want python to default to 3?
In the Dockerfile change `usr/bin/python3` to `usr/bin/python2`.