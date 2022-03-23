FROM ubuntu:latest

# ------------------------------------------------------------------------------
# Update mirros, install reqs

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y tzdata keyboard-configuration
    
RUN apt install -y software-properties-common git && apt update

# ------------------------------------------------------------------------------
# Fetch appropriate Kicad version and install

RUN add-apt-repository --yes ppa:kicad/kicad-5.1-releases && \
    apt install -y --no-install-recommends kicad

RUN apt install -y kicad-libraries kicad-footprints kicad-symbols kicad-templates kicad-packages3d

# ------------------------------------------------------------------------------
# Fetch Kicad RF packages and install

WORKDIR /root/.kicad_plugins
RUN git clone https://github.com/easyw/RF-tools-KiCAD.git

# ------------------------------------------------------------------------------
# Set default command

CMD kicad
