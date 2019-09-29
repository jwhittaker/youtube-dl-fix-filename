# youtube-dl-fix-filename

Rename files with only youtube UUIDs to also include the title.

## Background

This has been an on and off issue for me for years. [Unable to extract video title bug](https://github.com/ytdl-org/youtube-dl/issues/21934). I wrote this script incase I do not get the proper file name. I have not tested this with other extractors besides youtube.

## Usage

The script runs on every UUID-only file in your `cwd`. Perhaps later it could take a target dir or file too.

To utilize it, I add the script to `~/.bash_aliases`

`alias ytfix="${SCRIPT_DIR}/ytnames.sh"`

And call it like this:

```bash
cd ~/Downloads/video
ytfix
```

This has worked good enough for me!
