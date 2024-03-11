# Takajo-docker

Run takajo (https://github.com/Yamato-Security/takajo) in a docker container on jsonl files created by hayabusa already in 
a given directory that will be passed to the container via `-v`

# Usage

This docker image will run `takajo` from the container, the jsonl files will need to be in directories passed via `-v` and if you wish to output
results to a file the directory into which it is written must also be passed via `-v`.

`docker run -it --rm -v $(pwd):/data clausing/takajo`
