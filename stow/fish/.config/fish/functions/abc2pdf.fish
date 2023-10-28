function abc2pdf
    set -l portrait (mktemp)
    set -l landscape (mktemp)

    set -l perr (abcm2ps -O  $portrait  $argv[1] 2>&1 | wc -l)
    set -l lerr (abcm2ps -lO $landscape $argv[1] 2>&1 | wc -l)

    if test $perr > $lerr
        ps2pdf $landscape -
    else
        ps2pdf $portrait -
    end

    rm $portrait $landscape
end
