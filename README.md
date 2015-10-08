# Purpose
Thise is a Gentoo overlay providing PAM support modules for universal second factor authentication (u2f). The included tools and libraries are developed and maintained by [Yubico](https://yubico.com).

# Installation
To install the pam-u2f module and it's dependencies simply run

`emerge pam_u2f`

To enable diagnostic (and error messages) via PAM logging set the `pam-debug` use flag.

# Configuration
See https://developers.yubico.com/pam-u2f/ for details on how to configure and integrate the module.

