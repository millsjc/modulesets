**Beyond the old ipython kernel install business  (see [here](https://anbasile.github.io/programming/2017/06/25/jupyter-venv/)), if you are using a custom lalsuite install you need to do these extra steps. Thanks to [Ed](https://github.com/Galadirith) for explaining this to me.**

make a script to fix it can put this in any directory maybe best to put in the bin of the environment:

vim ~/phenomhm/src/pycbc/bin/kernel-fix-master.sh
which reads:

#!/usr/bin/env bash
. /home/c1574769/phenomhm/src/pycbc/opt/lalsuite/etc/lalsuite-user-env.sh
/home/c1574769/phenomhm/src/pycbc/bin/python -m ipykernel_launcher $@

Then go to folder with the kernels that are installed:

cd ~/.local/share/jupyter/kernels/pycbc
make a copy of the kernel.json file in case we mess up,

vim kernel.json
and then change the contents along these lines (delete three lines):

{
 "display_name": "pycbc",
 "language": "python",
 "argv": [
  "/home/c1574769/phenomhm/src/pycbc/bin/kernel-fix-master.sh",
  "-f",
  "{connection_file}"
 ]
}
