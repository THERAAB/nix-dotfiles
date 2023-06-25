# Manual Setup Notes

Some apps can't be managed declaratively, so additional setup needed for them is described here.

### Firefox

Sign in

### Discord

Disable minimize to tray

### Printing

http://localhost:631/ > Administration > Add printer

### Plocate

```console
sudo updatedb
```

### Forge

Disable Split Direction Hint
Change Colors

### Ulauncher

Set theme & number of favorites

### nix-homelab

```console
git clone git@github.com:THERAAB/nix-homelab.git /nix/persist/nix-homelab
```
### Some notes on the Asus Zenbook 14 Q409ZA Bios
- Use Bios 310 for ssdt patch to work properly for audio, otherwise RIP sound
- Disable eMMC Card reader and Webcam (optional?) to achieve s0ix sleep S3 (C10)
- There's a fingerprint reader under the power button, but it can't be disabled through Bios. I used a udev rule instead
- Disable virtualization and Vt-d for resume from hibernate after suspend to work
- Don't disable USB Hub (causes issues with s0ix) or VMD Controller (issues with Hibernate)