set -euo pipefail

cd x86_64
rm -f flux-repo*

repo-add -s -n -R flux-repo.db.tar.gz *.pkg.tar.zst

rm flux-repo.db
rm flux-repo.db.sig
rm flux-repo.files
rm flux-repo.files.sig

mv flux-repo.db.tar.gz flux-repo.db
mv flux-repo.db.tar.gz.sig flux-repo-db.sig
mv flux-repo.files.tar.gz flux-repo.files
mv flux-repo.files.tar.gz.sig flux-repo.files.sig