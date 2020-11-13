Fancy CV

```bash
# install deps
tlmgr install fontawesome
# alternatively, on nixos, install texlive.combined.scheme-full
# on arch, install texlive-core texlive-latexextra
# build
git checkout nl; clear; xelatex cv.tex; mv cv.pdf cv-kiara-nl.pdf; git checkout master; clear; xelatex cv.tex; cp cv.pdf cv-kiara-en.pdf
<!--
bash run.sh
# sync general changes
bash sync.sh
# sync general changes and rebuild
bash sync.sh -p
-->
```
