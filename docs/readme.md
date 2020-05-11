# Markdown Server Docker
Provides a simple way to have a hosted set of docs.

There are two scripts that help build the images and one which runs the final image.

## d\_shortcut.sh
This builds an image of python, adds git, then updates pip.  Mainly done for the time savings of dealing with the package manager.  Since most of the redo will be in dealing with the hosted documentation, this seemed like an ok idea.  The output of this will be an image named `python-shortcut-alpine` or `python-shortcut` depending on which source python was used.  This step will likely be merged with the next once I'm done tinkering with the details.

## d\_build.sh
This uses the shortcut image created above to create the image that will host the documentation.  A single argument is expected in the form of `user/repo` and should match the corresponding part of the github url.  For example, this repo is `https://github.com/adamtorres/markdown-doc-server`.  The argument to be used on this command line would be `adamtorres/markdown-doc-server`.

    ./d_build.sh adamtorres/markdown-doc-server

The image name will be the name of the repo with "-docs" appended.

## d\_run.sh
This runs the image built in the previous command.  The entrypoint will clone or pull the specified repo.  It stays on the master branch at the moment.  Restarting the container is enough to get it to pull changes.  The argument for this script is the same as the build script for simplicity.
The site is hosted at port 8009.
It does not default to any file name so you have to know the files ahead of time.

Ideas for improvements:

* Provide some kind of file index.  Either as a default page (no filename specified) or as a popout on the edge of all pages.
* Add an arg to the d\_build.sh and d\_run.sh scripts to specify the branch to use.  The build script would save the specified branch as a default while the run script would be able to override if desired.
