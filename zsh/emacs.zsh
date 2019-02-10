emacs ()
{
    EMACS_APP='/Applications/Emacs.app'
    OPEN_EMACS="${HOME}/bin/open_emacs"

    if [[ -x "${OPEN_EMACS}" ]]; then
        "${OPEN_EMACS}" "$@"
    else
        EMACS='/usr/local/bin/emacs'
        NW=

        if [[ -d "${EMACS_APP}" ]]; then
            EMACS="${EMACS_APP}/Contents/MacOS/Emacs"
            NW='-nw'
        fi

        "${EMACS}" "${NW}" "$@"
    fi
}
