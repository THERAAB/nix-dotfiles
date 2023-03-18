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
- Sign in
### VMWare
- desktop.citi.com
### Pavucontrol 
- disable unused sources
- both to digital audio IEC958
- add output for headphones
### Razergenie 
- 2100 Hz and 1000 poll rate
### Discord 
- Disable minimize to tray
### Printing
- http://localhost:631/ > Administration > Add printer
### Plocate
```console
sudo updatedb
```
### Proton
```console
protonup
```
### Zsh Cache
```console
mv ~/.zcompdump* /nix/persist/home/raab (will speed up zsh/kitty startup time)
```
### Set monitor refresh rate to 100Hz