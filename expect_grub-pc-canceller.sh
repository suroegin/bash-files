/bin/cat <<FOO > ~/grub-pc-canceller.exp
#!/usr/bin/expect -f
set force_conservative 0  ;# set to 1 to force conservative mode even if
                          ;# script wasn't run conservatively originally
if {$force_conservative} {
        set send_slow {1 .1}
        proc send {ignore arg} {
                sleep .1
                exp_send -s -- $arg
        }
}

set timeout -1
spawn sudo apt install -y grub-pc
match_max 100000
expect -exact "\[sudo\] password for kolya: "
send -- "nmlkj\r"
expect -exact "[?12l[?25h[64;1H[m[37m[40m[m[39;49m\r[K\r[?1049l[?1049h[1;64r[4l[?25l[m[37m[40m[1;64r[H[2J[1;1H[1m[37m[45m                                                                                                                   [2;1H                                                                                                                   [3;1H                                                                                                                   [4;1H                                                                                                                   [5;1H                                                                                                                   [6;1H                                                                                                                   [7;1H                                                                                                                   [8;1H                                                                                                                   [9;1H                                                                                                                   [10;1H                                                                                                                   [11;1H                                                                                                                   [12;1H                                                                                                                   [13;1H                                                                                                                   [14;1H                                                                                                                   [15;1H                                                                                                                   [16;1H                                                                                                                   [17;1H                                                                                                                   [18;1H                                                                                                                   [19;1H                                                                                                                   [20;1H                                                                                                                   [21;1H                                                                                                                   [22;1H                                                                                                                   [23;1H                                                                                                                   [24;1H                                                                                                                   [25;1H                                                                                                                   [26;1H                                                                                                                   [27;1H                                                                                                                   [28;1H                                                                                                                   [29;1H                                                                                                                   [30;1H                                                                                                                   [31;1H                                                                                                                   [32;1H                                                                                                                   [33;1H                                                                                                                   [34;1H                                                                                                                   [35;1H                                                                                                                   [36;1H                                                                                                                   [37;1H                                                                                                                   [38;1H                                                                                                                   [39;1H                                                                                                                   [40;1H                                                                                                                   [41;1H                                                                                                                   [42;1H                                                                                                                   [43;1H                                                                                                                   [44;1H                                                                                                                   [45;1H                                                                                                                   [46;1H                                                                                                                   [47;1H                                                                                                                   [48;1H                                                                                                                   [49;1H                                                                                                                   [50;1H                                                                                                                   [51;1H                                                                                                                   [52;1H                                                                                                                   [53;1H                                                                                                                   [54;1H                                                                                                                   [55;1H                                                                                                                   [56;1H                                                                                                                   [57;1H                                                                                                                   [58;1H                                                                                                                   [59;1H                                                                                                                   [60;1H                                                                                                                   [61;1H                                                                                                                   [62;1H                                                                                                                   [63;1H                                                                                                                   [64;1H                                                                                                                  [64;114H[4h [4l[1;1H[m[37m[45mPackage configuration[22;2H[30m[47m┌───────────────────────────────────────────┤ [31mConfiguring grub-pc[30m ├────────────────────────────────────────────┐[23;2H│ The GRUB boot loader was previously installed to a disk that is no longer present, or whose unique           │[1m[37m[40m [24;2H[m[30m[47m│ identifier has changed for some reason. It is important to make sure that the installed GRUB core image      │[1m[37m[40m [25;2H[m[30m[47m│ stays in sync with GRUB modules and grub.cfg. Please check again to make sure that GRUB is written to the    │[1m[37m[40m [26;2H[m[30m[47m│ appropriate boot devices.                                                                                    │[1m[37m[40m [27;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [28;2H[m[30m[47m│ If you're unsure which drive is designated as boot drive by your BIOS, it is often a good idea to install    │[1m[37m[40m [29;2H[m[30m[47m│ GRUB to all of them.                                                                                         │[1m[37m[40m [30;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [31;2H[m[30m[47m│ Note: it is possible to install GRUB to partition boot records as well, and some appropriate partitions are  │[1m[37m[40m [32;2H[m[30m[47m│ offered here. However, this forces GRUB to use the blocklist mechanism, which makes it less reliable, and    │[1m[37m[40m [33;2H[m[30m[47m│ therefore is not recommended.                                                                                │[1m[37m[40m [34;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [35;2H[m[30m[47m│ GRUB install devices:                                                                                        │[1m[37m[40m [36;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [37;2H[m[30m[47m│    [37m[45m\[[41m [45m\] /dev/sda (21474 MB; QEMU_HARDDISK)  [30m[47m                                                                  │[1m[37m[40m [38;2H[m[30m[47m│    [37m[45m\[ \] - /dev/sda1 (21473 MB; /)           [30m[47m                                                                  │[1m[37m[40m [39;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [40;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [41;2H[m[30m[47m│                                                    <Ok>                                                      │[1m[37m[40m [42;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [43;2H[m[30m[47m└──────────────────────────────────────────────────────────────────────────────────────────────────────────────┘[1m[37m[40m [44;3H                                                                                                                [37;11H"
send -- "\r"
expect -exact "[?12l[?25h[64;1H[m[37m[40m[m[39;49m\r[K\r[?1049l[?1049h[1;64r[4l[?25l[m[37m[40m[1;64r[H[2J[1;1H[1m[37m[45m                                                                                                                   [2;1H                                                                                                                   [3;1H                                                                                                                   [4;1H                                                                                                                   [5;1H                                                                                                                   [6;1H                                                                                                                   [7;1H                                                                                                                   [8;1H                                                                                                                   [9;1H                                                                                                                   [10;1H                                                                                                                   [11;1H                                                                                                                   [12;1H                                                                                                                   [13;1H                                                                                                                   [14;1H                                                                                                                   [15;1H                                                                                                                   [16;1H                                                                                                                   [17;1H                                                                                                                   [18;1H                                                                                                                   [19;1H                                                                                                                   [20;1H                                                                                                                   [21;1H                                                                                                                   [22;1H                                                                                                                   [23;1H                                                                                                                   [24;1H                                                                                                                   [25;1H                                                                                                                   [26;1H                                                                                                                   [27;1H                                                                                                                   [28;1H                                                                                                                   [29;1H                                                                                                                   [30;1H                                                                                                                   [31;1H                                                                                                                   [32;1H                                                                                                                   [33;1H                                                                                                                   [34;1H                                                                                                                   [35;1H                                                                                                                   [36;1H                                                                                                                   [37;1H                                                                                                                   [38;1H                                                                                                                   [39;1H                                                                                                                   [40;1H                                                                                                                   [41;1H                                                                                                                   [42;1H                                                                                                                   [43;1H                                                                                                                   [44;1H                                                                                                                   [45;1H                                                                                                                   [46;1H                                                                                                                   [47;1H                                                                                                                   [48;1H                                                                                                                   [49;1H                                                                                                                   [50;1H                                                                                                                   [51;1H                                                                                                                   [52;1H                                                                                                                   [53;1H                                                                                                                   [54;1H                                                                                                                   [55;1H                                                                                                                   [56;1H                                                                                                                   [57;1H                                                                                                                   [58;1H                                                                                                                   [59;1H                                                                                                                   [60;1H                                                                                                                   [61;1H                                                                                                                   [62;1H                                                                                                                   [63;1H                                                                                                                   [64;1H                                                                                                                  [64;114H[4h [4l[1;1H[m[37m[45mPackage configuration[25;2H[30m[47m┌───────────────────────────────────────────┤ [31mConfiguring grub-pc[30m ├────────────────────────────────────────────┐[26;2H│                                                                                                              │[1m[37m[40m [27;2H[m[30m[47m│ You chose not to install GRUB to any devices. If you continue, the boot loader may not be properly           │[1m[37m[40m [28;2H[m[30m[47m│ configured, and when this computer next starts up it will use whatever was previously in the boot sector.    │[1m[37m[40m [29;2H[m[30m[47m│ If there is an earlier version of GRUB 2 in the boot sector, it may be unable to load modules or handle the  │[1m[37m[40m [30;2H[m[30m[47m│ current configuration file.                                                                                  │[1m[37m[40m [31;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [32;2H[m[30m[47m│ If you are already using a different boot loader and want to carry on doing so, or if this is a special      │[1m[37m[40m [33;2H[m[30m[47m│ environment where you do not need a boot loader, then you should continue anyway. Otherwise, you should      │[1m[37m[40m [34;2H[m[30m[47m│ install GRUB somewhere.                                                                                      │[1m[37m[40m [35;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [36;2H[m[30m[47m│ Continue without installing GRUB?                                                                            │[1m[37m[40m [37;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [38;2H[m[30m[47m│                                <Yes>                                   [37m[41m<No>[30m[47m                                  │[1m[37m[40m [39;2H[m[30m[47m│                                                                                                              │[1m[37m[40m [40;2H[m[30m[47m└──────────────────────────────────────────────────────────────────────────────────────────────────────────────┘[1m[37m[40m [41;3H                                                                                                                [38;76H"
send -- "[D"
expect -exact "[38;35H[m[37m[41m<Yes>[35C[30m[47m<No>[38;36H"
send -- "\r"
expect eof
FOO

chmod +x ~/grub-pc-canceller.exp
./grub-pc-canceller.exp