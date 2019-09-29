# youtube-dl-fix-filename

Rename files with only youtube UUIDs to also include the title

## Usage

The script runs on every file in your `cwd`. Perhaps later it could take a target too.

I add the script to `~/.bash_aliases`

`alias ytfix="${SCRIPT_DIR}/ytnames.sh"`

```bash
cd ~/Downloads/video
ytfix
```

This has worked good enough for me!
