#!/bin/sh

# TODO: make this with tempfile
KEYFILE=$(mktemp keyXXXXXXXX)

echo "${ERRORS_HASKELL_ORG_SSH_KEY}" > "$KEYFILE"
chmod 600 "$KEYFILE"

if [ "$1" = --DEPLOY-IT-LIVE ]; then
    DESTINATION=errors
else
    DESTINATION=errors-test
fi

# WARNING: --delete is dangerous.  Be absolutely sure you are
# deploying to the correct directory.  Existing contents of the
# destination directory will be removed.
#
# Permissions: We have to recursively set write permissions because
# lftp isn't able to remove a file if its directory is not writeable.
lftp --norc -c "set net:max-retries 1; set sftp:connect-program \"ssh -o StrictHostKeyChecking=no -a -x -i $KEYFILE\"; open -u error-index, sftp://webhost.haskell.org; chmod --recursive u+w $DESTINATION; mirror  --verbose --reverse --transfer-all ./message-index/_site $DESTINATION"
