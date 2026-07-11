# shot

Save the Windows clipboard image straight into a WSL folder as a PNG.

Take a screenshot with **Win+Shift+S** (or anything that puts an image on the
clipboard), then run `shot` in your WSL terminal — no third-party apps, no
save-as dialogs, no round-trips through chat apps.

## Usage

```bash
shot                    # ./screenshots/shot-YYYYMMDD-HHMMSS.png (folder created if missing)
shot images/            # timestamped PNG into that directory
shot login-bug.png      # named file (.png appended if omitted)
shot docs/img/bug.png   # full relative or absolute path
```

Prints the saved path on success. Exits non-zero with a message if the
clipboard has no image.

## Install

```bash
./install.sh
```

Symlinks `shot` into `~/.local/bin` (make sure that's on your `PATH`).

## Requirements

- WSL2 with Windows interop enabled (`powershell.exe` reachable from WSL —
  the default)
- Windows PowerShell 5.x (ships with Windows)

## How it works

`shot` shells out to `powershell.exe`, reads the clipboard image via
`System.Windows.Forms.Clipboard`, saves it as a PNG to the Windows temp
directory, then moves it to your target path inside WSL.

## License

MIT
