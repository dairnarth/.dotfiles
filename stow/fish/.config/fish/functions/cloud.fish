function cloud
    argparse d/dropbox o/onedrive u/umount -- $argv
    set -ql _flag_dropbox && set -al remotes dropbox
    set -ql _flag_onedrive && set -al remotes onedrive

    set -ql remotes || return 1

    for remote in $remotes
        if rclone listremotes | grep $remote &>/dev/null
            if set -ql _flag_umount
                fusermount -u ~/mnt/$remote
                printf '%s unmounted.\n' $remote
            else
                rclone mount --daemon $remote: $HOME/mnt/$remote
                printf '%s mounted to "~/mnt/%s.\n' $remote $remote
            end
        else
            printf '%s is not configured in rclone.\n' $remote >&2
        end
    end
end
