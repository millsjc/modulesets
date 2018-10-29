DIRNAME=phenomhm
#sed 's/cosmo/"${DIRNAME}"/g' commands_install_lalsuite.sh -i

mkdir -p ~/"${DIRNAME}"/src && git clone git@github.com:GNOME/jhbuild.git ~/"${DIRNAME}"/src/jhbuild
cd ~/"${DIRNAME}"/src/jhbuild
./autogen.sh --prefix=~/"${DIRNAME}"/.local
make
make install

# symlink the bundled JHBuild configuration file
mkdir -p ~/"${DIRNAME}"/.config && cd ~/"${DIRNAME}"/.config && ln -s ~/"${DIRNAME}"/modulesets/jhbuildrc

# Install/build lalsuite from anonymous repository
~/"${DIRNAME}"/.local/bin/jhbuild -f ~/"${DIRNAME}"/.config/jhbuildrc --no-interact build lalsuite

# Move bayeswave as it gets build in source directory
cp ~/"${DIRNAME}"/src/bayeswave/src/bayeswave* ~/"${DIRNAME}"/local/bin/

# Create initisalisation script
echo '#!/bin/bash' > ~/"${DIRNAME}"/lalinference_"${DIRNAME}".sh
echo "$HOME/"${DIRNAME}"/.local/bin/jhbuild -f $HOME/"${DIRNAME}"/.config/jhbuildrc run \$SHELL --noprofile --norc" >> ~/"${DIRNAME}"/lalinference_"${DIRNAME}".sh
chmod a+x ~/"${DIRNAME}"/lalinference_"${DIRNAME}".sh
