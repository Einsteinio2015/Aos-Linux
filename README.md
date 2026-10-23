# Aos Linux

Aos Linux is a custom Ubuntu-based Linux distribution project with a clean desktop focus, a modern look, and a simple developer-friendly setup.

## Project goal

Create a custom live ISO based on Ubuntu LTS, branded as Aos Linux, with:
- Ubuntu base system
- custom branding and logo concept
- custom package selection
- minimal desktop setup ready for installation
- build scripts for generating a live ISO

## Recommended approach

This project is based on Debian/Ubuntu live-build, which is the easiest path for a custom Ubuntu-like Linux distribution.

## Repository structure

```text
.
├── README.md
├── build.sh
├── .gitignore
├── config/
│   ├── package-lists/
│   │   └── aos.list.chroot
│   ├── includes.chroot/
│   │   ├── etc/
│   │   │   ├── os-release
│   │   │   ├── hostname
│   │   │   └── hosts
│   │   └── usr/local/bin/aos-setup.sh
│   └── hooks/
│       └── normal/
│           └── 0999-aos-branding.chroot
└── assets/
    └── README.md
```

## Build requirements

Use a real Ubuntu or Debian environment for building the ISO. A VM is recommended.

```bash
sudo apt update
sudo apt install -y live-build squashfs-tools xorriso syslinux grub-pc-bin
```

## Build the ISO

```bash
chmod +x build.sh
./build.sh
```

The build script does the following:
1. creates a clean `lb config` project
2. adds custom package lists
3. injects branding files into the live image
4. build the ISO with live-build

## Customization points

You can customize these files before building:
- `config/package-lists/aos.list.chroot` for installed packages
- `config/includes.chroot/etc/os-release` for distro metadata
- `config/includes.chroot/usr/local/bin/aos-setup.sh` for post-install customization
- `config/hooks/normal/0999-aos-branding.chroot` for live branding hooks

## Branding idea

The intended logo identity is:
- uppercase A
- minimal penguin-inspired Linux icon integrated into the letter form
- dark desktop aesthetic
- blue and white color theme with yellow accent

## Default distro metadata

The initial identity is:
- Name: Aos Linux
- Version: 1.0
- ID: aos
- Base: Ubuntu 24.04 LTS compatible

## Notes

This is the starter repository for the Aos Linux project and should be treated as a foundation for a live ISO build. It is intentionally simple and easy to extend.

## Next steps

- add a custom wallpaper
- add a splash theme
- add a Calamares installer profile
- add a custom repo or package source
- test in VirtualBox/KVM and on real hardware

## License

No formal license is assigned yet. Choose one later if needed.
