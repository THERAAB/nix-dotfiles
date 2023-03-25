# Manual Setup Notes
Some apps can't be managed declaratively, so additional setup needed for them is described here.
### Steam
- Enable steam play
- Change default dir
### Dropbox 
```console
maestral stop
maestral start
```
### Firefox
Sign in
### Razergenie 
2100 Hz and 1000 poll rate
### Discord 
Disable minimize to tray
### Printing
http://localhost:631/ > Administration > Add printer
### Plocate
```console
sudo updatedb
```
### Proton
```console
protonup
```
### Gnome Settings
Set monitor refresh rate to 100Hz
### Impermanence
Move any files which cause fuse to fail to their persistence dir:
```console
mv /home/raab/.zcompdump /nix/persist/home/raab/
```
### nix-homelab
```console
git clone git@github.com:THERAAB/nix-homelab.git /nix/persist/nix-homelab
```