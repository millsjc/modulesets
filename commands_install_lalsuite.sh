# symlink the bundled JHBuild configuration file
mkdir -p ~/cosmo/.config && cd ~/cosmo/.config && ln -s ~/cosmo/modulesets/jhbuildrc

# Install/build lalsuite from anonymous repository
~/cosmo/.local/bin/jhbuild -f ~/cosmo/.config/jhbuildrc --no-interact tinderbox --output=$HOME/public_html/cosmo/build/ lalsuite

# Move bayeswave as it gets build in source directory
cp ~/cosmo/src/bayeswave/src/bayeswave* ~/cosmo/local/bin/

# Create initisalisation script
echo '#!/bin/bash' > ~/cosmo/lalinference_o2.sh
echo "$HOME/cosmo/.local/bin/jhbuild -f $HOME/cosmo/.config/jhbuildrc run \$SHELL --noprofile --norc" >> ~/cosmo/lalinference_o2.sh
chmod a+x ~/cosmo/lalinference_cosmo.sh
