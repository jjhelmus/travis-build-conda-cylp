MINICONDA_URL="https://repo.continuum.io/miniconda"
MINICONDA_FILE="Miniconda3-latest-MacOSX-x86_64.sh"
wget "${MINICONDA_URL}/${MINICONDA_FILE}"
bash $MINICONDA_FILE -b

export PATH=/Users/travis/miniconda3/bin:$PATH

conda update --yes conda
conda install --yes conda-build jinja2 anaconda-client
conda config --add channels jjhelmus

# Remove gfortran so that all fortran modules are not built.
# This avoids the need to package the gfortran run time in the conda package.
rm /usr/local/bin/gfor*
