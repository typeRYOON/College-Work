
rtarget:     file format elf64-x86-64

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 5f 00 00 	mov    0x5fd9(%rip),%rax        # 6fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 9a 5e 00 00    	pushq  0x5e9a(%rip)        # 6ec0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 9b 5e 00 00 	bnd jmpq *0x5e9b(%rip)        # 6ec8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	pushq  $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmpq 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	pushq  $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmpq 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	pushq  $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmpq 1020 <.plt>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	pushq  $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmpq 1020 <.plt>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	pushq  $0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmpq 1020 <.plt>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64 
    1124:	68 0f 00 00 00       	pushq  $0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmpq 1020 <.plt>
    112f:	90                   	nop
    1130:	f3 0f 1e fa          	endbr64 
    1134:	68 10 00 00 00       	pushq  $0x10
    1139:	f2 e9 e1 fe ff ff    	bnd jmpq 1020 <.plt>
    113f:	90                   	nop
    1140:	f3 0f 1e fa          	endbr64 
    1144:	68 11 00 00 00       	pushq  $0x11
    1149:	f2 e9 d1 fe ff ff    	bnd jmpq 1020 <.plt>
    114f:	90                   	nop
    1150:	f3 0f 1e fa          	endbr64 
    1154:	68 12 00 00 00       	pushq  $0x12
    1159:	f2 e9 c1 fe ff ff    	bnd jmpq 1020 <.plt>
    115f:	90                   	nop
    1160:	f3 0f 1e fa          	endbr64 
    1164:	68 13 00 00 00       	pushq  $0x13
    1169:	f2 e9 b1 fe ff ff    	bnd jmpq 1020 <.plt>
    116f:	90                   	nop
    1170:	f3 0f 1e fa          	endbr64 
    1174:	68 14 00 00 00       	pushq  $0x14
    1179:	f2 e9 a1 fe ff ff    	bnd jmpq 1020 <.plt>
    117f:	90                   	nop
    1180:	f3 0f 1e fa          	endbr64 
    1184:	68 15 00 00 00       	pushq  $0x15
    1189:	f2 e9 91 fe ff ff    	bnd jmpq 1020 <.plt>
    118f:	90                   	nop
    1190:	f3 0f 1e fa          	endbr64 
    1194:	68 16 00 00 00       	pushq  $0x16
    1199:	f2 e9 81 fe ff ff    	bnd jmpq 1020 <.plt>
    119f:	90                   	nop
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	68 17 00 00 00       	pushq  $0x17
    11a9:	f2 e9 71 fe ff ff    	bnd jmpq 1020 <.plt>
    11af:	90                   	nop
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	68 18 00 00 00       	pushq  $0x18
    11b9:	f2 e9 61 fe ff ff    	bnd jmpq 1020 <.plt>
    11bf:	90                   	nop
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	68 19 00 00 00       	pushq  $0x19
    11c9:	f2 e9 51 fe ff ff    	bnd jmpq 1020 <.plt>
    11cf:	90                   	nop
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	68 1a 00 00 00       	pushq  $0x1a
    11d9:	f2 e9 41 fe ff ff    	bnd jmpq 1020 <.plt>
    11df:	90                   	nop
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	68 1b 00 00 00       	pushq  $0x1b
    11e9:	f2 e9 31 fe ff ff    	bnd jmpq 1020 <.plt>
    11ef:	90                   	nop
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	68 1c 00 00 00       	pushq  $0x1c
    11f9:	f2 e9 21 fe ff ff    	bnd jmpq 1020 <.plt>
    11ff:	90                   	nop
    1200:	f3 0f 1e fa          	endbr64 
    1204:	68 1d 00 00 00       	pushq  $0x1d
    1209:	f2 e9 11 fe ff ff    	bnd jmpq 1020 <.plt>
    120f:	90                   	nop
    1210:	f3 0f 1e fa          	endbr64 
    1214:	68 1e 00 00 00       	pushq  $0x1e
    1219:	f2 e9 01 fe ff ff    	bnd jmpq 1020 <.plt>
    121f:	90                   	nop
    1220:	f3 0f 1e fa          	endbr64 
    1224:	68 1f 00 00 00       	pushq  $0x1f
    1229:	f2 e9 f1 fd ff ff    	bnd jmpq 1020 <.plt>
    122f:	90                   	nop
    1230:	f3 0f 1e fa          	endbr64 
    1234:	68 20 00 00 00       	pushq  $0x20
    1239:	f2 e9 e1 fd ff ff    	bnd jmpq 1020 <.plt>
    123f:	90                   	nop

Disassembly of section .plt.got:

0000000000001240 <__cxa_finalize@plt>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	f2 ff 25 ad 5d 00 00 	bnd jmpq *0x5dad(%rip)        # 6ff8 <__cxa_finalize@GLIBC_2.2.5>
    124b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001250 <strcasecmp@plt>:
    1250:	f3 0f 1e fa          	endbr64 
    1254:	f2 ff 25 75 5c 00 00 	bnd jmpq *0x5c75(%rip)        # 6ed0 <strcasecmp@GLIBC_2.2.5>
    125b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001260 <__errno_location@plt>:
    1260:	f3 0f 1e fa          	endbr64 
    1264:	f2 ff 25 6d 5c 00 00 	bnd jmpq *0x5c6d(%rip)        # 6ed8 <__errno_location@GLIBC_2.2.5>
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001270 <srandom@plt>:
    1270:	f3 0f 1e fa          	endbr64 
    1274:	f2 ff 25 65 5c 00 00 	bnd jmpq *0x5c65(%rip)        # 6ee0 <srandom@GLIBC_2.2.5>
    127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001280 <strncmp@plt>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	f2 ff 25 5d 5c 00 00 	bnd jmpq *0x5c5d(%rip)        # 6ee8 <strncmp@GLIBC_2.2.5>
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001290 <strcpy@plt>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	f2 ff 25 55 5c 00 00 	bnd jmpq *0x5c55(%rip)        # 6ef0 <strcpy@GLIBC_2.2.5>
    129b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012a0 <puts@plt>:
    12a0:	f3 0f 1e fa          	endbr64 
    12a4:	f2 ff 25 4d 5c 00 00 	bnd jmpq *0x5c4d(%rip)        # 6ef8 <puts@GLIBC_2.2.5>
    12ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012b0 <write@plt>:
    12b0:	f3 0f 1e fa          	endbr64 
    12b4:	f2 ff 25 45 5c 00 00 	bnd jmpq *0x5c45(%rip)        # 6f00 <write@GLIBC_2.2.5>
    12bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012c0 <__stack_chk_fail@plt>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	f2 ff 25 3d 5c 00 00 	bnd jmpq *0x5c3d(%rip)        # 6f08 <__stack_chk_fail@GLIBC_2.4>
    12cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012d0 <mmap@plt>:
    12d0:	f3 0f 1e fa          	endbr64 
    12d4:	f2 ff 25 35 5c 00 00 	bnd jmpq *0x5c35(%rip)        # 6f10 <mmap@GLIBC_2.2.5>
    12db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012e0 <memset@plt>:
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	f2 ff 25 2d 5c 00 00 	bnd jmpq *0x5c2d(%rip)        # 6f18 <memset@GLIBC_2.2.5>
    12eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012f0 <alarm@plt>:
    12f0:	f3 0f 1e fa          	endbr64 
    12f4:	f2 ff 25 25 5c 00 00 	bnd jmpq *0x5c25(%rip)        # 6f20 <alarm@GLIBC_2.2.5>
    12fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001300 <close@plt>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	f2 ff 25 1d 5c 00 00 	bnd jmpq *0x5c1d(%rip)        # 6f28 <close@GLIBC_2.2.5>
    130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001310 <read@plt>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	f2 ff 25 15 5c 00 00 	bnd jmpq *0x5c15(%rip)        # 6f30 <read@GLIBC_2.2.5>
    131b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001320 <signal@plt>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	f2 ff 25 0d 5c 00 00 	bnd jmpq *0x5c0d(%rip)        # 6f38 <signal@GLIBC_2.2.5>
    132b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001330 <gethostbyname@plt>:
    1330:	f3 0f 1e fa          	endbr64 
    1334:	f2 ff 25 05 5c 00 00 	bnd jmpq *0x5c05(%rip)        # 6f40 <gethostbyname@GLIBC_2.2.5>
    133b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001340 <__memmove_chk@plt>:
    1340:	f3 0f 1e fa          	endbr64 
    1344:	f2 ff 25 fd 5b 00 00 	bnd jmpq *0x5bfd(%rip)        # 6f48 <__memmove_chk@GLIBC_2.3.4>
    134b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001350 <strtol@plt>:
    1350:	f3 0f 1e fa          	endbr64 
    1354:	f2 ff 25 f5 5b 00 00 	bnd jmpq *0x5bf5(%rip)        # 6f50 <strtol@GLIBC_2.2.5>
    135b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001360 <memcpy@plt>:
    1360:	f3 0f 1e fa          	endbr64 
    1364:	f2 ff 25 ed 5b 00 00 	bnd jmpq *0x5bed(%rip)        # 6f58 <memcpy@GLIBC_2.14>
    136b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001370 <time@plt>:
    1370:	f3 0f 1e fa          	endbr64 
    1374:	f2 ff 25 e5 5b 00 00 	bnd jmpq *0x5be5(%rip)        # 6f60 <time@GLIBC_2.2.5>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001380 <random@plt>:
    1380:	f3 0f 1e fa          	endbr64 
    1384:	f2 ff 25 dd 5b 00 00 	bnd jmpq *0x5bdd(%rip)        # 6f68 <random@GLIBC_2.2.5>
    138b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001390 <__isoc99_sscanf@plt>:
    1390:	f3 0f 1e fa          	endbr64 
    1394:	f2 ff 25 d5 5b 00 00 	bnd jmpq *0x5bd5(%rip)        # 6f70 <__isoc99_sscanf@GLIBC_2.7>
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013a0 <munmap@plt>:
    13a0:	f3 0f 1e fa          	endbr64 
    13a4:	f2 ff 25 cd 5b 00 00 	bnd jmpq *0x5bcd(%rip)        # 6f78 <munmap@GLIBC_2.2.5>
    13ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013b0 <__printf_chk@plt>:
    13b0:	f3 0f 1e fa          	endbr64 
    13b4:	f2 ff 25 c5 5b 00 00 	bnd jmpq *0x5bc5(%rip)        # 6f80 <__printf_chk@GLIBC_2.3.4>
    13bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013c0 <fopen@plt>:
    13c0:	f3 0f 1e fa          	endbr64 
    13c4:	f2 ff 25 bd 5b 00 00 	bnd jmpq *0x5bbd(%rip)        # 6f88 <fopen@GLIBC_2.2.5>
    13cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013d0 <getopt@plt>:
    13d0:	f3 0f 1e fa          	endbr64 
    13d4:	f2 ff 25 b5 5b 00 00 	bnd jmpq *0x5bb5(%rip)        # 6f90 <getopt@GLIBC_2.2.5>
    13db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013e0 <strtoul@plt>:
    13e0:	f3 0f 1e fa          	endbr64 
    13e4:	f2 ff 25 ad 5b 00 00 	bnd jmpq *0x5bad(%rip)        # 6f98 <strtoul@GLIBC_2.2.5>
    13eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013f0 <gethostname@plt>:
    13f0:	f3 0f 1e fa          	endbr64 
    13f4:	f2 ff 25 a5 5b 00 00 	bnd jmpq *0x5ba5(%rip)        # 6fa0 <gethostname@GLIBC_2.2.5>
    13fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001400 <exit@plt>:
    1400:	f3 0f 1e fa          	endbr64 
    1404:	f2 ff 25 9d 5b 00 00 	bnd jmpq *0x5b9d(%rip)        # 6fa8 <exit@GLIBC_2.2.5>
    140b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001410 <connect@plt>:
    1410:	f3 0f 1e fa          	endbr64 
    1414:	f2 ff 25 95 5b 00 00 	bnd jmpq *0x5b95(%rip)        # 6fb0 <connect@GLIBC_2.2.5>
    141b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001420 <__fprintf_chk@plt>:
    1420:	f3 0f 1e fa          	endbr64 
    1424:	f2 ff 25 8d 5b 00 00 	bnd jmpq *0x5b8d(%rip)        # 6fb8 <__fprintf_chk@GLIBC_2.3.4>
    142b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001430 <getc@plt>:
    1430:	f3 0f 1e fa          	endbr64 
    1434:	f2 ff 25 85 5b 00 00 	bnd jmpq *0x5b85(%rip)        # 6fc0 <getc@GLIBC_2.2.5>
    143b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001440 <__sprintf_chk@plt>:
    1440:	f3 0f 1e fa          	endbr64 
    1444:	f2 ff 25 7d 5b 00 00 	bnd jmpq *0x5b7d(%rip)        # 6fc8 <__sprintf_chk@GLIBC_2.3.4>
    144b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001450 <socket@plt>:
    1450:	f3 0f 1e fa          	endbr64 
    1454:	f2 ff 25 75 5b 00 00 	bnd jmpq *0x5b75(%rip)        # 6fd0 <socket@GLIBC_2.2.5>
    145b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001460 <_start>:
    1460:	f3 0f 1e fa          	endbr64 
    1464:	31 ed                	xor    %ebp,%ebp
    1466:	49 89 d1             	mov    %rdx,%r9
    1469:	5e                   	pop    %rsi
    146a:	48 89 e2             	mov    %rsp,%rdx
    146d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1471:	50                   	push   %rax
    1472:	54                   	push   %rsp
    1473:	4c 8d 05 26 23 00 00 	lea    0x2326(%rip),%r8        # 37a0 <__libc_csu_fini>
    147a:	48 8d 0d af 22 00 00 	lea    0x22af(%rip),%rcx        # 3730 <__libc_csu_init>
    1481:	48 8d 3d 04 03 00 00 	lea    0x304(%rip),%rdi        # 178c <main>
    1488:	ff 15 52 5b 00 00    	callq  *0x5b52(%rip)        # 6fe0 <__libc_start_main@GLIBC_2.2.5>
    148e:	f4                   	hlt    
    148f:	90                   	nop

0000000000001490 <deregister_tm_clones>:
    1490:	48 8d 3d d9 5e 00 00 	lea    0x5ed9(%rip),%rdi        # 7370 <__TMC_END__>
    1497:	48 8d 05 d2 5e 00 00 	lea    0x5ed2(%rip),%rax        # 7370 <__TMC_END__>
    149e:	48 39 f8             	cmp    %rdi,%rax
    14a1:	74 15                	je     14b8 <deregister_tm_clones+0x28>
    14a3:	48 8b 05 2e 5b 00 00 	mov    0x5b2e(%rip),%rax        # 6fd8 <_ITM_deregisterTMCloneTable>
    14aa:	48 85 c0             	test   %rax,%rax
    14ad:	74 09                	je     14b8 <deregister_tm_clones+0x28>
    14af:	ff e0                	jmpq   *%rax
    14b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    14b8:	c3                   	retq   
    14b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014c0 <register_tm_clones>:
    14c0:	48 8d 3d a9 5e 00 00 	lea    0x5ea9(%rip),%rdi        # 7370 <__TMC_END__>
    14c7:	48 8d 35 a2 5e 00 00 	lea    0x5ea2(%rip),%rsi        # 7370 <__TMC_END__>
    14ce:	48 29 fe             	sub    %rdi,%rsi
    14d1:	48 89 f0             	mov    %rsi,%rax
    14d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    14d8:	48 c1 f8 03          	sar    $0x3,%rax
    14dc:	48 01 c6             	add    %rax,%rsi
    14df:	48 d1 fe             	sar    %rsi
    14e2:	74 14                	je     14f8 <register_tm_clones+0x38>
    14e4:	48 8b 05 05 5b 00 00 	mov    0x5b05(%rip),%rax        # 6ff0 <_ITM_registerTMCloneTable>
    14eb:	48 85 c0             	test   %rax,%rax
    14ee:	74 08                	je     14f8 <register_tm_clones+0x38>
    14f0:	ff e0                	jmpq   *%rax
    14f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    14f8:	c3                   	retq   
    14f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001500 <__do_global_dtors_aux>:
    1500:	f3 0f 1e fa          	endbr64 
    1504:	80 3d 9d 5e 00 00 00 	cmpb   $0x0,0x5e9d(%rip)        # 73a8 <completed.8061>
    150b:	75 2b                	jne    1538 <__do_global_dtors_aux+0x38>
    150d:	55                   	push   %rbp
    150e:	48 83 3d e2 5a 00 00 	cmpq   $0x0,0x5ae2(%rip)        # 6ff8 <__cxa_finalize@GLIBC_2.2.5>
    1515:	00 
    1516:	48 89 e5             	mov    %rsp,%rbp
    1519:	74 0c                	je     1527 <__do_global_dtors_aux+0x27>
    151b:	48 8b 3d e6 5a 00 00 	mov    0x5ae6(%rip),%rdi        # 7008 <__dso_handle>
    1522:	e8 19 fd ff ff       	callq  1240 <__cxa_finalize@plt>
    1527:	e8 64 ff ff ff       	callq  1490 <deregister_tm_clones>
    152c:	c6 05 75 5e 00 00 01 	movb   $0x1,0x5e75(%rip)        # 73a8 <completed.8061>
    1533:	5d                   	pop    %rbp
    1534:	c3                   	retq   
    1535:	0f 1f 00             	nopl   (%rax)
    1538:	c3                   	retq   
    1539:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001540 <frame_dummy>:
    1540:	f3 0f 1e fa          	endbr64 
    1544:	e9 77 ff ff ff       	jmpq   14c0 <register_tm_clones>

0000000000001549 <usage>:
    1549:	50                   	push   %rax
    154a:	58                   	pop    %rax
    154b:	48 83 ec 08          	sub    $0x8,%rsp
    154f:	48 89 fa             	mov    %rdi,%rdx
    1552:	83 3d 8f 5e 00 00 00 	cmpl   $0x0,0x5e8f(%rip)        # 73e8 <is_checker>
    1559:	74 50                	je     15ab <usage+0x62>
    155b:	48 8d 35 a6 2a 00 00 	lea    0x2aa6(%rip),%rsi        # 4008 <_IO_stdin_used+0x8>
    1562:	bf 01 00 00 00       	mov    $0x1,%edi
    1567:	b8 00 00 00 00       	mov    $0x0,%eax
    156c:	e8 3f fe ff ff       	callq  13b0 <__printf_chk@plt>
    1571:	48 8d 3d c8 2a 00 00 	lea    0x2ac8(%rip),%rdi        # 4040 <_IO_stdin_used+0x40>
    1578:	e8 23 fd ff ff       	callq  12a0 <puts@plt>
    157d:	48 8d 3d 34 2c 00 00 	lea    0x2c34(%rip),%rdi        # 41b8 <_IO_stdin_used+0x1b8>
    1584:	e8 17 fd ff ff       	callq  12a0 <puts@plt>
    1589:	48 8d 3d d8 2a 00 00 	lea    0x2ad8(%rip),%rdi        # 4068 <_IO_stdin_used+0x68>
    1590:	e8 0b fd ff ff       	callq  12a0 <puts@plt>
    1595:	48 8d 3d 36 2c 00 00 	lea    0x2c36(%rip),%rdi        # 41d2 <_IO_stdin_used+0x1d2>
    159c:	e8 ff fc ff ff       	callq  12a0 <puts@plt>
    15a1:	bf 00 00 00 00       	mov    $0x0,%edi
    15a6:	e8 55 fe ff ff       	callq  1400 <exit@plt>
    15ab:	48 8d 35 3c 2c 00 00 	lea    0x2c3c(%rip),%rsi        # 41ee <_IO_stdin_used+0x1ee>
    15b2:	bf 01 00 00 00       	mov    $0x1,%edi
    15b7:	b8 00 00 00 00       	mov    $0x0,%eax
    15bc:	e8 ef fd ff ff       	callq  13b0 <__printf_chk@plt>
    15c1:	48 8d 3d c8 2a 00 00 	lea    0x2ac8(%rip),%rdi        # 4090 <_IO_stdin_used+0x90>
    15c8:	e8 d3 fc ff ff       	callq  12a0 <puts@plt>
    15cd:	48 8d 3d e4 2a 00 00 	lea    0x2ae4(%rip),%rdi        # 40b8 <_IO_stdin_used+0xb8>
    15d4:	e8 c7 fc ff ff       	callq  12a0 <puts@plt>
    15d9:	48 8d 3d 2c 2c 00 00 	lea    0x2c2c(%rip),%rdi        # 420c <_IO_stdin_used+0x20c>
    15e0:	e8 bb fc ff ff       	callq  12a0 <puts@plt>
    15e5:	eb ba                	jmp    15a1 <usage+0x58>

00000000000015e7 <initialize_target>:
    15e7:	55                   	push   %rbp
    15e8:	53                   	push   %rbx
    15e9:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    15f0:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    15f5:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    15fc:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1601:	48 81 ec 18 01 00 00 	sub    $0x118,%rsp
    1608:	89 f5                	mov    %esi,%ebp
    160a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1611:	00 00 
    1613:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
    161a:	00 
    161b:	31 c0                	xor    %eax,%eax
    161d:	89 3d b5 5d 00 00    	mov    %edi,0x5db5(%rip)        # 73d8 <check_level>
    1623:	8b 3d e7 59 00 00    	mov    0x59e7(%rip),%edi        # 7010 <target_id>
    1629:	e8 dc 20 00 00       	callq  370a <gencookie>
    162e:	89 c7                	mov    %eax,%edi
    1630:	89 05 ae 5d 00 00    	mov    %eax,0x5dae(%rip)        # 73e4 <cookie>
    1636:	e8 cf 20 00 00       	callq  370a <gencookie>
    163b:	89 05 9f 5d 00 00    	mov    %eax,0x5d9f(%rip)        # 73e0 <authkey>
    1641:	8b 05 c9 59 00 00    	mov    0x59c9(%rip),%eax        # 7010 <target_id>
    1647:	8d 78 01             	lea    0x1(%rax),%edi
    164a:	e8 21 fc ff ff       	callq  1270 <srandom@plt>
    164f:	e8 2c fd ff ff       	callq  1380 <random@plt>
    1654:	48 89 c7             	mov    %rax,%rdi
    1657:	e8 20 03 00 00       	callq  197c <scramble>
    165c:	89 c3                	mov    %eax,%ebx
    165e:	85 ed                	test   %ebp,%ebp
    1660:	75 54                	jne    16b6 <initialize_target+0xcf>
    1662:	b8 00 00 00 00       	mov    $0x0,%eax
    1667:	01 d8                	add    %ebx,%eax
    1669:	0f b7 c0             	movzwl %ax,%eax
    166c:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
    1673:	89 c0                	mov    %eax,%eax
    1675:	48 89 05 e4 5c 00 00 	mov    %rax,0x5ce4(%rip)        # 7360 <buf_offset>
    167c:	c6 05 85 69 00 00 72 	movb   $0x72,0x6985(%rip)        # 8008 <target_prefix>
    1683:	83 3d de 5c 00 00 00 	cmpl   $0x0,0x5cde(%rip)        # 7368 <notify>
    168a:	74 09                	je     1695 <initialize_target+0xae>
    168c:	83 3d 55 5d 00 00 00 	cmpl   $0x0,0x5d55(%rip)        # 73e8 <is_checker>
    1693:	74 3a                	je     16cf <initialize_target+0xe8>
    1695:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
    169c:	00 
    169d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    16a4:	00 00 
    16a6:	0f 85 db 00 00 00    	jne    1787 <initialize_target+0x1a0>
    16ac:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
    16b3:	5b                   	pop    %rbx
    16b4:	5d                   	pop    %rbp
    16b5:	c3                   	retq   
    16b6:	bf 00 00 00 00       	mov    $0x0,%edi
    16bb:	e8 b0 fc ff ff       	callq  1370 <time@plt>
    16c0:	48 89 c7             	mov    %rax,%rdi
    16c3:	e8 a8 fb ff ff       	callq  1270 <srandom@plt>
    16c8:	e8 b3 fc ff ff       	callq  1380 <random@plt>
    16cd:	eb 98                	jmp    1667 <initialize_target+0x80>
    16cf:	48 89 e7             	mov    %rsp,%rdi
    16d2:	be 00 01 00 00       	mov    $0x100,%esi
    16d7:	e8 14 fd ff ff       	callq  13f0 <gethostname@plt>
    16dc:	89 c5                	mov    %eax,%ebp
    16de:	85 c0                	test   %eax,%eax
    16e0:	75 26                	jne    1708 <initialize_target+0x121>
    16e2:	89 c3                	mov    %eax,%ebx
    16e4:	48 63 c3             	movslq %ebx,%rax
    16e7:	48 8d 15 52 59 00 00 	lea    0x5952(%rip),%rdx        # 7040 <host_table>
    16ee:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
    16f2:	48 85 ff             	test   %rdi,%rdi
    16f5:	74 2c                	je     1723 <initialize_target+0x13c>
    16f7:	48 89 e6             	mov    %rsp,%rsi
    16fa:	e8 51 fb ff ff       	callq  1250 <strcasecmp@plt>
    16ff:	85 c0                	test   %eax,%eax
    1701:	74 1b                	je     171e <initialize_target+0x137>
    1703:	83 c3 01             	add    $0x1,%ebx
    1706:	eb dc                	jmp    16e4 <initialize_target+0xfd>
    1708:	48 8d 3d d9 29 00 00 	lea    0x29d9(%rip),%rdi        # 40e8 <_IO_stdin_used+0xe8>
    170f:	e8 8c fb ff ff       	callq  12a0 <puts@plt>
    1714:	bf 08 00 00 00       	mov    $0x8,%edi
    1719:	e8 e2 fc ff ff       	callq  1400 <exit@plt>
    171e:	bd 01 00 00 00       	mov    $0x1,%ebp
    1723:	85 ed                	test   %ebp,%ebp
    1725:	74 3d                	je     1764 <initialize_target+0x17d>
    1727:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
    172e:	00 
    172f:	e8 1b 1d 00 00       	callq  344f <init_driver>
    1734:	85 c0                	test   %eax,%eax
    1736:	0f 89 59 ff ff ff    	jns    1695 <initialize_target+0xae>
    173c:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
    1743:	00 
    1744:	48 8d 35 15 2a 00 00 	lea    0x2a15(%rip),%rsi        # 4160 <_IO_stdin_used+0x160>
    174b:	bf 01 00 00 00       	mov    $0x1,%edi
    1750:	b8 00 00 00 00       	mov    $0x0,%eax
    1755:	e8 56 fc ff ff       	callq  13b0 <__printf_chk@plt>
    175a:	bf 08 00 00 00       	mov    $0x8,%edi
    175f:	e8 9c fc ff ff       	callq  1400 <exit@plt>
    1764:	48 89 e2             	mov    %rsp,%rdx
    1767:	48 8d 35 b2 29 00 00 	lea    0x29b2(%rip),%rsi        # 4120 <_IO_stdin_used+0x120>
    176e:	bf 01 00 00 00       	mov    $0x1,%edi
    1773:	b8 00 00 00 00       	mov    $0x0,%eax
    1778:	e8 33 fc ff ff       	callq  13b0 <__printf_chk@plt>
    177d:	bf 08 00 00 00       	mov    $0x8,%edi
    1782:	e8 79 fc ff ff       	callq  1400 <exit@plt>
    1787:	e8 34 fb ff ff       	callq  12c0 <__stack_chk_fail@plt>

000000000000178c <main>:
    178c:	f3 0f 1e fa          	endbr64 
    1790:	41 56                	push   %r14
    1792:	41 55                	push   %r13
    1794:	41 54                	push   %r12
    1796:	55                   	push   %rbp
    1797:	53                   	push   %rbx
    1798:	89 fd                	mov    %edi,%ebp
    179a:	48 89 f3             	mov    %rsi,%rbx
    179d:	48 8d 35 4e 0f 00 00 	lea    0xf4e(%rip),%rsi        # 26f2 <seghandler>
    17a4:	bf 0b 00 00 00       	mov    $0xb,%edi
    17a9:	e8 72 fb ff ff       	callq  1320 <signal@plt>
    17ae:	48 8d 35 e3 0e 00 00 	lea    0xee3(%rip),%rsi        # 2698 <bushandler>
    17b5:	bf 07 00 00 00       	mov    $0x7,%edi
    17ba:	e8 61 fb ff ff       	callq  1320 <signal@plt>
    17bf:	48 8d 35 86 0f 00 00 	lea    0xf86(%rip),%rsi        # 274c <illegalhandler>
    17c6:	bf 04 00 00 00       	mov    $0x4,%edi
    17cb:	e8 50 fb ff ff       	callq  1320 <signal@plt>
    17d0:	83 3d 11 5c 00 00 00 	cmpl   $0x0,0x5c11(%rip)        # 73e8 <is_checker>
    17d7:	75 26                	jne    17ff <main+0x73>
    17d9:	4c 8d 25 4d 2a 00 00 	lea    0x2a4d(%rip),%r12        # 422d <_IO_stdin_used+0x22d>
    17e0:	48 8b 05 99 5b 00 00 	mov    0x5b99(%rip),%rax        # 7380 <stdin@@GLIBC_2.2.5>
    17e7:	48 89 05 e2 5b 00 00 	mov    %rax,0x5be2(%rip)        # 73d0 <infile>
    17ee:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    17f4:	41 be 00 00 00 00    	mov    $0x0,%r14d
    17fa:	e9 8d 00 00 00       	jmpq   188c <main+0x100>
    17ff:	48 8d 35 a0 0f 00 00 	lea    0xfa0(%rip),%rsi        # 27a6 <sigalrmhandler>
    1806:	bf 0e 00 00 00       	mov    $0xe,%edi
    180b:	e8 10 fb ff ff       	callq  1320 <signal@plt>
    1810:	bf 05 00 00 00       	mov    $0x5,%edi
    1815:	e8 d6 fa ff ff       	callq  12f0 <alarm@plt>
    181a:	4c 8d 25 04 2a 00 00 	lea    0x2a04(%rip),%r12        # 4225 <_IO_stdin_used+0x225>
    1821:	eb bd                	jmp    17e0 <main+0x54>
    1823:	48 8b 3b             	mov    (%rbx),%rdi
    1826:	e8 1e fd ff ff       	callq  1549 <usage>
    182b:	48 8d 35 db 2c 00 00 	lea    0x2cdb(%rip),%rsi        # 450d <_IO_stdin_used+0x50d>
    1832:	48 8b 3d 4f 5b 00 00 	mov    0x5b4f(%rip),%rdi        # 7388 <optarg@@GLIBC_2.2.5>
    1839:	e8 82 fb ff ff       	callq  13c0 <fopen@plt>
    183e:	48 89 05 8b 5b 00 00 	mov    %rax,0x5b8b(%rip)        # 73d0 <infile>
    1845:	48 85 c0             	test   %rax,%rax
    1848:	75 42                	jne    188c <main+0x100>
    184a:	48 8b 0d 37 5b 00 00 	mov    0x5b37(%rip),%rcx        # 7388 <optarg@@GLIBC_2.2.5>
    1851:	48 8d 15 da 29 00 00 	lea    0x29da(%rip),%rdx        # 4232 <_IO_stdin_used+0x232>
    1858:	be 01 00 00 00       	mov    $0x1,%esi
    185d:	48 8b 3d 3c 5b 00 00 	mov    0x5b3c(%rip),%rdi        # 73a0 <stderr@@GLIBC_2.2.5>
    1864:	e8 b7 fb ff ff       	callq  1420 <__fprintf_chk@plt>
    1869:	b8 01 00 00 00       	mov    $0x1,%eax
    186e:	e9 db 00 00 00       	jmpq   194e <main+0x1c2>
    1873:	ba 10 00 00 00       	mov    $0x10,%edx
    1878:	be 00 00 00 00       	mov    $0x0,%esi
    187d:	48 8b 3d 04 5b 00 00 	mov    0x5b04(%rip),%rdi        # 7388 <optarg@@GLIBC_2.2.5>
    1884:	e8 57 fb ff ff       	callq  13e0 <strtoul@plt>
    1889:	41 89 c6             	mov    %eax,%r14d
    188c:	4c 89 e2             	mov    %r12,%rdx
    188f:	48 89 de             	mov    %rbx,%rsi
    1892:	89 ef                	mov    %ebp,%edi
    1894:	e8 37 fb ff ff       	callq  13d0 <getopt@plt>
    1899:	3c ff                	cmp    $0xff,%al
    189b:	74 65                	je     1902 <main+0x176>
    189d:	0f be c8             	movsbl %al,%ecx
    18a0:	83 e8 61             	sub    $0x61,%eax
    18a3:	3c 10                	cmp    $0x10,%al
    18a5:	77 3b                	ja     18e2 <main+0x156>
    18a7:	0f b6 c0             	movzbl %al,%eax
    18aa:	48 8d 15 bf 29 00 00 	lea    0x29bf(%rip),%rdx        # 4270 <_IO_stdin_used+0x270>
    18b1:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    18b5:	48 01 d0             	add    %rdx,%rax
    18b8:	3e ff e0             	notrack jmpq *%rax
    18bb:	ba 0a 00 00 00       	mov    $0xa,%edx
    18c0:	be 00 00 00 00       	mov    $0x0,%esi
    18c5:	48 8b 3d bc 5a 00 00 	mov    0x5abc(%rip),%rdi        # 7388 <optarg@@GLIBC_2.2.5>
    18cc:	e8 7f fa ff ff       	callq  1350 <strtol@plt>
    18d1:	41 89 c5             	mov    %eax,%r13d
    18d4:	eb b6                	jmp    188c <main+0x100>
    18d6:	c7 05 88 5a 00 00 00 	movl   $0x0,0x5a88(%rip)        # 7368 <notify>
    18dd:	00 00 00 
    18e0:	eb aa                	jmp    188c <main+0x100>
    18e2:	89 ca                	mov    %ecx,%edx
    18e4:	48 8d 35 64 29 00 00 	lea    0x2964(%rip),%rsi        # 424f <_IO_stdin_used+0x24f>
    18eb:	bf 01 00 00 00       	mov    $0x1,%edi
    18f0:	b8 00 00 00 00       	mov    $0x0,%eax
    18f5:	e8 b6 fa ff ff       	callq  13b0 <__printf_chk@plt>
    18fa:	48 8b 3b             	mov    (%rbx),%rdi
    18fd:	e8 47 fc ff ff       	callq  1549 <usage>
    1902:	be 01 00 00 00       	mov    $0x1,%esi
    1907:	44 89 ef             	mov    %r13d,%edi
    190a:	e8 d8 fc ff ff       	callq  15e7 <initialize_target>
    190f:	83 3d d2 5a 00 00 00 	cmpl   $0x0,0x5ad2(%rip)        # 73e8 <is_checker>
    1916:	74 09                	je     1921 <main+0x195>
    1918:	44 39 35 c1 5a 00 00 	cmp    %r14d,0x5ac1(%rip)        # 73e0 <authkey>
    191f:	75 36                	jne    1957 <main+0x1cb>
    1921:	8b 15 bd 5a 00 00    	mov    0x5abd(%rip),%edx        # 73e4 <cookie>
    1927:	48 8d 35 34 29 00 00 	lea    0x2934(%rip),%rsi        # 4262 <_IO_stdin_used+0x262>
    192e:	bf 01 00 00 00       	mov    $0x1,%edi
    1933:	b8 00 00 00 00       	mov    $0x0,%eax
    1938:	e8 73 fa ff ff       	callq  13b0 <__printf_chk@plt>
    193d:	48 8b 3d 1c 5a 00 00 	mov    0x5a1c(%rip),%rdi        # 7360 <buf_offset>
    1944:	e8 ba 0e 00 00       	callq  2803 <launch>
    1949:	b8 00 00 00 00       	mov    $0x0,%eax
    194e:	5b                   	pop    %rbx
    194f:	5d                   	pop    %rbp
    1950:	41 5c                	pop    %r12
    1952:	41 5d                	pop    %r13
    1954:	41 5e                	pop    %r14
    1956:	c3                   	retq   
    1957:	44 89 f2             	mov    %r14d,%edx
    195a:	48 8d 35 27 28 00 00 	lea    0x2827(%rip),%rsi        # 4188 <_IO_stdin_used+0x188>
    1961:	bf 01 00 00 00       	mov    $0x1,%edi
    1966:	b8 00 00 00 00       	mov    $0x0,%eax
    196b:	e8 40 fa ff ff       	callq  13b0 <__printf_chk@plt>
    1970:	b8 00 00 00 00       	mov    $0x0,%eax
    1975:	e8 6d 09 00 00       	callq  22e7 <check_fail>
    197a:	eb a5                	jmp    1921 <main+0x195>

000000000000197c <scramble>:
    197c:	f3 0f 1e fa          	endbr64 
    1980:	48 83 ec 38          	sub    $0x38,%rsp
    1984:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    198b:	00 00 
    198d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    1992:	31 c0                	xor    %eax,%eax
    1994:	83 f8 09             	cmp    $0x9,%eax
    1997:	77 12                	ja     19ab <scramble+0x2f>
    1999:	69 d0 3d 5f 00 00    	imul   $0x5f3d,%eax,%edx
    199f:	01 fa                	add    %edi,%edx
    19a1:	89 c1                	mov    %eax,%ecx
    19a3:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
    19a6:	83 c0 01             	add    $0x1,%eax
    19a9:	eb e9                	jmp    1994 <scramble+0x18>
    19ab:	8b 44 24 18          	mov    0x18(%rsp),%eax
    19af:	69 c0 13 0e 00 00    	imul   $0xe13,%eax,%eax
    19b5:	89 44 24 18          	mov    %eax,0x18(%rsp)
    19b9:	8b 44 24 08          	mov    0x8(%rsp),%eax
    19bd:	69 c0 d9 01 00 00    	imul   $0x1d9,%eax,%eax
    19c3:	89 44 24 08          	mov    %eax,0x8(%rsp)
    19c7:	8b 44 24 08          	mov    0x8(%rsp),%eax
    19cb:	69 c0 cb 38 00 00    	imul   $0x38cb,%eax,%eax
    19d1:	89 44 24 08          	mov    %eax,0x8(%rsp)
    19d5:	8b 44 24 04          	mov    0x4(%rsp),%eax
    19d9:	69 c0 92 ab 00 00    	imul   $0xab92,%eax,%eax
    19df:	89 44 24 04          	mov    %eax,0x4(%rsp)
    19e3:	8b 44 24 24          	mov    0x24(%rsp),%eax
    19e7:	69 c0 6b 57 00 00    	imul   $0x576b,%eax,%eax
    19ed:	89 44 24 24          	mov    %eax,0x24(%rsp)
    19f1:	8b 44 24 10          	mov    0x10(%rsp),%eax
    19f5:	69 c0 ea ce 00 00    	imul   $0xceea,%eax,%eax
    19fb:	89 44 24 10          	mov    %eax,0x10(%rsp)
    19ff:	8b 04 24             	mov    (%rsp),%eax
    1a02:	69 c0 9e f5 00 00    	imul   $0xf59e,%eax,%eax
    1a08:	89 04 24             	mov    %eax,(%rsp)
    1a0b:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1a0f:	69 c0 ac 9d 00 00    	imul   $0x9dac,%eax,%eax
    1a15:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1a19:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1a1d:	69 c0 fa 46 00 00    	imul   $0x46fa,%eax,%eax
    1a23:	89 44 24 10          	mov    %eax,0x10(%rsp)
    1a27:	8b 44 24 20          	mov    0x20(%rsp),%eax
    1a2b:	69 c0 bd f7 00 00    	imul   $0xf7bd,%eax,%eax
    1a31:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1a35:	8b 04 24             	mov    (%rsp),%eax
    1a38:	69 c0 47 13 00 00    	imul   $0x1347,%eax,%eax
    1a3e:	89 04 24             	mov    %eax,(%rsp)
    1a41:	8b 04 24             	mov    (%rsp),%eax
    1a44:	69 c0 2d 09 00 00    	imul   $0x92d,%eax,%eax
    1a4a:	89 04 24             	mov    %eax,(%rsp)
    1a4d:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1a51:	69 c0 86 da 00 00    	imul   $0xda86,%eax,%eax
    1a57:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1a5b:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1a5f:	69 c0 36 e9 00 00    	imul   $0xe936,%eax,%eax
    1a65:	89 44 24 10          	mov    %eax,0x10(%rsp)
    1a69:	8b 04 24             	mov    (%rsp),%eax
    1a6c:	69 c0 91 9b 00 00    	imul   $0x9b91,%eax,%eax
    1a72:	89 04 24             	mov    %eax,(%rsp)
    1a75:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1a79:	69 c0 11 f3 00 00    	imul   $0xf311,%eax,%eax
    1a7f:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1a83:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1a87:	69 c0 ca 50 00 00    	imul   $0x50ca,%eax,%eax
    1a8d:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1a91:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1a95:	69 c0 26 b4 00 00    	imul   $0xb426,%eax,%eax
    1a9b:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1a9f:	8b 04 24             	mov    (%rsp),%eax
    1aa2:	69 c0 bd c2 00 00    	imul   $0xc2bd,%eax,%eax
    1aa8:	89 04 24             	mov    %eax,(%rsp)
    1aab:	8b 04 24             	mov    (%rsp),%eax
    1aae:	69 c0 75 f7 00 00    	imul   $0xf775,%eax,%eax
    1ab4:	89 04 24             	mov    %eax,(%rsp)
    1ab7:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1abb:	69 c0 c7 81 00 00    	imul   $0x81c7,%eax,%eax
    1ac1:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1ac5:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1ac9:	69 c0 a2 96 00 00    	imul   $0x96a2,%eax,%eax
    1acf:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1ad3:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1ad7:	69 c0 03 0b 00 00    	imul   $0xb03,%eax,%eax
    1add:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1ae1:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1ae5:	69 c0 b2 44 00 00    	imul   $0x44b2,%eax,%eax
    1aeb:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1aef:	8b 44 24 20          	mov    0x20(%rsp),%eax
    1af3:	69 c0 2d 72 00 00    	imul   $0x722d,%eax,%eax
    1af9:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1afd:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1b01:	69 c0 83 13 00 00    	imul   $0x1383,%eax,%eax
    1b07:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1b0b:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1b0f:	69 c0 32 ac 00 00    	imul   $0xac32,%eax,%eax
    1b15:	89 44 24 10          	mov    %eax,0x10(%rsp)
    1b19:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1b1d:	69 c0 1d 34 00 00    	imul   $0x341d,%eax,%eax
    1b23:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1b27:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1b2b:	69 c0 a1 fe 00 00    	imul   $0xfea1,%eax,%eax
    1b31:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1b35:	8b 04 24             	mov    (%rsp),%eax
    1b38:	69 c0 8d 1a 00 00    	imul   $0x1a8d,%eax,%eax
    1b3e:	89 04 24             	mov    %eax,(%rsp)
    1b41:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1b45:	69 c0 2e 5a 00 00    	imul   $0x5a2e,%eax,%eax
    1b4b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1b4f:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1b53:	69 c0 d6 43 00 00    	imul   $0x43d6,%eax,%eax
    1b59:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1b5d:	8b 44 24 20          	mov    0x20(%rsp),%eax
    1b61:	69 c0 89 02 00 00    	imul   $0x289,%eax,%eax
    1b67:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1b6b:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1b6f:	69 c0 8e 34 00 00    	imul   $0x348e,%eax,%eax
    1b75:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1b79:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1b7d:	69 c0 b4 57 00 00    	imul   $0x57b4,%eax,%eax
    1b83:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1b87:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1b8b:	69 c0 6e df 00 00    	imul   $0xdf6e,%eax,%eax
    1b91:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1b95:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1b99:	69 c0 62 f2 00 00    	imul   $0xf262,%eax,%eax
    1b9f:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1ba3:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1ba7:	69 c0 e1 50 00 00    	imul   $0x50e1,%eax,%eax
    1bad:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1bb1:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1bb5:	69 c0 60 aa 00 00    	imul   $0xaa60,%eax,%eax
    1bbb:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1bbf:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1bc3:	69 c0 63 4f 00 00    	imul   $0x4f63,%eax,%eax
    1bc9:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1bcd:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1bd1:	69 c0 03 d2 00 00    	imul   $0xd203,%eax,%eax
    1bd7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1bdb:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1bdf:	69 c0 02 a2 00 00    	imul   $0xa202,%eax,%eax
    1be5:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1be9:	8b 04 24             	mov    (%rsp),%eax
    1bec:	69 c0 97 7f 00 00    	imul   $0x7f97,%eax,%eax
    1bf2:	89 04 24             	mov    %eax,(%rsp)
    1bf5:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1bf9:	69 c0 ee 04 00 00    	imul   $0x4ee,%eax,%eax
    1bff:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1c03:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1c07:	69 c0 73 f3 00 00    	imul   $0xf373,%eax,%eax
    1c0d:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1c11:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1c15:	69 c0 6b 18 00 00    	imul   $0x186b,%eax,%eax
    1c1b:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1c1f:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1c23:	69 c0 19 2d 00 00    	imul   $0x2d19,%eax,%eax
    1c29:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1c2d:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1c31:	69 c0 9a f8 00 00    	imul   $0xf89a,%eax,%eax
    1c37:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1c3b:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1c3f:	69 c0 3e 54 00 00    	imul   $0x543e,%eax,%eax
    1c45:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1c49:	8b 04 24             	mov    (%rsp),%eax
    1c4c:	69 c0 e9 f4 00 00    	imul   $0xf4e9,%eax,%eax
    1c52:	89 04 24             	mov    %eax,(%rsp)
    1c55:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1c59:	69 c0 2c 59 00 00    	imul   $0x592c,%eax,%eax
    1c5f:	89 44 24 10          	mov    %eax,0x10(%rsp)
    1c63:	8b 04 24             	mov    (%rsp),%eax
    1c66:	69 c0 6e 85 00 00    	imul   $0x856e,%eax,%eax
    1c6c:	89 04 24             	mov    %eax,(%rsp)
    1c6f:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1c73:	69 c0 69 4a 00 00    	imul   $0x4a69,%eax,%eax
    1c79:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1c7d:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1c81:	69 c0 f4 48 00 00    	imul   $0x48f4,%eax,%eax
    1c87:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1c8b:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1c8f:	69 c0 e2 6b 00 00    	imul   $0x6be2,%eax,%eax
    1c95:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1c99:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1c9d:	69 c0 56 11 00 00    	imul   $0x1156,%eax,%eax
    1ca3:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1ca7:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1cab:	69 c0 3d fb 00 00    	imul   $0xfb3d,%eax,%eax
    1cb1:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1cb5:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1cb9:	69 c0 1b bc 00 00    	imul   $0xbc1b,%eax,%eax
    1cbf:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1cc3:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1cc7:	69 c0 79 89 00 00    	imul   $0x8979,%eax,%eax
    1ccd:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1cd1:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1cd5:	69 c0 0d f9 00 00    	imul   $0xf90d,%eax,%eax
    1cdb:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1cdf:	8b 44 24 20          	mov    0x20(%rsp),%eax
    1ce3:	69 c0 84 e0 00 00    	imul   $0xe084,%eax,%eax
    1ce9:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1ced:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1cf1:	69 c0 8e ca 00 00    	imul   $0xca8e,%eax,%eax
    1cf7:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1cfb:	8b 04 24             	mov    (%rsp),%eax
    1cfe:	69 c0 b9 6d 00 00    	imul   $0x6db9,%eax,%eax
    1d04:	89 04 24             	mov    %eax,(%rsp)
    1d07:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1d0b:	69 c0 41 3d 00 00    	imul   $0x3d41,%eax,%eax
    1d11:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1d15:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1d19:	69 c0 50 f0 00 00    	imul   $0xf050,%eax,%eax
    1d1f:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1d23:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1d27:	69 c0 ea 6d 00 00    	imul   $0x6dea,%eax,%eax
    1d2d:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1d31:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1d35:	69 c0 82 06 00 00    	imul   $0x682,%eax,%eax
    1d3b:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1d3f:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1d43:	69 c0 0b 95 00 00    	imul   $0x950b,%eax,%eax
    1d49:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1d4d:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1d51:	69 c0 a7 c9 00 00    	imul   $0xc9a7,%eax,%eax
    1d57:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1d5b:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1d5f:	69 c0 b4 45 00 00    	imul   $0x45b4,%eax,%eax
    1d65:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1d69:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1d6d:	69 c0 56 76 00 00    	imul   $0x7656,%eax,%eax
    1d73:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1d77:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1d7b:	69 c0 6f 73 00 00    	imul   $0x736f,%eax,%eax
    1d81:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1d85:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1d89:	69 c0 64 0a 00 00    	imul   $0xa64,%eax,%eax
    1d8f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1d93:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1d97:	69 c0 68 ec 00 00    	imul   $0xec68,%eax,%eax
    1d9d:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1da1:	8b 44 24 14          	mov    0x14(%rsp),%eax
    1da5:	69 c0 94 f0 00 00    	imul   $0xf094,%eax,%eax
    1dab:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1daf:	8b 44 24 24          	mov    0x24(%rsp),%eax
    1db3:	69 c0 c9 10 00 00    	imul   $0x10c9,%eax,%eax
    1db9:	89 44 24 24          	mov    %eax,0x24(%rsp)
    1dbd:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1dc1:	69 c0 ed f6 00 00    	imul   $0xf6ed,%eax,%eax
    1dc7:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1dcb:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1dcf:	69 c0 b7 de 00 00    	imul   $0xdeb7,%eax,%eax
    1dd5:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1dd9:	8b 04 24             	mov    (%rsp),%eax
    1ddc:	69 c0 7f 9e 00 00    	imul   $0x9e7f,%eax,%eax
    1de2:	89 04 24             	mov    %eax,(%rsp)
    1de5:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1de9:	69 c0 9e 26 00 00    	imul   $0x269e,%eax,%eax
    1def:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1df3:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1df7:	69 c0 22 4e 00 00    	imul   $0x4e22,%eax,%eax
    1dfd:	89 44 24 10          	mov    %eax,0x10(%rsp)
    1e01:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1e05:	69 c0 4c d8 00 00    	imul   $0xd84c,%eax,%eax
    1e0b:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1e0f:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1e13:	69 c0 e0 87 00 00    	imul   $0x87e0,%eax,%eax
    1e19:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1e1d:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1e21:	69 c0 90 a5 00 00    	imul   $0xa590,%eax,%eax
    1e27:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1e2b:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1e2f:	69 c0 56 4b 00 00    	imul   $0x4b56,%eax,%eax
    1e35:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1e39:	8b 04 24             	mov    (%rsp),%eax
    1e3c:	69 c0 10 87 00 00    	imul   $0x8710,%eax,%eax
    1e42:	89 04 24             	mov    %eax,(%rsp)
    1e45:	8b 44 24 20          	mov    0x20(%rsp),%eax
    1e49:	69 c0 50 42 00 00    	imul   $0x4250,%eax,%eax
    1e4f:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1e53:	b8 00 00 00 00       	mov    $0x0,%eax
    1e58:	ba 00 00 00 00       	mov    $0x0,%edx
    1e5d:	83 f8 09             	cmp    $0x9,%eax
    1e60:	77 0c                	ja     1e6e <scramble+0x4f2>
    1e62:	89 c1                	mov    %eax,%ecx
    1e64:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
    1e67:	01 ca                	add    %ecx,%edx
    1e69:	83 c0 01             	add    $0x1,%eax
    1e6c:	eb ef                	jmp    1e5d <scramble+0x4e1>
    1e6e:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    1e73:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1e7a:	00 00 
    1e7c:	75 07                	jne    1e85 <scramble+0x509>
    1e7e:	89 d0                	mov    %edx,%eax
    1e80:	48 83 c4 38          	add    $0x38,%rsp
    1e84:	c3                   	retq   
    1e85:	e8 36 f4 ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000001e8a <getbuf>:
    1e8a:	f3 0f 1e fa          	endbr64 
    1e8e:	48 83 ec 38          	sub    $0x38,%rsp
    1e92:	48 89 e7             	mov    %rsp,%rdi
    1e95:	e8 8b 04 00 00       	callq  2325 <Gets>
    1e9a:	b8 01 00 00 00       	mov    $0x1,%eax
    1e9f:	48 83 c4 38          	add    $0x38,%rsp
    1ea3:	c3                   	retq   

0000000000001ea4 <touch1>:
    1ea4:	f3 0f 1e fa          	endbr64 
    1ea8:	50                   	push   %rax
    1ea9:	58                   	pop    %rax
    1eaa:	48 83 ec 08          	sub    $0x8,%rsp
    1eae:	c7 05 24 55 00 00 01 	movl   $0x1,0x5524(%rip)        # 73dc <vlevel>
    1eb5:	00 00 00 
    1eb8:	48 8d 3d a7 24 00 00 	lea    0x24a7(%rip),%rdi        # 4366 <_IO_stdin_used+0x366>
    1ebf:	e8 dc f3 ff ff       	callq  12a0 <puts@plt>
    1ec4:	bf 01 00 00 00       	mov    $0x1,%edi
    1ec9:	e8 ca 06 00 00       	callq  2598 <validate>
    1ece:	bf 00 00 00 00       	mov    $0x0,%edi
    1ed3:	e8 28 f5 ff ff       	callq  1400 <exit@plt>

0000000000001ed8 <touch2>:
    1ed8:	f3 0f 1e fa          	endbr64 
    1edc:	50                   	push   %rax
    1edd:	58                   	pop    %rax
    1ede:	48 83 ec 08          	sub    $0x8,%rsp
    1ee2:	89 fa                	mov    %edi,%edx
    1ee4:	c7 05 ee 54 00 00 02 	movl   $0x2,0x54ee(%rip)        # 73dc <vlevel>
    1eeb:	00 00 00 
    1eee:	39 3d f0 54 00 00    	cmp    %edi,0x54f0(%rip)        # 73e4 <cookie>
    1ef4:	74 2a                	je     1f20 <touch2+0x48>
    1ef6:	48 8d 35 b3 24 00 00 	lea    0x24b3(%rip),%rsi        # 43b0 <_IO_stdin_used+0x3b0>
    1efd:	bf 01 00 00 00       	mov    $0x1,%edi
    1f02:	b8 00 00 00 00       	mov    $0x0,%eax
    1f07:	e8 a4 f4 ff ff       	callq  13b0 <__printf_chk@plt>
    1f0c:	bf 02 00 00 00       	mov    $0x2,%edi
    1f11:	e8 56 07 00 00       	callq  266c <fail>
    1f16:	bf 00 00 00 00       	mov    $0x0,%edi
    1f1b:	e8 e0 f4 ff ff       	callq  1400 <exit@plt>
    1f20:	48 8d 35 61 24 00 00 	lea    0x2461(%rip),%rsi        # 4388 <_IO_stdin_used+0x388>
    1f27:	bf 01 00 00 00       	mov    $0x1,%edi
    1f2c:	b8 00 00 00 00       	mov    $0x0,%eax
    1f31:	e8 7a f4 ff ff       	callq  13b0 <__printf_chk@plt>
    1f36:	bf 02 00 00 00       	mov    $0x2,%edi
    1f3b:	e8 58 06 00 00       	callq  2598 <validate>
    1f40:	eb d4                	jmp    1f16 <touch2+0x3e>

0000000000001f42 <hexmatch>:
    1f42:	f3 0f 1e fa          	endbr64 
    1f46:	41 55                	push   %r13
    1f48:	41 54                	push   %r12
    1f4a:	55                   	push   %rbp
    1f4b:	53                   	push   %rbx
    1f4c:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
    1f53:	89 fd                	mov    %edi,%ebp
    1f55:	48 89 f3             	mov    %rsi,%rbx
    1f58:	41 bc 28 00 00 00    	mov    $0x28,%r12d
    1f5e:	64 49 8b 04 24       	mov    %fs:(%r12),%rax
    1f63:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
    1f68:	31 c0                	xor    %eax,%eax
    1f6a:	e8 11 f4 ff ff       	callq  1380 <random@plt>
    1f6f:	48 89 c1             	mov    %rax,%rcx
    1f72:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
    1f79:	0a d7 a3 
    1f7c:	48 f7 ea             	imul   %rdx
    1f7f:	48 01 ca             	add    %rcx,%rdx
    1f82:	48 c1 fa 06          	sar    $0x6,%rdx
    1f86:	48 89 c8             	mov    %rcx,%rax
    1f89:	48 c1 f8 3f          	sar    $0x3f,%rax
    1f8d:	48 29 c2             	sub    %rax,%rdx
    1f90:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
    1f94:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1f98:	48 c1 e0 02          	shl    $0x2,%rax
    1f9c:	48 29 c1             	sub    %rax,%rcx
    1f9f:	4c 8d 2c 0c          	lea    (%rsp,%rcx,1),%r13
    1fa3:	41 89 e8             	mov    %ebp,%r8d
    1fa6:	48 8d 0d d6 23 00 00 	lea    0x23d6(%rip),%rcx        # 4383 <_IO_stdin_used+0x383>
    1fad:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    1fb4:	be 01 00 00 00       	mov    $0x1,%esi
    1fb9:	4c 89 ef             	mov    %r13,%rdi
    1fbc:	b8 00 00 00 00       	mov    $0x0,%eax
    1fc1:	e8 7a f4 ff ff       	callq  1440 <__sprintf_chk@plt>
    1fc6:	ba 09 00 00 00       	mov    $0x9,%edx
    1fcb:	4c 89 ee             	mov    %r13,%rsi
    1fce:	48 89 df             	mov    %rbx,%rdi
    1fd1:	e8 aa f2 ff ff       	callq  1280 <strncmp@plt>
    1fd6:	85 c0                	test   %eax,%eax
    1fd8:	0f 94 c0             	sete   %al
    1fdb:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    1fe0:	64 49 33 1c 24       	xor    %fs:(%r12),%rbx
    1fe5:	75 11                	jne    1ff8 <hexmatch+0xb6>
    1fe7:	0f b6 c0             	movzbl %al,%eax
    1fea:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
    1ff1:	5b                   	pop    %rbx
    1ff2:	5d                   	pop    %rbp
    1ff3:	41 5c                	pop    %r12
    1ff5:	41 5d                	pop    %r13
    1ff7:	c3                   	retq   
    1ff8:	e8 c3 f2 ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000001ffd <touch3>:
    1ffd:	f3 0f 1e fa          	endbr64 
    2001:	53                   	push   %rbx
    2002:	48 89 fb             	mov    %rdi,%rbx
    2005:	c7 05 cd 53 00 00 03 	movl   $0x3,0x53cd(%rip)        # 73dc <vlevel>
    200c:	00 00 00 
    200f:	48 89 fe             	mov    %rdi,%rsi
    2012:	8b 3d cc 53 00 00    	mov    0x53cc(%rip),%edi        # 73e4 <cookie>
    2018:	e8 25 ff ff ff       	callq  1f42 <hexmatch>
    201d:	85 c0                	test   %eax,%eax
    201f:	74 2d                	je     204e <touch3+0x51>
    2021:	48 89 da             	mov    %rbx,%rdx
    2024:	48 8d 35 ad 23 00 00 	lea    0x23ad(%rip),%rsi        # 43d8 <_IO_stdin_used+0x3d8>
    202b:	bf 01 00 00 00       	mov    $0x1,%edi
    2030:	b8 00 00 00 00       	mov    $0x0,%eax
    2035:	e8 76 f3 ff ff       	callq  13b0 <__printf_chk@plt>
    203a:	bf 03 00 00 00       	mov    $0x3,%edi
    203f:	e8 54 05 00 00       	callq  2598 <validate>
    2044:	bf 00 00 00 00       	mov    $0x0,%edi
    2049:	e8 b2 f3 ff ff       	callq  1400 <exit@plt>
    204e:	48 89 da             	mov    %rbx,%rdx
    2051:	48 8d 35 a8 23 00 00 	lea    0x23a8(%rip),%rsi        # 4400 <_IO_stdin_used+0x400>
    2058:	bf 01 00 00 00       	mov    $0x1,%edi
    205d:	b8 00 00 00 00       	mov    $0x0,%eax
    2062:	e8 49 f3 ff ff       	callq  13b0 <__printf_chk@plt>
    2067:	bf 03 00 00 00       	mov    $0x3,%edi
    206c:	e8 fb 05 00 00       	callq  266c <fail>
    2071:	eb d1                	jmp    2044 <touch3+0x47>

0000000000002073 <test>:
    2073:	f3 0f 1e fa          	endbr64 
    2077:	48 83 ec 08          	sub    $0x8,%rsp
    207b:	b8 00 00 00 00       	mov    $0x0,%eax
    2080:	e8 05 fe ff ff       	callq  1e8a <getbuf>
    2085:	89 c2                	mov    %eax,%edx
    2087:	48 8d 35 9a 23 00 00 	lea    0x239a(%rip),%rsi        # 4428 <_IO_stdin_used+0x428>
    208e:	bf 01 00 00 00       	mov    $0x1,%edi
    2093:	b8 00 00 00 00       	mov    $0x0,%eax
    2098:	e8 13 f3 ff ff       	callq  13b0 <__printf_chk@plt>
    209d:	48 83 c4 08          	add    $0x8,%rsp
    20a1:	c3                   	retq   

00000000000020a2 <start_farm>:
    20a2:	f3 0f 1e fa          	endbr64 
    20a6:	b8 01 00 00 00       	mov    $0x1,%eax
    20ab:	c3                   	retq   

00000000000020ac <setval_385>:
    20ac:	f3 0f 1e fa          	endbr64 
    20b0:	c7 07 58 90 c3 ab    	movl   $0xabc39058,(%rdi)
    20b6:	c3                   	retq   

00000000000020b7 <setval_352>:
    20b7:	f3 0f 1e fa          	endbr64 
    20bb:	c7 07 d9 53 58 94    	movl   $0x945853d9,(%rdi)
    20c1:	c3                   	retq   

00000000000020c2 <setval_363>:
    20c2:	f3 0f 1e fa          	endbr64 
    20c6:	c7 07 48 88 c7 90    	movl   $0x90c78848,(%rdi)
    20cc:	c3                   	retq   

00000000000020cd <setval_318>:
    20cd:	f3 0f 1e fa          	endbr64 
    20d1:	c7 07 58 90 90 90    	movl   $0x90909058,(%rdi)
    20d7:	c3                   	retq   

00000000000020d8 <addval_263>:
    20d8:	f3 0f 1e fa          	endbr64 
    20dc:	8d 87 5d 48 89 c7    	lea    -0x3876b7a3(%rdi),%eax
    20e2:	c3                   	retq   

00000000000020e3 <addval_190>:
    20e3:	f3 0f 1e fa          	endbr64 
    20e7:	8d 87 58 92 c3 3b    	lea    0x3bc39258(%rdi),%eax
    20ed:	c3                   	retq   

00000000000020ee <setval_277>:
    20ee:	f3 0f 1e fa          	endbr64 
    20f2:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
    20f8:	c3                   	retq   

00000000000020f9 <getval_247>:
    20f9:	f3 0f 1e fa          	endbr64 
    20fd:	b8 49 89 c7 c3       	mov    $0xc3c78949,%eax
    2102:	c3                   	retq   

0000000000002103 <mid_farm>:
    2103:	f3 0f 1e fa          	endbr64 
    2107:	b8 01 00 00 00       	mov    $0x1,%eax
    210c:	c3                   	retq   

000000000000210d <add_xy>:
    210d:	f3 0f 1e fa          	endbr64 
    2111:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
    2115:	c3                   	retq   

0000000000002116 <setval_310>:
    2116:	f3 0f 1e fa          	endbr64 
    211a:	c7 07 b2 68 89 e0    	movl   $0xe08968b2,(%rdi)
    2120:	c3                   	retq   

0000000000002121 <addval_307>:
    2121:	f3 0f 1e fa          	endbr64 
    2125:	8d 87 48 89 e0 c3    	lea    -0x3c1f76b8(%rdi),%eax
    212b:	c3                   	retq   

000000000000212c <getval_448>:
    212c:	f3 0f 1e fa          	endbr64 
    2130:	b8 48 89 e0 92       	mov    $0x92e08948,%eax
    2135:	c3                   	retq   

0000000000002136 <setval_159>:
    2136:	f3 0f 1e fa          	endbr64 
    213a:	c7 07 a6 58 c9 ca    	movl   $0xcac958a6,(%rdi)
    2140:	c3                   	retq   

0000000000002141 <setval_254>:
    2141:	f3 0f 1e fa          	endbr64 
    2145:	c7 07 58 89 e0 c3    	movl   $0xc3e08958,(%rdi)
    214b:	c3                   	retq   

000000000000214c <addval_463>:
    214c:	f3 0f 1e fa          	endbr64 
    2150:	8d 87 a9 d6 38 c9    	lea    -0x36c72957(%rdi),%eax
    2156:	c3                   	retq   

0000000000002157 <getval_388>:
    2157:	f3 0f 1e fa          	endbr64 
    215b:	b8 89 ca 38 db       	mov    $0xdb38ca89,%eax
    2160:	c3                   	retq   

0000000000002161 <addval_217>:
    2161:	f3 0f 1e fa          	endbr64 
    2165:	8d 87 48 89 e0 c3    	lea    -0x3c1f76b8(%rdi),%eax
    216b:	c3                   	retq   

000000000000216c <setval_285>:
    216c:	f3 0f 1e fa          	endbr64 
    2170:	c7 07 89 ca 60 d2    	movl   $0xd260ca89,(%rdi)
    2176:	c3                   	retq   

0000000000002177 <addval_373>:
    2177:	f3 0f 1e fa          	endbr64 
    217b:	8d 87 a9 d6 90 90    	lea    -0x6f6f2957(%rdi),%eax
    2181:	c3                   	retq   

0000000000002182 <getval_365>:
    2182:	f3 0f 1e fa          	endbr64 
    2186:	b8 89 d6 08 d2       	mov    $0xd208d689,%eax
    218b:	c3                   	retq   

000000000000218c <getval_209>:
    218c:	f3 0f 1e fa          	endbr64 
    2190:	b8 c9 d6 90 c3       	mov    $0xc390d6c9,%eax
    2195:	c3                   	retq   

0000000000002196 <addval_486>:
    2196:	f3 0f 1e fa          	endbr64 
    219a:	8d 87 a9 c1 20 d2    	lea    -0x2ddf3e57(%rdi),%eax
    21a0:	c3                   	retq   

00000000000021a1 <addval_204>:
    21a1:	f3 0f 1e fa          	endbr64 
    21a5:	8d 87 8e 89 c1 90    	lea    -0x6f3e7672(%rdi),%eax
    21ab:	c3                   	retq   

00000000000021ac <setval_478>:
    21ac:	f3 0f 1e fa          	endbr64 
    21b0:	c7 07 c9 c1 38 d2    	movl   $0xd238c1c9,(%rdi)
    21b6:	c3                   	retq   

00000000000021b7 <addval_264>:
    21b7:	f3 0f 1e fa          	endbr64 
    21bb:	8d 87 89 d6 90 90    	lea    -0x6f6f2977(%rdi),%eax
    21c1:	c3                   	retq   

00000000000021c2 <setval_237>:
    21c2:	f3 0f 1e fa          	endbr64 
    21c6:	c7 07 09 ca 90 90    	movl   $0x9090ca09,(%rdi)
    21cc:	c3                   	retq   

00000000000021cd <setval_441>:
    21cd:	f3 0f 1e fa          	endbr64 
    21d1:	c7 07 89 c1 18 d2    	movl   $0xd218c189,(%rdi)
    21d7:	c3                   	retq   

00000000000021d8 <setval_295>:
    21d8:	f3 0f 1e fa          	endbr64 
    21dc:	c7 07 89 c1 38 d2    	movl   $0xd238c189,(%rdi)
    21e2:	c3                   	retq   

00000000000021e3 <addval_135>:
    21e3:	f3 0f 1e fa          	endbr64 
    21e7:	8d 87 48 99 e0 c3    	lea    -0x3c1f66b8(%rdi),%eax
    21ed:	c3                   	retq   

00000000000021ee <addval_472>:
    21ee:	f3 0f 1e fa          	endbr64 
    21f2:	8d 87 88 ca c3 73    	lea    0x73c3ca88(%rdi),%eax
    21f8:	c3                   	retq   

00000000000021f9 <setval_466>:
    21f9:	f3 0f 1e fa          	endbr64 
    21fd:	c7 07 89 d6 a4 c0    	movl   $0xc0a4d689,(%rdi)
    2203:	c3                   	retq   

0000000000002204 <addval_262>:
    2204:	f3 0f 1e fa          	endbr64 
    2208:	8d 87 81 d6 84 c9    	lea    -0x367b297f(%rdi),%eax
    220e:	c3                   	retq   

000000000000220f <getval_183>:
    220f:	f3 0f 1e fa          	endbr64 
    2213:	b8 99 ca 38 d2       	mov    $0xd238ca99,%eax
    2218:	c3                   	retq   

0000000000002219 <getval_260>:
    2219:	f3 0f 1e fa          	endbr64 
    221d:	b8 49 89 e0 90       	mov    $0x90e08949,%eax
    2222:	c3                   	retq   

0000000000002223 <getval_405>:
    2223:	f3 0f 1e fa          	endbr64 
    2227:	b8 89 ca c3 45       	mov    $0x45c3ca89,%eax
    222c:	c3                   	retq   

000000000000222d <setval_474>:
    222d:	f3 0f 1e fa          	endbr64 
    2231:	c7 07 89 c1 18 c9    	movl   $0xc918c189,(%rdi)
    2237:	c3                   	retq   

0000000000002238 <addval_231>:
    2238:	f3 0f 1e fa          	endbr64 
    223c:	8d 87 8b c1 08 c9    	lea    -0x36f73e75(%rdi),%eax
    2242:	c3                   	retq   

0000000000002243 <setval_205>:
    2243:	f3 0f 1e fa          	endbr64 
    2247:	c7 07 89 ca 30 c9    	movl   $0xc930ca89,(%rdi)
    224d:	c3                   	retq   

000000000000224e <setval_414>:
    224e:	f3 0f 1e fa          	endbr64 
    2252:	c7 07 9a 89 d6 91    	movl   $0x91d6899a,(%rdi)
    2258:	c3                   	retq   

0000000000002259 <addval_218>:
    2259:	f3 0f 1e fa          	endbr64 
    225d:	8d 87 89 c1 60 c0    	lea    -0x3f9f3e77(%rdi),%eax
    2263:	c3                   	retq   

0000000000002264 <getval_175>:
    2264:	f3 0f 1e fa          	endbr64 
    2268:	b8 f5 49 89 e0       	mov    $0xe08949f5,%eax
    226d:	c3                   	retq   

000000000000226e <end_farm>:
    226e:	f3 0f 1e fa          	endbr64 
    2272:	b8 01 00 00 00       	mov    $0x1,%eax
    2277:	c3                   	retq   

0000000000002278 <save_char>:
    2278:	8b 05 86 5d 00 00    	mov    0x5d86(%rip),%eax        # 8004 <gets_cnt>
    227e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
    2283:	7f 4a                	jg     22cf <save_char+0x57>
    2285:	89 f9                	mov    %edi,%ecx
    2287:	c0 e9 04             	shr    $0x4,%cl
    228a:	8d 14 40             	lea    (%rax,%rax,2),%edx
    228d:	4c 8d 05 bc 24 00 00 	lea    0x24bc(%rip),%r8        # 4750 <trans_char>
    2294:	83 e1 0f             	and    $0xf,%ecx
    2297:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
    229c:	48 8d 0d 5d 51 00 00 	lea    0x515d(%rip),%rcx        # 7400 <gets_buf>
    22a3:	48 63 f2             	movslq %edx,%rsi
    22a6:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
    22aa:	8d 72 01             	lea    0x1(%rdx),%esi
    22ad:	83 e7 0f             	and    $0xf,%edi
    22b0:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
    22b5:	48 63 f6             	movslq %esi,%rsi
    22b8:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
    22bc:	83 c2 02             	add    $0x2,%edx
    22bf:	48 63 d2             	movslq %edx,%rdx
    22c2:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
    22c6:	83 c0 01             	add    $0x1,%eax
    22c9:	89 05 35 5d 00 00    	mov    %eax,0x5d35(%rip)        # 8004 <gets_cnt>
    22cf:	c3                   	retq   

00000000000022d0 <save_term>:
    22d0:	8b 05 2e 5d 00 00    	mov    0x5d2e(%rip),%eax        # 8004 <gets_cnt>
    22d6:	8d 04 40             	lea    (%rax,%rax,2),%eax
    22d9:	48 98                	cltq   
    22db:	48 8d 15 1e 51 00 00 	lea    0x511e(%rip),%rdx        # 7400 <gets_buf>
    22e2:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    22e6:	c3                   	retq   

00000000000022e7 <check_fail>:
    22e7:	f3 0f 1e fa          	endbr64 
    22eb:	50                   	push   %rax
    22ec:	58                   	pop    %rax
    22ed:	48 83 ec 08          	sub    $0x8,%rsp
    22f1:	0f be 15 10 5d 00 00 	movsbl 0x5d10(%rip),%edx        # 8008 <target_prefix>
    22f8:	4c 8d 05 01 51 00 00 	lea    0x5101(%rip),%r8        # 7400 <gets_buf>
    22ff:	8b 0d d3 50 00 00    	mov    0x50d3(%rip),%ecx        # 73d8 <check_level>
    2305:	48 8d 35 3f 21 00 00 	lea    0x213f(%rip),%rsi        # 444b <_IO_stdin_used+0x44b>
    230c:	bf 01 00 00 00       	mov    $0x1,%edi
    2311:	b8 00 00 00 00       	mov    $0x0,%eax
    2316:	e8 95 f0 ff ff       	callq  13b0 <__printf_chk@plt>
    231b:	bf 01 00 00 00       	mov    $0x1,%edi
    2320:	e8 db f0 ff ff       	callq  1400 <exit@plt>

0000000000002325 <Gets>:
    2325:	f3 0f 1e fa          	endbr64 
    2329:	41 54                	push   %r12
    232b:	55                   	push   %rbp
    232c:	53                   	push   %rbx
    232d:	49 89 fc             	mov    %rdi,%r12
    2330:	c7 05 ca 5c 00 00 00 	movl   $0x0,0x5cca(%rip)        # 8004 <gets_cnt>
    2337:	00 00 00 
    233a:	48 89 fb             	mov    %rdi,%rbx
    233d:	48 8b 3d 8c 50 00 00 	mov    0x508c(%rip),%rdi        # 73d0 <infile>
    2344:	e8 e7 f0 ff ff       	callq  1430 <getc@plt>
    2349:	83 f8 ff             	cmp    $0xffffffff,%eax
    234c:	74 18                	je     2366 <Gets+0x41>
    234e:	83 f8 0a             	cmp    $0xa,%eax
    2351:	74 13                	je     2366 <Gets+0x41>
    2353:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
    2357:	88 03                	mov    %al,(%rbx)
    2359:	0f b6 f8             	movzbl %al,%edi
    235c:	e8 17 ff ff ff       	callq  2278 <save_char>
    2361:	48 89 eb             	mov    %rbp,%rbx
    2364:	eb d7                	jmp    233d <Gets+0x18>
    2366:	c6 03 00             	movb   $0x0,(%rbx)
    2369:	b8 00 00 00 00       	mov    $0x0,%eax
    236e:	e8 5d ff ff ff       	callq  22d0 <save_term>
    2373:	4c 89 e0             	mov    %r12,%rax
    2376:	5b                   	pop    %rbx
    2377:	5d                   	pop    %rbp
    2378:	41 5c                	pop    %r12
    237a:	c3                   	retq   

000000000000237b <notify_server>:
    237b:	f3 0f 1e fa          	endbr64 
    237f:	55                   	push   %rbp
    2380:	53                   	push   %rbx
    2381:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    2388:	ff 
    2389:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2390:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    2395:	4c 39 dc             	cmp    %r11,%rsp
    2398:	75 ef                	jne    2389 <notify_server+0xe>
    239a:	48 83 ec 18          	sub    $0x18,%rsp
    239e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    23a5:	00 00 
    23a7:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    23ae:	00 
    23af:	31 c0                	xor    %eax,%eax
    23b1:	83 3d 30 50 00 00 00 	cmpl   $0x0,0x5030(%rip)        # 73e8 <is_checker>
    23b8:	0f 85 26 01 00 00    	jne    24e4 <notify_server+0x169>
    23be:	89 fb                	mov    %edi,%ebx
    23c0:	81 3d 3a 5c 00 00 9c 	cmpl   $0x1f9c,0x5c3a(%rip)        # 8004 <gets_cnt>
    23c7:	1f 00 00 
    23ca:	7f 18                	jg     23e4 <notify_server+0x69>
    23cc:	0f be 05 35 5c 00 00 	movsbl 0x5c35(%rip),%eax        # 8008 <target_prefix>
    23d3:	83 3d 8e 4f 00 00 00 	cmpl   $0x0,0x4f8e(%rip)        # 7368 <notify>
    23da:	74 23                	je     23ff <notify_server+0x84>
    23dc:	8b 15 fe 4f 00 00    	mov    0x4ffe(%rip),%edx        # 73e0 <authkey>
    23e2:	eb 20                	jmp    2404 <notify_server+0x89>
    23e4:	48 8d 35 95 21 00 00 	lea    0x2195(%rip),%rsi        # 4580 <_IO_stdin_used+0x580>
    23eb:	bf 01 00 00 00       	mov    $0x1,%edi
    23f0:	e8 bb ef ff ff       	callq  13b0 <__printf_chk@plt>
    23f5:	bf 01 00 00 00       	mov    $0x1,%edi
    23fa:	e8 01 f0 ff ff       	callq  1400 <exit@plt>
    23ff:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    2404:	85 db                	test   %ebx,%ebx
    2406:	0f 84 98 00 00 00    	je     24a4 <notify_server+0x129>
    240c:	48 8d 2d 53 20 00 00 	lea    0x2053(%rip),%rbp        # 4466 <_IO_stdin_used+0x466>
    2413:	48 89 e7             	mov    %rsp,%rdi
    2416:	48 8d 0d e3 4f 00 00 	lea    0x4fe3(%rip),%rcx        # 7400 <gets_buf>
    241d:	51                   	push   %rcx
    241e:	56                   	push   %rsi
    241f:	50                   	push   %rax
    2420:	52                   	push   %rdx
    2421:	49 89 e9             	mov    %rbp,%r9
    2424:	44 8b 05 e5 4b 00 00 	mov    0x4be5(%rip),%r8d        # 7010 <target_id>
    242b:	48 8d 0d 39 20 00 00 	lea    0x2039(%rip),%rcx        # 446b <_IO_stdin_used+0x46b>
    2432:	ba 00 20 00 00       	mov    $0x2000,%edx
    2437:	be 01 00 00 00       	mov    $0x1,%esi
    243c:	b8 00 00 00 00       	mov    $0x0,%eax
    2441:	e8 fa ef ff ff       	callq  1440 <__sprintf_chk@plt>
    2446:	48 83 c4 20          	add    $0x20,%rsp
    244a:	83 3d 17 4f 00 00 00 	cmpl   $0x0,0x4f17(%rip)        # 7368 <notify>
    2451:	0f 84 ae 00 00 00    	je     2505 <notify_server+0x18a>
    2457:	85 db                	test   %ebx,%ebx
    2459:	74 7d                	je     24d8 <notify_server+0x15d>
    245b:	48 89 e1             	mov    %rsp,%rcx
    245e:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
    2465:	00 
    2466:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    246c:	48 8b 15 b5 4b 00 00 	mov    0x4bb5(%rip),%rdx        # 7028 <lab>
    2473:	48 8b 35 b6 4b 00 00 	mov    0x4bb6(%rip),%rsi        # 7030 <course>
    247a:	48 8b 3d 9f 4b 00 00 	mov    0x4b9f(%rip),%rdi        # 7020 <user_id>
    2481:	e8 d9 11 00 00       	callq  365f <driver_post>
    2486:	85 c0                	test   %eax,%eax
    2488:	78 26                	js     24b0 <notify_server+0x135>
    248a:	48 8d 3d 1f 21 00 00 	lea    0x211f(%rip),%rdi        # 45b0 <_IO_stdin_used+0x5b0>
    2491:	e8 0a ee ff ff       	callq  12a0 <puts@plt>
    2496:	48 8d 3d f6 1f 00 00 	lea    0x1ff6(%rip),%rdi        # 4493 <_IO_stdin_used+0x493>
    249d:	e8 fe ed ff ff       	callq  12a0 <puts@plt>
    24a2:	eb 40                	jmp    24e4 <notify_server+0x169>
    24a4:	48 8d 2d b6 1f 00 00 	lea    0x1fb6(%rip),%rbp        # 4461 <_IO_stdin_used+0x461>
    24ab:	e9 63 ff ff ff       	jmpq   2413 <notify_server+0x98>
    24b0:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
    24b7:	00 
    24b8:	48 8d 35 c8 1f 00 00 	lea    0x1fc8(%rip),%rsi        # 4487 <_IO_stdin_used+0x487>
    24bf:	bf 01 00 00 00       	mov    $0x1,%edi
    24c4:	b8 00 00 00 00       	mov    $0x0,%eax
    24c9:	e8 e2 ee ff ff       	callq  13b0 <__printf_chk@plt>
    24ce:	bf 01 00 00 00       	mov    $0x1,%edi
    24d3:	e8 28 ef ff ff       	callq  1400 <exit@plt>
    24d8:	48 8d 3d be 1f 00 00 	lea    0x1fbe(%rip),%rdi        # 449d <_IO_stdin_used+0x49d>
    24df:	e8 bc ed ff ff       	callq  12a0 <puts@plt>
    24e4:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    24eb:	00 
    24ec:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    24f3:	00 00 
    24f5:	0f 85 98 00 00 00    	jne    2593 <notify_server+0x218>
    24fb:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
    2502:	5b                   	pop    %rbx
    2503:	5d                   	pop    %rbp
    2504:	c3                   	retq   
    2505:	48 89 ea             	mov    %rbp,%rdx
    2508:	48 8d 35 d9 20 00 00 	lea    0x20d9(%rip),%rsi        # 45e8 <_IO_stdin_used+0x5e8>
    250f:	bf 01 00 00 00       	mov    $0x1,%edi
    2514:	b8 00 00 00 00       	mov    $0x0,%eax
    2519:	e8 92 ee ff ff       	callq  13b0 <__printf_chk@plt>
    251e:	48 8b 15 fb 4a 00 00 	mov    0x4afb(%rip),%rdx        # 7020 <user_id>
    2525:	48 8d 35 78 1f 00 00 	lea    0x1f78(%rip),%rsi        # 44a4 <_IO_stdin_used+0x4a4>
    252c:	bf 01 00 00 00       	mov    $0x1,%edi
    2531:	b8 00 00 00 00       	mov    $0x0,%eax
    2536:	e8 75 ee ff ff       	callq  13b0 <__printf_chk@plt>
    253b:	48 8b 15 ee 4a 00 00 	mov    0x4aee(%rip),%rdx        # 7030 <course>
    2542:	48 8d 35 68 1f 00 00 	lea    0x1f68(%rip),%rsi        # 44b1 <_IO_stdin_used+0x4b1>
    2549:	bf 01 00 00 00       	mov    $0x1,%edi
    254e:	b8 00 00 00 00       	mov    $0x0,%eax
    2553:	e8 58 ee ff ff       	callq  13b0 <__printf_chk@plt>
    2558:	48 8b 15 c9 4a 00 00 	mov    0x4ac9(%rip),%rdx        # 7028 <lab>
    255f:	48 8d 35 57 1f 00 00 	lea    0x1f57(%rip),%rsi        # 44bd <_IO_stdin_used+0x4bd>
    2566:	bf 01 00 00 00       	mov    $0x1,%edi
    256b:	b8 00 00 00 00       	mov    $0x0,%eax
    2570:	e8 3b ee ff ff       	callq  13b0 <__printf_chk@plt>
    2575:	48 89 e2             	mov    %rsp,%rdx
    2578:	48 8d 35 47 1f 00 00 	lea    0x1f47(%rip),%rsi        # 44c6 <_IO_stdin_used+0x4c6>
    257f:	bf 01 00 00 00       	mov    $0x1,%edi
    2584:	b8 00 00 00 00       	mov    $0x0,%eax
    2589:	e8 22 ee ff ff       	callq  13b0 <__printf_chk@plt>
    258e:	e9 51 ff ff ff       	jmpq   24e4 <notify_server+0x169>
    2593:	e8 28 ed ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000002598 <validate>:
    2598:	f3 0f 1e fa          	endbr64 
    259c:	53                   	push   %rbx
    259d:	89 fb                	mov    %edi,%ebx
    259f:	83 3d 42 4e 00 00 00 	cmpl   $0x0,0x4e42(%rip)        # 73e8 <is_checker>
    25a6:	74 72                	je     261a <validate+0x82>
    25a8:	39 3d 2e 4e 00 00    	cmp    %edi,0x4e2e(%rip)        # 73dc <vlevel>
    25ae:	75 32                	jne    25e2 <validate+0x4a>
    25b0:	8b 15 22 4e 00 00    	mov    0x4e22(%rip),%edx        # 73d8 <check_level>
    25b6:	39 fa                	cmp    %edi,%edx
    25b8:	75 3e                	jne    25f8 <validate+0x60>
    25ba:	0f be 15 47 5a 00 00 	movsbl 0x5a47(%rip),%edx        # 8008 <target_prefix>
    25c1:	4c 8d 05 38 4e 00 00 	lea    0x4e38(%rip),%r8        # 7400 <gets_buf>
    25c8:	89 f9                	mov    %edi,%ecx
    25ca:	48 8d 35 1f 1f 00 00 	lea    0x1f1f(%rip),%rsi        # 44f0 <_IO_stdin_used+0x4f0>
    25d1:	bf 01 00 00 00       	mov    $0x1,%edi
    25d6:	b8 00 00 00 00       	mov    $0x0,%eax
    25db:	e8 d0 ed ff ff       	callq  13b0 <__printf_chk@plt>
    25e0:	5b                   	pop    %rbx
    25e1:	c3                   	retq   
    25e2:	48 8d 3d e9 1e 00 00 	lea    0x1ee9(%rip),%rdi        # 44d2 <_IO_stdin_used+0x4d2>
    25e9:	e8 b2 ec ff ff       	callq  12a0 <puts@plt>
    25ee:	b8 00 00 00 00       	mov    $0x0,%eax
    25f3:	e8 ef fc ff ff       	callq  22e7 <check_fail>
    25f8:	89 f9                	mov    %edi,%ecx
    25fa:	48 8d 35 0f 20 00 00 	lea    0x200f(%rip),%rsi        # 4610 <_IO_stdin_used+0x610>
    2601:	bf 01 00 00 00       	mov    $0x1,%edi
    2606:	b8 00 00 00 00       	mov    $0x0,%eax
    260b:	e8 a0 ed ff ff       	callq  13b0 <__printf_chk@plt>
    2610:	b8 00 00 00 00       	mov    $0x0,%eax
    2615:	e8 cd fc ff ff       	callq  22e7 <check_fail>
    261a:	39 3d bc 4d 00 00    	cmp    %edi,0x4dbc(%rip)        # 73dc <vlevel>
    2620:	74 1a                	je     263c <validate+0xa4>
    2622:	48 8d 3d a9 1e 00 00 	lea    0x1ea9(%rip),%rdi        # 44d2 <_IO_stdin_used+0x4d2>
    2629:	e8 72 ec ff ff       	callq  12a0 <puts@plt>
    262e:	89 de                	mov    %ebx,%esi
    2630:	bf 00 00 00 00       	mov    $0x0,%edi
    2635:	e8 41 fd ff ff       	callq  237b <notify_server>
    263a:	eb a4                	jmp    25e0 <validate+0x48>
    263c:	0f be 0d c5 59 00 00 	movsbl 0x59c5(%rip),%ecx        # 8008 <target_prefix>
    2643:	89 fa                	mov    %edi,%edx
    2645:	48 8d 35 ec 1f 00 00 	lea    0x1fec(%rip),%rsi        # 4638 <_IO_stdin_used+0x638>
    264c:	bf 01 00 00 00       	mov    $0x1,%edi
    2651:	b8 00 00 00 00       	mov    $0x0,%eax
    2656:	e8 55 ed ff ff       	callq  13b0 <__printf_chk@plt>
    265b:	89 de                	mov    %ebx,%esi
    265d:	bf 01 00 00 00       	mov    $0x1,%edi
    2662:	e8 14 fd ff ff       	callq  237b <notify_server>
    2667:	e9 74 ff ff ff       	jmpq   25e0 <validate+0x48>

000000000000266c <fail>:
    266c:	f3 0f 1e fa          	endbr64 
    2670:	48 83 ec 08          	sub    $0x8,%rsp
    2674:	83 3d 6d 4d 00 00 00 	cmpl   $0x0,0x4d6d(%rip)        # 73e8 <is_checker>
    267b:	75 11                	jne    268e <fail+0x22>
    267d:	89 fe                	mov    %edi,%esi
    267f:	bf 00 00 00 00       	mov    $0x0,%edi
    2684:	e8 f2 fc ff ff       	callq  237b <notify_server>
    2689:	48 83 c4 08          	add    $0x8,%rsp
    268d:	c3                   	retq   
    268e:	b8 00 00 00 00       	mov    $0x0,%eax
    2693:	e8 4f fc ff ff       	callq  22e7 <check_fail>

0000000000002698 <bushandler>:
    2698:	f3 0f 1e fa          	endbr64 
    269c:	50                   	push   %rax
    269d:	58                   	pop    %rax
    269e:	48 83 ec 08          	sub    $0x8,%rsp
    26a2:	83 3d 3f 4d 00 00 00 	cmpl   $0x0,0x4d3f(%rip)        # 73e8 <is_checker>
    26a9:	74 16                	je     26c1 <bushandler+0x29>
    26ab:	48 8d 3d 53 1e 00 00 	lea    0x1e53(%rip),%rdi        # 4505 <_IO_stdin_used+0x505>
    26b2:	e8 e9 eb ff ff       	callq  12a0 <puts@plt>
    26b7:	b8 00 00 00 00       	mov    $0x0,%eax
    26bc:	e8 26 fc ff ff       	callq  22e7 <check_fail>
    26c1:	48 8d 3d a8 1f 00 00 	lea    0x1fa8(%rip),%rdi        # 4670 <_IO_stdin_used+0x670>
    26c8:	e8 d3 eb ff ff       	callq  12a0 <puts@plt>
    26cd:	48 8d 3d 3b 1e 00 00 	lea    0x1e3b(%rip),%rdi        # 450f <_IO_stdin_used+0x50f>
    26d4:	e8 c7 eb ff ff       	callq  12a0 <puts@plt>
    26d9:	be 00 00 00 00       	mov    $0x0,%esi
    26de:	bf 00 00 00 00       	mov    $0x0,%edi
    26e3:	e8 93 fc ff ff       	callq  237b <notify_server>
    26e8:	bf 01 00 00 00       	mov    $0x1,%edi
    26ed:	e8 0e ed ff ff       	callq  1400 <exit@plt>

00000000000026f2 <seghandler>:
    26f2:	f3 0f 1e fa          	endbr64 
    26f6:	50                   	push   %rax
    26f7:	58                   	pop    %rax
    26f8:	48 83 ec 08          	sub    $0x8,%rsp
    26fc:	83 3d e5 4c 00 00 00 	cmpl   $0x0,0x4ce5(%rip)        # 73e8 <is_checker>
    2703:	74 16                	je     271b <seghandler+0x29>
    2705:	48 8d 3d 19 1e 00 00 	lea    0x1e19(%rip),%rdi        # 4525 <_IO_stdin_used+0x525>
    270c:	e8 8f eb ff ff       	callq  12a0 <puts@plt>
    2711:	b8 00 00 00 00       	mov    $0x0,%eax
    2716:	e8 cc fb ff ff       	callq  22e7 <check_fail>
    271b:	48 8d 3d 6e 1f 00 00 	lea    0x1f6e(%rip),%rdi        # 4690 <_IO_stdin_used+0x690>
    2722:	e8 79 eb ff ff       	callq  12a0 <puts@plt>
    2727:	48 8d 3d e1 1d 00 00 	lea    0x1de1(%rip),%rdi        # 450f <_IO_stdin_used+0x50f>
    272e:	e8 6d eb ff ff       	callq  12a0 <puts@plt>
    2733:	be 00 00 00 00       	mov    $0x0,%esi
    2738:	bf 00 00 00 00       	mov    $0x0,%edi
    273d:	e8 39 fc ff ff       	callq  237b <notify_server>
    2742:	bf 01 00 00 00       	mov    $0x1,%edi
    2747:	e8 b4 ec ff ff       	callq  1400 <exit@plt>

000000000000274c <illegalhandler>:
    274c:	f3 0f 1e fa          	endbr64 
    2750:	50                   	push   %rax
    2751:	58                   	pop    %rax
    2752:	48 83 ec 08          	sub    $0x8,%rsp
    2756:	83 3d 8b 4c 00 00 00 	cmpl   $0x0,0x4c8b(%rip)        # 73e8 <is_checker>
    275d:	74 16                	je     2775 <illegalhandler+0x29>
    275f:	48 8d 3d d2 1d 00 00 	lea    0x1dd2(%rip),%rdi        # 4538 <_IO_stdin_used+0x538>
    2766:	e8 35 eb ff ff       	callq  12a0 <puts@plt>
    276b:	b8 00 00 00 00       	mov    $0x0,%eax
    2770:	e8 72 fb ff ff       	callq  22e7 <check_fail>
    2775:	48 8d 3d 3c 1f 00 00 	lea    0x1f3c(%rip),%rdi        # 46b8 <_IO_stdin_used+0x6b8>
    277c:	e8 1f eb ff ff       	callq  12a0 <puts@plt>
    2781:	48 8d 3d 87 1d 00 00 	lea    0x1d87(%rip),%rdi        # 450f <_IO_stdin_used+0x50f>
    2788:	e8 13 eb ff ff       	callq  12a0 <puts@plt>
    278d:	be 00 00 00 00       	mov    $0x0,%esi
    2792:	bf 00 00 00 00       	mov    $0x0,%edi
    2797:	e8 df fb ff ff       	callq  237b <notify_server>
    279c:	bf 01 00 00 00       	mov    $0x1,%edi
    27a1:	e8 5a ec ff ff       	callq  1400 <exit@plt>

00000000000027a6 <sigalrmhandler>:
    27a6:	f3 0f 1e fa          	endbr64 
    27aa:	50                   	push   %rax
    27ab:	58                   	pop    %rax
    27ac:	48 83 ec 08          	sub    $0x8,%rsp
    27b0:	83 3d 31 4c 00 00 00 	cmpl   $0x0,0x4c31(%rip)        # 73e8 <is_checker>
    27b7:	74 16                	je     27cf <sigalrmhandler+0x29>
    27b9:	48 8d 3d 8c 1d 00 00 	lea    0x1d8c(%rip),%rdi        # 454c <_IO_stdin_used+0x54c>
    27c0:	e8 db ea ff ff       	callq  12a0 <puts@plt>
    27c5:	b8 00 00 00 00       	mov    $0x0,%eax
    27ca:	e8 18 fb ff ff       	callq  22e7 <check_fail>
    27cf:	ba 05 00 00 00       	mov    $0x5,%edx
    27d4:	48 8d 35 0d 1f 00 00 	lea    0x1f0d(%rip),%rsi        # 46e8 <_IO_stdin_used+0x6e8>
    27db:	bf 01 00 00 00       	mov    $0x1,%edi
    27e0:	b8 00 00 00 00       	mov    $0x0,%eax
    27e5:	e8 c6 eb ff ff       	callq  13b0 <__printf_chk@plt>
    27ea:	be 00 00 00 00       	mov    $0x0,%esi
    27ef:	bf 00 00 00 00       	mov    $0x0,%edi
    27f4:	e8 82 fb ff ff       	callq  237b <notify_server>
    27f9:	bf 01 00 00 00       	mov    $0x1,%edi
    27fe:	e8 fd eb ff ff       	callq  1400 <exit@plt>

0000000000002803 <launch>:
    2803:	f3 0f 1e fa          	endbr64 
    2807:	55                   	push   %rbp
    2808:	48 89 e5             	mov    %rsp,%rbp
    280b:	48 83 ec 10          	sub    $0x10,%rsp
    280f:	48 89 fa             	mov    %rdi,%rdx
    2812:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2819:	00 00 
    281b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    281f:	31 c0                	xor    %eax,%eax
    2821:	48 8d 47 17          	lea    0x17(%rdi),%rax
    2825:	48 89 c1             	mov    %rax,%rcx
    2828:	48 83 e1 f0          	and    $0xfffffffffffffff0,%rcx
    282c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    2832:	48 89 e6             	mov    %rsp,%rsi
    2835:	48 29 c6             	sub    %rax,%rsi
    2838:	48 89 f0             	mov    %rsi,%rax
    283b:	48 39 c4             	cmp    %rax,%rsp
    283e:	74 12                	je     2852 <launch+0x4f>
    2840:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2847:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
    284e:	00 00 
    2850:	eb e9                	jmp    283b <launch+0x38>
    2852:	48 89 c8             	mov    %rcx,%rax
    2855:	25 ff 0f 00 00       	and    $0xfff,%eax
    285a:	48 29 c4             	sub    %rax,%rsp
    285d:	48 85 c0             	test   %rax,%rax
    2860:	74 06                	je     2868 <launch+0x65>
    2862:	48 83 4c 04 f8 00    	orq    $0x0,-0x8(%rsp,%rax,1)
    2868:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
    286d:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
    2871:	be f4 00 00 00       	mov    $0xf4,%esi
    2876:	e8 65 ea ff ff       	callq  12e0 <memset@plt>
    287b:	48 8b 05 fe 4a 00 00 	mov    0x4afe(%rip),%rax        # 7380 <stdin@@GLIBC_2.2.5>
    2882:	48 39 05 47 4b 00 00 	cmp    %rax,0x4b47(%rip)        # 73d0 <infile>
    2889:	74 3a                	je     28c5 <launch+0xc2>
    288b:	c7 05 47 4b 00 00 00 	movl   $0x0,0x4b47(%rip)        # 73dc <vlevel>
    2892:	00 00 00 
    2895:	b8 00 00 00 00       	mov    $0x0,%eax
    289a:	e8 d4 f7 ff ff       	callq  2073 <test>
    289f:	83 3d 42 4b 00 00 00 	cmpl   $0x0,0x4b42(%rip)        # 73e8 <is_checker>
    28a6:	75 35                	jne    28dd <launch+0xda>
    28a8:	48 8d 3d bd 1c 00 00 	lea    0x1cbd(%rip),%rdi        # 456c <_IO_stdin_used+0x56c>
    28af:	e8 ec e9 ff ff       	callq  12a0 <puts@plt>
    28b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    28b8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    28bf:	00 00 
    28c1:	75 30                	jne    28f3 <launch+0xf0>
    28c3:	c9                   	leaveq 
    28c4:	c3                   	retq   
    28c5:	48 8d 35 88 1c 00 00 	lea    0x1c88(%rip),%rsi        # 4554 <_IO_stdin_used+0x554>
    28cc:	bf 01 00 00 00       	mov    $0x1,%edi
    28d1:	b8 00 00 00 00       	mov    $0x0,%eax
    28d6:	e8 d5 ea ff ff       	callq  13b0 <__printf_chk@plt>
    28db:	eb ae                	jmp    288b <launch+0x88>
    28dd:	48 8d 3d 7d 1c 00 00 	lea    0x1c7d(%rip),%rdi        # 4561 <_IO_stdin_used+0x561>
    28e4:	e8 b7 e9 ff ff       	callq  12a0 <puts@plt>
    28e9:	b8 00 00 00 00       	mov    $0x0,%eax
    28ee:	e8 f4 f9 ff ff       	callq  22e7 <check_fail>
    28f3:	e8 c8 e9 ff ff       	callq  12c0 <__stack_chk_fail@plt>

00000000000028f8 <stable_launch>:
    28f8:	f3 0f 1e fa          	endbr64 
    28fc:	53                   	push   %rbx
    28fd:	48 89 3d c4 4a 00 00 	mov    %rdi,0x4ac4(%rip)        # 73c8 <global_offset>
    2904:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    290a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    2910:	b9 32 01 00 00       	mov    $0x132,%ecx
    2915:	ba 07 00 00 00       	mov    $0x7,%edx
    291a:	be 00 00 10 00       	mov    $0x100000,%esi
    291f:	bf 00 60 58 55       	mov    $0x55586000,%edi
    2924:	e8 a7 e9 ff ff       	callq  12d0 <mmap@plt>
    2929:	48 89 c3             	mov    %rax,%rbx
    292c:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
    2932:	75 43                	jne    2977 <stable_launch+0x7f>
    2934:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
    293b:	48 89 15 ce 56 00 00 	mov    %rdx,0x56ce(%rip)        # 8010 <stack_top>
    2942:	48 89 e0             	mov    %rsp,%rax
    2945:	48 89 d4             	mov    %rdx,%rsp
    2948:	48 89 c2             	mov    %rax,%rdx
    294b:	48 89 15 6e 4a 00 00 	mov    %rdx,0x4a6e(%rip)        # 73c0 <global_save_stack>
    2952:	48 8b 3d 6f 4a 00 00 	mov    0x4a6f(%rip),%rdi        # 73c8 <global_offset>
    2959:	e8 a5 fe ff ff       	callq  2803 <launch>
    295e:	48 8b 05 5b 4a 00 00 	mov    0x4a5b(%rip),%rax        # 73c0 <global_save_stack>
    2965:	48 89 c4             	mov    %rax,%rsp
    2968:	be 00 00 10 00       	mov    $0x100000,%esi
    296d:	48 89 df             	mov    %rbx,%rdi
    2970:	e8 2b ea ff ff       	callq  13a0 <munmap@plt>
    2975:	5b                   	pop    %rbx
    2976:	c3                   	retq   
    2977:	be 00 00 10 00       	mov    $0x100000,%esi
    297c:	48 89 c7             	mov    %rax,%rdi
    297f:	e8 1c ea ff ff       	callq  13a0 <munmap@plt>
    2984:	b9 00 60 58 55       	mov    $0x55586000,%ecx
    2989:	48 8d 15 90 1d 00 00 	lea    0x1d90(%rip),%rdx        # 4720 <_IO_stdin_used+0x720>
    2990:	be 01 00 00 00       	mov    $0x1,%esi
    2995:	48 8b 3d 04 4a 00 00 	mov    0x4a04(%rip),%rdi        # 73a0 <stderr@@GLIBC_2.2.5>
    299c:	b8 00 00 00 00       	mov    $0x0,%eax
    29a1:	e8 7a ea ff ff       	callq  1420 <__fprintf_chk@plt>
    29a6:	bf 01 00 00 00       	mov    $0x1,%edi
    29ab:	e8 50 ea ff ff       	callq  1400 <exit@plt>

00000000000029b0 <rio_readinitb>:
    29b0:	89 37                	mov    %esi,(%rdi)
    29b2:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
    29b9:	48 8d 47 10          	lea    0x10(%rdi),%rax
    29bd:	48 89 47 08          	mov    %rax,0x8(%rdi)
    29c1:	c3                   	retq   

00000000000029c2 <sigalrm_handler>:
    29c2:	f3 0f 1e fa          	endbr64 
    29c6:	50                   	push   %rax
    29c7:	58                   	pop    %rax
    29c8:	48 83 ec 08          	sub    $0x8,%rsp
    29cc:	b9 00 00 00 00       	mov    $0x0,%ecx
    29d1:	48 8d 15 88 1d 00 00 	lea    0x1d88(%rip),%rdx        # 4760 <trans_char+0x10>
    29d8:	be 01 00 00 00       	mov    $0x1,%esi
    29dd:	48 8b 3d bc 49 00 00 	mov    0x49bc(%rip),%rdi        # 73a0 <stderr@@GLIBC_2.2.5>
    29e4:	b8 00 00 00 00       	mov    $0x0,%eax
    29e9:	e8 32 ea ff ff       	callq  1420 <__fprintf_chk@plt>
    29ee:	bf 01 00 00 00       	mov    $0x1,%edi
    29f3:	e8 08 ea ff ff       	callq  1400 <exit@plt>

00000000000029f8 <rio_writen>:
    29f8:	41 55                	push   %r13
    29fa:	41 54                	push   %r12
    29fc:	55                   	push   %rbp
    29fd:	53                   	push   %rbx
    29fe:	48 83 ec 08          	sub    $0x8,%rsp
    2a02:	41 89 fc             	mov    %edi,%r12d
    2a05:	48 89 f5             	mov    %rsi,%rbp
    2a08:	49 89 d5             	mov    %rdx,%r13
    2a0b:	48 89 d3             	mov    %rdx,%rbx
    2a0e:	eb 06                	jmp    2a16 <rio_writen+0x1e>
    2a10:	48 29 c3             	sub    %rax,%rbx
    2a13:	48 01 c5             	add    %rax,%rbp
    2a16:	48 85 db             	test   %rbx,%rbx
    2a19:	74 24                	je     2a3f <rio_writen+0x47>
    2a1b:	48 89 da             	mov    %rbx,%rdx
    2a1e:	48 89 ee             	mov    %rbp,%rsi
    2a21:	44 89 e7             	mov    %r12d,%edi
    2a24:	e8 87 e8 ff ff       	callq  12b0 <write@plt>
    2a29:	48 85 c0             	test   %rax,%rax
    2a2c:	7f e2                	jg     2a10 <rio_writen+0x18>
    2a2e:	e8 2d e8 ff ff       	callq  1260 <__errno_location@plt>
    2a33:	83 38 04             	cmpl   $0x4,(%rax)
    2a36:	75 15                	jne    2a4d <rio_writen+0x55>
    2a38:	b8 00 00 00 00       	mov    $0x0,%eax
    2a3d:	eb d1                	jmp    2a10 <rio_writen+0x18>
    2a3f:	4c 89 e8             	mov    %r13,%rax
    2a42:	48 83 c4 08          	add    $0x8,%rsp
    2a46:	5b                   	pop    %rbx
    2a47:	5d                   	pop    %rbp
    2a48:	41 5c                	pop    %r12
    2a4a:	41 5d                	pop    %r13
    2a4c:	c3                   	retq   
    2a4d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2a54:	eb ec                	jmp    2a42 <rio_writen+0x4a>

0000000000002a56 <rio_read>:
    2a56:	41 55                	push   %r13
    2a58:	41 54                	push   %r12
    2a5a:	55                   	push   %rbp
    2a5b:	53                   	push   %rbx
    2a5c:	48 83 ec 08          	sub    $0x8,%rsp
    2a60:	48 89 fb             	mov    %rdi,%rbx
    2a63:	49 89 f5             	mov    %rsi,%r13
    2a66:	49 89 d4             	mov    %rdx,%r12
    2a69:	eb 17                	jmp    2a82 <rio_read+0x2c>
    2a6b:	e8 f0 e7 ff ff       	callq  1260 <__errno_location@plt>
    2a70:	83 38 04             	cmpl   $0x4,(%rax)
    2a73:	74 0d                	je     2a82 <rio_read+0x2c>
    2a75:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2a7c:	eb 54                	jmp    2ad2 <rio_read+0x7c>
    2a7e:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    2a82:	8b 6b 04             	mov    0x4(%rbx),%ebp
    2a85:	85 ed                	test   %ebp,%ebp
    2a87:	7f 23                	jg     2aac <rio_read+0x56>
    2a89:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
    2a8d:	8b 3b                	mov    (%rbx),%edi
    2a8f:	ba 00 20 00 00       	mov    $0x2000,%edx
    2a94:	48 89 ee             	mov    %rbp,%rsi
    2a97:	e8 74 e8 ff ff       	callq  1310 <read@plt>
    2a9c:	89 43 04             	mov    %eax,0x4(%rbx)
    2a9f:	85 c0                	test   %eax,%eax
    2aa1:	78 c8                	js     2a6b <rio_read+0x15>
    2aa3:	75 d9                	jne    2a7e <rio_read+0x28>
    2aa5:	b8 00 00 00 00       	mov    $0x0,%eax
    2aaa:	eb 26                	jmp    2ad2 <rio_read+0x7c>
    2aac:	89 e8                	mov    %ebp,%eax
    2aae:	4c 39 e0             	cmp    %r12,%rax
    2ab1:	72 03                	jb     2ab6 <rio_read+0x60>
    2ab3:	44 89 e5             	mov    %r12d,%ebp
    2ab6:	4c 63 e5             	movslq %ebp,%r12
    2ab9:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    2abd:	4c 89 e2             	mov    %r12,%rdx
    2ac0:	4c 89 ef             	mov    %r13,%rdi
    2ac3:	e8 98 e8 ff ff       	callq  1360 <memcpy@plt>
    2ac8:	4c 01 63 08          	add    %r12,0x8(%rbx)
    2acc:	29 6b 04             	sub    %ebp,0x4(%rbx)
    2acf:	4c 89 e0             	mov    %r12,%rax
    2ad2:	48 83 c4 08          	add    $0x8,%rsp
    2ad6:	5b                   	pop    %rbx
    2ad7:	5d                   	pop    %rbp
    2ad8:	41 5c                	pop    %r12
    2ada:	41 5d                	pop    %r13
    2adc:	c3                   	retq   

0000000000002add <rio_readlineb>:
    2add:	41 55                	push   %r13
    2adf:	41 54                	push   %r12
    2ae1:	55                   	push   %rbp
    2ae2:	53                   	push   %rbx
    2ae3:	48 83 ec 18          	sub    $0x18,%rsp
    2ae7:	49 89 fd             	mov    %rdi,%r13
    2aea:	48 89 f5             	mov    %rsi,%rbp
    2aed:	49 89 d4             	mov    %rdx,%r12
    2af0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2af7:	00 00 
    2af9:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    2afe:	31 c0                	xor    %eax,%eax
    2b00:	bb 01 00 00 00       	mov    $0x1,%ebx
    2b05:	eb 18                	jmp    2b1f <rio_readlineb+0x42>
    2b07:	85 c0                	test   %eax,%eax
    2b09:	75 65                	jne    2b70 <rio_readlineb+0x93>
    2b0b:	48 83 fb 01          	cmp    $0x1,%rbx
    2b0f:	75 3d                	jne    2b4e <rio_readlineb+0x71>
    2b11:	b8 00 00 00 00       	mov    $0x0,%eax
    2b16:	eb 3d                	jmp    2b55 <rio_readlineb+0x78>
    2b18:	48 83 c3 01          	add    $0x1,%rbx
    2b1c:	48 89 d5             	mov    %rdx,%rbp
    2b1f:	4c 39 e3             	cmp    %r12,%rbx
    2b22:	73 2a                	jae    2b4e <rio_readlineb+0x71>
    2b24:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
    2b29:	ba 01 00 00 00       	mov    $0x1,%edx
    2b2e:	4c 89 ef             	mov    %r13,%rdi
    2b31:	e8 20 ff ff ff       	callq  2a56 <rio_read>
    2b36:	83 f8 01             	cmp    $0x1,%eax
    2b39:	75 cc                	jne    2b07 <rio_readlineb+0x2a>
    2b3b:	48 8d 55 01          	lea    0x1(%rbp),%rdx
    2b3f:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
    2b44:	88 45 00             	mov    %al,0x0(%rbp)
    2b47:	3c 0a                	cmp    $0xa,%al
    2b49:	75 cd                	jne    2b18 <rio_readlineb+0x3b>
    2b4b:	48 89 d5             	mov    %rdx,%rbp
    2b4e:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
    2b52:	48 89 d8             	mov    %rbx,%rax
    2b55:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    2b5a:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2b61:	00 00 
    2b63:	75 14                	jne    2b79 <rio_readlineb+0x9c>
    2b65:	48 83 c4 18          	add    $0x18,%rsp
    2b69:	5b                   	pop    %rbx
    2b6a:	5d                   	pop    %rbp
    2b6b:	41 5c                	pop    %r12
    2b6d:	41 5d                	pop    %r13
    2b6f:	c3                   	retq   
    2b70:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2b77:	eb dc                	jmp    2b55 <rio_readlineb+0x78>
    2b79:	e8 42 e7 ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000002b7e <urlencode>:
    2b7e:	41 54                	push   %r12
    2b80:	55                   	push   %rbp
    2b81:	53                   	push   %rbx
    2b82:	48 83 ec 10          	sub    $0x10,%rsp
    2b86:	48 89 fb             	mov    %rdi,%rbx
    2b89:	48 89 f5             	mov    %rsi,%rbp
    2b8c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2b93:	00 00 
    2b95:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    2b9a:	31 c0                	xor    %eax,%eax
    2b9c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2ba3:	f2 ae                	repnz scas %es:(%rdi),%al
    2ba5:	48 f7 d1             	not    %rcx
    2ba8:	8d 41 ff             	lea    -0x1(%rcx),%eax
    2bab:	eb 0f                	jmp    2bbc <urlencode+0x3e>
    2bad:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    2bb1:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2bb5:	48 83 c3 01          	add    $0x1,%rbx
    2bb9:	44 89 e0             	mov    %r12d,%eax
    2bbc:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
    2bc0:	85 c0                	test   %eax,%eax
    2bc2:	0f 84 a8 00 00 00    	je     2c70 <urlencode+0xf2>
    2bc8:	44 0f b6 03          	movzbl (%rbx),%r8d
    2bcc:	41 80 f8 2a          	cmp    $0x2a,%r8b
    2bd0:	0f 94 c2             	sete   %dl
    2bd3:	41 80 f8 2d          	cmp    $0x2d,%r8b
    2bd7:	0f 94 c0             	sete   %al
    2bda:	08 c2                	or     %al,%dl
    2bdc:	75 cf                	jne    2bad <urlencode+0x2f>
    2bde:	41 80 f8 2e          	cmp    $0x2e,%r8b
    2be2:	74 c9                	je     2bad <urlencode+0x2f>
    2be4:	41 80 f8 5f          	cmp    $0x5f,%r8b
    2be8:	74 c3                	je     2bad <urlencode+0x2f>
    2bea:	41 8d 40 d0          	lea    -0x30(%r8),%eax
    2bee:	3c 09                	cmp    $0x9,%al
    2bf0:	76 bb                	jbe    2bad <urlencode+0x2f>
    2bf2:	41 8d 40 bf          	lea    -0x41(%r8),%eax
    2bf6:	3c 19                	cmp    $0x19,%al
    2bf8:	76 b3                	jbe    2bad <urlencode+0x2f>
    2bfa:	41 8d 40 9f          	lea    -0x61(%r8),%eax
    2bfe:	3c 19                	cmp    $0x19,%al
    2c00:	76 ab                	jbe    2bad <urlencode+0x2f>
    2c02:	41 80 f8 20          	cmp    $0x20,%r8b
    2c06:	74 56                	je     2c5e <urlencode+0xe0>
    2c08:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    2c0c:	3c 5f                	cmp    $0x5f,%al
    2c0e:	0f 96 c2             	setbe  %dl
    2c11:	41 80 f8 09          	cmp    $0x9,%r8b
    2c15:	0f 94 c0             	sete   %al
    2c18:	08 c2                	or     %al,%dl
    2c1a:	74 4f                	je     2c6b <urlencode+0xed>
    2c1c:	48 89 e7             	mov    %rsp,%rdi
    2c1f:	45 0f b6 c0          	movzbl %r8b,%r8d
    2c23:	48 8d 0d cb 1b 00 00 	lea    0x1bcb(%rip),%rcx        # 47f5 <trans_char+0xa5>
    2c2a:	ba 08 00 00 00       	mov    $0x8,%edx
    2c2f:	be 01 00 00 00       	mov    $0x1,%esi
    2c34:	b8 00 00 00 00       	mov    $0x0,%eax
    2c39:	e8 02 e8 ff ff       	callq  1440 <__sprintf_chk@plt>
    2c3e:	0f b6 04 24          	movzbl (%rsp),%eax
    2c42:	88 45 00             	mov    %al,0x0(%rbp)
    2c45:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    2c4a:	88 45 01             	mov    %al,0x1(%rbp)
    2c4d:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
    2c52:	88 45 02             	mov    %al,0x2(%rbp)
    2c55:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    2c59:	e9 57 ff ff ff       	jmpq   2bb5 <urlencode+0x37>
    2c5e:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    2c62:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2c66:	e9 4a ff ff ff       	jmpq   2bb5 <urlencode+0x37>
    2c6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2c70:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    2c75:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    2c7c:	00 00 
    2c7e:	75 09                	jne    2c89 <urlencode+0x10b>
    2c80:	48 83 c4 10          	add    $0x10,%rsp
    2c84:	5b                   	pop    %rbx
    2c85:	5d                   	pop    %rbp
    2c86:	41 5c                	pop    %r12
    2c88:	c3                   	retq   
    2c89:	e8 32 e6 ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000002c8e <submitr>:
    2c8e:	f3 0f 1e fa          	endbr64 
    2c92:	41 57                	push   %r15
    2c94:	41 56                	push   %r14
    2c96:	41 55                	push   %r13
    2c98:	41 54                	push   %r12
    2c9a:	55                   	push   %rbp
    2c9b:	53                   	push   %rbx
    2c9c:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    2ca3:	ff 
    2ca4:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2cab:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    2cb0:	4c 39 dc             	cmp    %r11,%rsp
    2cb3:	75 ef                	jne    2ca4 <submitr+0x16>
    2cb5:	48 83 ec 68          	sub    $0x68,%rsp
    2cb9:	49 89 fc             	mov    %rdi,%r12
    2cbc:	89 74 24 14          	mov    %esi,0x14(%rsp)
    2cc0:	49 89 d6             	mov    %rdx,%r14
    2cc3:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    2cc8:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    2ccd:	4d 89 cd             	mov    %r9,%r13
    2cd0:	48 8b ac 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbp
    2cd7:	00 
    2cd8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2cdf:	00 00 
    2ce1:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    2ce8:	00 
    2ce9:	31 c0                	xor    %eax,%eax
    2ceb:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    2cf2:	00 
    2cf3:	ba 00 00 00 00       	mov    $0x0,%edx
    2cf8:	be 01 00 00 00       	mov    $0x1,%esi
    2cfd:	bf 02 00 00 00       	mov    $0x2,%edi
    2d02:	e8 49 e7 ff ff       	callq  1450 <socket@plt>
    2d07:	85 c0                	test   %eax,%eax
    2d09:	0f 88 a0 02 00 00    	js     2faf <submitr+0x321>
    2d0f:	89 c3                	mov    %eax,%ebx
    2d11:	4c 89 e7             	mov    %r12,%rdi
    2d14:	e8 17 e6 ff ff       	callq  1330 <gethostbyname@plt>
    2d19:	48 85 c0             	test   %rax,%rax
    2d1c:	0f 84 d9 02 00 00    	je     2ffb <submitr+0x36d>
    2d22:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
    2d27:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    2d2e:	00 00 
    2d30:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    2d37:	00 00 
    2d39:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    2d40:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2d44:	48 8b 40 18          	mov    0x18(%rax),%rax
    2d48:	48 8b 30             	mov    (%rax),%rsi
    2d4b:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    2d50:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2d55:	e8 e6 e5 ff ff       	callq  1340 <__memmove_chk@plt>
    2d5a:	0f b7 74 24 14       	movzwl 0x14(%rsp),%esi
    2d5f:	66 c1 c6 08          	rol    $0x8,%si
    2d63:	66 89 74 24 32       	mov    %si,0x32(%rsp)
    2d68:	ba 10 00 00 00       	mov    $0x10,%edx
    2d6d:	4c 89 fe             	mov    %r15,%rsi
    2d70:	89 df                	mov    %ebx,%edi
    2d72:	e8 99 e6 ff ff       	callq  1410 <connect@plt>
    2d77:	85 c0                	test   %eax,%eax
    2d79:	0f 88 e4 02 00 00    	js     3063 <submitr+0x3d5>
    2d7f:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
    2d86:	b8 00 00 00 00       	mov    $0x0,%eax
    2d8b:	4c 89 c1             	mov    %r8,%rcx
    2d8e:	4c 89 ef             	mov    %r13,%rdi
    2d91:	f2 ae                	repnz scas %es:(%rdi),%al
    2d93:	48 89 ca             	mov    %rcx,%rdx
    2d96:	48 f7 d2             	not    %rdx
    2d99:	4c 89 c1             	mov    %r8,%rcx
    2d9c:	4c 89 f7             	mov    %r14,%rdi
    2d9f:	f2 ae                	repnz scas %es:(%rdi),%al
    2da1:	48 f7 d1             	not    %rcx
    2da4:	48 89 ce             	mov    %rcx,%rsi
    2da7:	4c 89 c1             	mov    %r8,%rcx
    2daa:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    2daf:	f2 ae                	repnz scas %es:(%rdi),%al
    2db1:	48 f7 d1             	not    %rcx
    2db4:	48 8d 74 0e fe       	lea    -0x2(%rsi,%rcx,1),%rsi
    2db9:	4c 89 c1             	mov    %r8,%rcx
    2dbc:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    2dc1:	f2 ae                	repnz scas %es:(%rdi),%al
    2dc3:	48 89 c8             	mov    %rcx,%rax
    2dc6:	48 f7 d0             	not    %rax
    2dc9:	48 8d 4c 06 ff       	lea    -0x1(%rsi,%rax,1),%rcx
    2dce:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
    2dd3:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
    2dda:	00 
    2ddb:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    2de1:	0f 87 d6 02 00 00    	ja     30bd <submitr+0x42f>
    2de7:	48 8d b4 24 50 40 00 	lea    0x4050(%rsp),%rsi
    2dee:	00 
    2def:	b9 00 04 00 00       	mov    $0x400,%ecx
    2df4:	b8 00 00 00 00       	mov    $0x0,%eax
    2df9:	48 89 f7             	mov    %rsi,%rdi
    2dfc:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    2dff:	4c 89 ef             	mov    %r13,%rdi
    2e02:	e8 77 fd ff ff       	callq  2b7e <urlencode>
    2e07:	85 c0                	test   %eax,%eax
    2e09:	0f 88 21 03 00 00    	js     3130 <submitr+0x4a2>
    2e0f:	4c 8d bc 24 50 20 00 	lea    0x2050(%rsp),%r15
    2e16:	00 
    2e17:	41 54                	push   %r12
    2e19:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
    2e20:	00 
    2e21:	50                   	push   %rax
    2e22:	4d 89 f1             	mov    %r14,%r9
    2e25:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
    2e2a:	48 8d 0d 57 19 00 00 	lea    0x1957(%rip),%rcx        # 4788 <trans_char+0x38>
    2e31:	ba 00 20 00 00       	mov    $0x2000,%edx
    2e36:	be 01 00 00 00       	mov    $0x1,%esi
    2e3b:	4c 89 ff             	mov    %r15,%rdi
    2e3e:	b8 00 00 00 00       	mov    $0x0,%eax
    2e43:	e8 f8 e5 ff ff       	callq  1440 <__sprintf_chk@plt>
    2e48:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2e4f:	b8 00 00 00 00       	mov    $0x0,%eax
    2e54:	4c 89 ff             	mov    %r15,%rdi
    2e57:	f2 ae                	repnz scas %es:(%rdi),%al
    2e59:	48 f7 d1             	not    %rcx
    2e5c:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    2e60:	4c 89 fe             	mov    %r15,%rsi
    2e63:	89 df                	mov    %ebx,%edi
    2e65:	e8 8e fb ff ff       	callq  29f8 <rio_writen>
    2e6a:	48 83 c4 10          	add    $0x10,%rsp
    2e6e:	48 85 c0             	test   %rax,%rax
    2e71:	0f 88 44 03 00 00    	js     31bb <submitr+0x52d>
    2e77:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    2e7c:	89 de                	mov    %ebx,%esi
    2e7e:	4c 89 e7             	mov    %r12,%rdi
    2e81:	e8 2a fb ff ff       	callq  29b0 <rio_readinitb>
    2e86:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2e8d:	00 
    2e8e:	ba 00 20 00 00       	mov    $0x2000,%edx
    2e93:	4c 89 e7             	mov    %r12,%rdi
    2e96:	e8 42 fc ff ff       	callq  2add <rio_readlineb>
    2e9b:	48 85 c0             	test   %rax,%rax
    2e9e:	0f 8e 86 03 00 00    	jle    322a <submitr+0x59c>
    2ea4:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    2ea9:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    2eb0:	00 
    2eb1:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    2eb8:	00 
    2eb9:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    2ec0:	00 
    2ec1:	48 8d 35 34 19 00 00 	lea    0x1934(%rip),%rsi        # 47fc <trans_char+0xac>
    2ec8:	b8 00 00 00 00       	mov    $0x0,%eax
    2ecd:	e8 be e4 ff ff       	callq  1390 <__isoc99_sscanf@plt>
    2ed2:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2ed9:	00 
    2eda:	b9 03 00 00 00       	mov    $0x3,%ecx
    2edf:	48 8d 3d 2d 19 00 00 	lea    0x192d(%rip),%rdi        # 4813 <trans_char+0xc3>
    2ee6:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2ee8:	0f 97 c0             	seta   %al
    2eeb:	1c 00                	sbb    $0x0,%al
    2eed:	84 c0                	test   %al,%al
    2eef:	0f 84 b3 03 00 00    	je     32a8 <submitr+0x61a>
    2ef5:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2efc:	00 
    2efd:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2f02:	ba 00 20 00 00       	mov    $0x2000,%edx
    2f07:	e8 d1 fb ff ff       	callq  2add <rio_readlineb>
    2f0c:	48 85 c0             	test   %rax,%rax
    2f0f:	7f c1                	jg     2ed2 <submitr+0x244>
    2f11:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2f18:	3a 20 43 
    2f1b:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2f22:	20 75 6e 
    2f25:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2f29:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2f2d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2f34:	74 6f 20 
    2f37:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2f3e:	68 65 61 
    2f41:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2f45:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2f49:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    2f50:	66 72 6f 
    2f53:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
    2f5a:	20 72 65 
    2f5d:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2f61:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2f65:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
    2f6c:	73 65 72 
    2f6f:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2f73:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
    2f7a:	89 df                	mov    %ebx,%edi
    2f7c:	e8 7f e3 ff ff       	callq  1300 <close@plt>
    2f81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f86:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
    2f8d:	00 
    2f8e:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
    2f95:	00 00 
    2f97:	0f 85 7e 04 00 00    	jne    341b <submitr+0x78d>
    2f9d:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    2fa4:	5b                   	pop    %rbx
    2fa5:	5d                   	pop    %rbp
    2fa6:	41 5c                	pop    %r12
    2fa8:	41 5d                	pop    %r13
    2faa:	41 5e                	pop    %r14
    2fac:	41 5f                	pop    %r15
    2fae:	c3                   	retq   
    2faf:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2fb6:	3a 20 43 
    2fb9:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2fc0:	20 75 6e 
    2fc3:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2fc7:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2fcb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2fd2:	74 6f 20 
    2fd5:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2fdc:	65 20 73 
    2fdf:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2fe3:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2fe7:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2fee:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2ff4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ff9:	eb 8b                	jmp    2f86 <submitr+0x2f8>
    2ffb:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    3002:	3a 20 44 
    3005:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    300c:	20 75 6e 
    300f:	48 89 45 00          	mov    %rax,0x0(%rbp)
    3013:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3017:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    301e:	74 6f 20 
    3021:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    3028:	76 65 20 
    302b:	48 89 45 10          	mov    %rax,0x10(%rbp)
    302f:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3033:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    303a:	72 20 61 
    303d:	48 89 45 20          	mov    %rax,0x20(%rbp)
    3041:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    3048:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    304e:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    3052:	89 df                	mov    %ebx,%edi
    3054:	e8 a7 e2 ff ff       	callq  1300 <close@plt>
    3059:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    305e:	e9 23 ff ff ff       	jmpq   2f86 <submitr+0x2f8>
    3063:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    306a:	3a 20 55 
    306d:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    3074:	20 74 6f 
    3077:	48 89 45 00          	mov    %rax,0x0(%rbp)
    307b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    307f:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    3086:	65 63 74 
    3089:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    3090:	68 65 20 
    3093:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3097:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    309b:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
    30a2:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
    30a8:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
    30ac:	89 df                	mov    %ebx,%edi
    30ae:	e8 4d e2 ff ff       	callq  1300 <close@plt>
    30b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    30b8:	e9 c9 fe ff ff       	jmpq   2f86 <submitr+0x2f8>
    30bd:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    30c4:	3a 20 52 
    30c7:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    30ce:	20 73 74 
    30d1:	48 89 45 00          	mov    %rax,0x0(%rbp)
    30d5:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    30d9:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    30e0:	74 6f 6f 
    30e3:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    30ea:	65 2e 20 
    30ed:	48 89 45 10          	mov    %rax,0x10(%rbp)
    30f1:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    30f5:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    30fc:	61 73 65 
    30ff:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    3106:	49 54 52 
    3109:	48 89 45 20          	mov    %rax,0x20(%rbp)
    310d:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    3111:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    3118:	55 46 00 
    311b:	48 89 45 30          	mov    %rax,0x30(%rbp)
    311f:	89 df                	mov    %ebx,%edi
    3121:	e8 da e1 ff ff       	callq  1300 <close@plt>
    3126:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    312b:	e9 56 fe ff ff       	jmpq   2f86 <submitr+0x2f8>
    3130:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    3137:	3a 20 52 
    313a:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    3141:	20 73 74 
    3144:	48 89 45 00          	mov    %rax,0x0(%rbp)
    3148:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    314c:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    3153:	63 6f 6e 
    3156:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    315d:	20 61 6e 
    3160:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3164:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3168:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    316f:	67 61 6c 
    3172:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    3179:	6e 70 72 
    317c:	48 89 45 20          	mov    %rax,0x20(%rbp)
    3180:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    3184:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    318b:	6c 65 20 
    318e:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    3195:	63 74 65 
    3198:	48 89 45 30          	mov    %rax,0x30(%rbp)
    319c:	48 89 55 38          	mov    %rdx,0x38(%rbp)
    31a0:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
    31a6:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
    31aa:	89 df                	mov    %ebx,%edi
    31ac:	e8 4f e1 ff ff       	callq  1300 <close@plt>
    31b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    31b6:	e9 cb fd ff ff       	jmpq   2f86 <submitr+0x2f8>
    31bb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    31c2:	3a 20 43 
    31c5:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    31cc:	20 75 6e 
    31cf:	48 89 45 00          	mov    %rax,0x0(%rbp)
    31d3:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    31d7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    31de:	74 6f 20 
    31e1:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    31e8:	20 74 6f 
    31eb:	48 89 45 10          	mov    %rax,0x10(%rbp)
    31ef:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    31f3:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
    31fa:	72 65 73 
    31fd:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
    3204:	65 72 76 
    3207:	48 89 45 20          	mov    %rax,0x20(%rbp)
    320b:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    320f:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
    3215:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
    3219:	89 df                	mov    %ebx,%edi
    321b:	e8 e0 e0 ff ff       	callq  1300 <close@plt>
    3220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3225:	e9 5c fd ff ff       	jmpq   2f86 <submitr+0x2f8>
    322a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    3231:	3a 20 43 
    3234:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    323b:	20 75 6e 
    323e:	48 89 45 00          	mov    %rax,0x0(%rbp)
    3242:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3246:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    324d:	74 6f 20 
    3250:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    3257:	66 69 72 
    325a:	48 89 45 10          	mov    %rax,0x10(%rbp)
    325e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3262:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    3269:	61 64 65 
    326c:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
    3273:	6d 20 72 
    3276:	48 89 45 20          	mov    %rax,0x20(%rbp)
    327a:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    327e:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
    3285:	20 73 65 
    3288:	48 89 45 30          	mov    %rax,0x30(%rbp)
    328c:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
    3293:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
    3297:	89 df                	mov    %ebx,%edi
    3299:	e8 62 e0 ff ff       	callq  1300 <close@plt>
    329e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    32a3:	e9 de fc ff ff       	jmpq   2f86 <submitr+0x2f8>
    32a8:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    32af:	00 
    32b0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    32b5:	ba 00 20 00 00       	mov    $0x2000,%edx
    32ba:	e8 1e f8 ff ff       	callq  2add <rio_readlineb>
    32bf:	48 85 c0             	test   %rax,%rax
    32c2:	0f 8e 96 00 00 00    	jle    335e <submitr+0x6d0>
    32c8:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    32cd:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    32d4:	0f 85 08 01 00 00    	jne    33e2 <submitr+0x754>
    32da:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    32e1:	00 
    32e2:	48 89 ef             	mov    %rbp,%rdi
    32e5:	e8 a6 df ff ff       	callq  1290 <strcpy@plt>
    32ea:	89 df                	mov    %ebx,%edi
    32ec:	e8 0f e0 ff ff       	callq  1300 <close@plt>
    32f1:	b9 04 00 00 00       	mov    $0x4,%ecx
    32f6:	48 8d 3d 10 15 00 00 	lea    0x1510(%rip),%rdi        # 480d <trans_char+0xbd>
    32fd:	48 89 ee             	mov    %rbp,%rsi
    3300:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    3302:	0f 97 c0             	seta   %al
    3305:	1c 00                	sbb    $0x0,%al
    3307:	0f be c0             	movsbl %al,%eax
    330a:	85 c0                	test   %eax,%eax
    330c:	0f 84 74 fc ff ff    	je     2f86 <submitr+0x2f8>
    3312:	b9 05 00 00 00       	mov    $0x5,%ecx
    3317:	48 8d 3d f3 14 00 00 	lea    0x14f3(%rip),%rdi        # 4811 <trans_char+0xc1>
    331e:	48 89 ee             	mov    %rbp,%rsi
    3321:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    3323:	0f 97 c0             	seta   %al
    3326:	1c 00                	sbb    $0x0,%al
    3328:	0f be c0             	movsbl %al,%eax
    332b:	85 c0                	test   %eax,%eax
    332d:	0f 84 53 fc ff ff    	je     2f86 <submitr+0x2f8>
    3333:	b9 03 00 00 00       	mov    $0x3,%ecx
    3338:	48 8d 3d d7 14 00 00 	lea    0x14d7(%rip),%rdi        # 4816 <trans_char+0xc6>
    333f:	48 89 ee             	mov    %rbp,%rsi
    3342:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    3344:	0f 97 c0             	seta   %al
    3347:	1c 00                	sbb    $0x0,%al
    3349:	0f be c0             	movsbl %al,%eax
    334c:	85 c0                	test   %eax,%eax
    334e:	0f 84 32 fc ff ff    	je     2f86 <submitr+0x2f8>
    3354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3359:	e9 28 fc ff ff       	jmpq   2f86 <submitr+0x2f8>
    335e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    3365:	3a 20 43 
    3368:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    336f:	20 75 6e 
    3372:	48 89 45 00          	mov    %rax,0x0(%rbp)
    3376:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    337a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    3381:	74 6f 20 
    3384:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    338b:	73 74 61 
    338e:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3392:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3396:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    339d:	65 73 73 
    33a0:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    33a7:	72 6f 6d 
    33aa:	48 89 45 20          	mov    %rax,0x20(%rbp)
    33ae:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    33b2:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
    33b9:	6c 74 20 
    33bc:	48 89 45 30          	mov    %rax,0x30(%rbp)
    33c0:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
    33c7:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
    33cd:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
    33d1:	89 df                	mov    %ebx,%edi
    33d3:	e8 28 df ff ff       	callq  1300 <close@plt>
    33d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    33dd:	e9 a4 fb ff ff       	jmpq   2f86 <submitr+0x2f8>
    33e2:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    33e9:	00 
    33ea:	48 8d 0d d7 13 00 00 	lea    0x13d7(%rip),%rcx        # 47c8 <trans_char+0x78>
    33f1:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    33f8:	be 01 00 00 00       	mov    $0x1,%esi
    33fd:	48 89 ef             	mov    %rbp,%rdi
    3400:	b8 00 00 00 00       	mov    $0x0,%eax
    3405:	e8 36 e0 ff ff       	callq  1440 <__sprintf_chk@plt>
    340a:	89 df                	mov    %ebx,%edi
    340c:	e8 ef de ff ff       	callq  1300 <close@plt>
    3411:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3416:	e9 6b fb ff ff       	jmpq   2f86 <submitr+0x2f8>
    341b:	e8 a0 de ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000003420 <init_timeout>:
    3420:	f3 0f 1e fa          	endbr64 
    3424:	85 ff                	test   %edi,%edi
    3426:	74 26                	je     344e <init_timeout+0x2e>
    3428:	53                   	push   %rbx
    3429:	89 fb                	mov    %edi,%ebx
    342b:	78 1a                	js     3447 <init_timeout+0x27>
    342d:	48 8d 35 8e f5 ff ff 	lea    -0xa72(%rip),%rsi        # 29c2 <sigalrm_handler>
    3434:	bf 0e 00 00 00       	mov    $0xe,%edi
    3439:	e8 e2 de ff ff       	callq  1320 <signal@plt>
    343e:	89 df                	mov    %ebx,%edi
    3440:	e8 ab de ff ff       	callq  12f0 <alarm@plt>
    3445:	5b                   	pop    %rbx
    3446:	c3                   	retq   
    3447:	bb 00 00 00 00       	mov    $0x0,%ebx
    344c:	eb df                	jmp    342d <init_timeout+0xd>
    344e:	c3                   	retq   

000000000000344f <init_driver>:
    344f:	f3 0f 1e fa          	endbr64 
    3453:	41 54                	push   %r12
    3455:	55                   	push   %rbp
    3456:	53                   	push   %rbx
    3457:	48 83 ec 20          	sub    $0x20,%rsp
    345b:	48 89 fd             	mov    %rdi,%rbp
    345e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3465:	00 00 
    3467:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    346c:	31 c0                	xor    %eax,%eax
    346e:	be 01 00 00 00       	mov    $0x1,%esi
    3473:	bf 0d 00 00 00       	mov    $0xd,%edi
    3478:	e8 a3 de ff ff       	callq  1320 <signal@plt>
    347d:	be 01 00 00 00       	mov    $0x1,%esi
    3482:	bf 1d 00 00 00       	mov    $0x1d,%edi
    3487:	e8 94 de ff ff       	callq  1320 <signal@plt>
    348c:	be 01 00 00 00       	mov    $0x1,%esi
    3491:	bf 1d 00 00 00       	mov    $0x1d,%edi
    3496:	e8 85 de ff ff       	callq  1320 <signal@plt>
    349b:	ba 00 00 00 00       	mov    $0x0,%edx
    34a0:	be 01 00 00 00       	mov    $0x1,%esi
    34a5:	bf 02 00 00 00       	mov    $0x2,%edi
    34aa:	e8 a1 df ff ff       	callq  1450 <socket@plt>
    34af:	85 c0                	test   %eax,%eax
    34b1:	0f 88 9c 00 00 00    	js     3553 <init_driver+0x104>
    34b7:	89 c3                	mov    %eax,%ebx
    34b9:	48 8d 3d 3a 0e 00 00 	lea    0xe3a(%rip),%rdi        # 42fa <_IO_stdin_used+0x2fa>
    34c0:	e8 6b de ff ff       	callq  1330 <gethostbyname@plt>
    34c5:	48 85 c0             	test   %rax,%rax
    34c8:	0f 84 d1 00 00 00    	je     359f <init_driver+0x150>
    34ce:	49 89 e4             	mov    %rsp,%r12
    34d1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    34d8:	00 
    34d9:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    34e0:	00 00 
    34e2:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    34e8:	48 63 50 14          	movslq 0x14(%rax),%rdx
    34ec:	48 8b 40 18          	mov    0x18(%rax),%rax
    34f0:	48 8b 30             	mov    (%rax),%rsi
    34f3:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    34f8:	b9 0c 00 00 00       	mov    $0xc,%ecx
    34fd:	e8 3e de ff ff       	callq  1340 <__memmove_chk@plt>
    3502:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
    3509:	ba 10 00 00 00       	mov    $0x10,%edx
    350e:	4c 89 e6             	mov    %r12,%rsi
    3511:	89 df                	mov    %ebx,%edi
    3513:	e8 f8 de ff ff       	callq  1410 <connect@plt>
    3518:	85 c0                	test   %eax,%eax
    351a:	0f 88 e7 00 00 00    	js     3607 <init_driver+0x1b8>
    3520:	89 df                	mov    %ebx,%edi
    3522:	e8 d9 dd ff ff       	callq  1300 <close@plt>
    3527:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    352d:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    3531:	b8 00 00 00 00       	mov    $0x0,%eax
    3536:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    353b:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    3542:	00 00 
    3544:	0f 85 10 01 00 00    	jne    365a <init_driver+0x20b>
    354a:	48 83 c4 20          	add    $0x20,%rsp
    354e:	5b                   	pop    %rbx
    354f:	5d                   	pop    %rbp
    3550:	41 5c                	pop    %r12
    3552:	c3                   	retq   
    3553:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    355a:	3a 20 43 
    355d:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    3564:	20 75 6e 
    3567:	48 89 45 00          	mov    %rax,0x0(%rbp)
    356b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    356f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    3576:	74 6f 20 
    3579:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    3580:	65 20 73 
    3583:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3587:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    358b:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    3592:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    3598:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    359d:	eb 97                	jmp    3536 <init_driver+0xe7>
    359f:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    35a6:	3a 20 44 
    35a9:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    35b0:	20 75 6e 
    35b3:	48 89 45 00          	mov    %rax,0x0(%rbp)
    35b7:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    35bb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    35c2:	74 6f 20 
    35c5:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    35cc:	76 65 20 
    35cf:	48 89 45 10          	mov    %rax,0x10(%rbp)
    35d3:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    35d7:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    35de:	72 20 61 
    35e1:	48 89 45 20          	mov    %rax,0x20(%rbp)
    35e5:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    35ec:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    35f2:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    35f6:	89 df                	mov    %ebx,%edi
    35f8:	e8 03 dd ff ff       	callq  1300 <close@plt>
    35fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3602:	e9 2f ff ff ff       	jmpq   3536 <init_driver+0xe7>
    3607:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    360e:	3a 20 55 
    3611:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    3618:	20 74 6f 
    361b:	48 89 45 00          	mov    %rax,0x0(%rbp)
    361f:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3623:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    362a:	65 63 74 
    362d:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
    3634:	65 72 76 
    3637:	48 89 45 10          	mov    %rax,0x10(%rbp)
    363b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    363f:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
    3645:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
    3649:	89 df                	mov    %ebx,%edi
    364b:	e8 b0 dc ff ff       	callq  1300 <close@plt>
    3650:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3655:	e9 dc fe ff ff       	jmpq   3536 <init_driver+0xe7>
    365a:	e8 61 dc ff ff       	callq  12c0 <__stack_chk_fail@plt>

000000000000365f <driver_post>:
    365f:	f3 0f 1e fa          	endbr64 
    3663:	53                   	push   %rbx
    3664:	4c 89 cb             	mov    %r9,%rbx
    3667:	45 85 c0             	test   %r8d,%r8d
    366a:	75 18                	jne    3684 <driver_post+0x25>
    366c:	48 85 ff             	test   %rdi,%rdi
    366f:	74 05                	je     3676 <driver_post+0x17>
    3671:	80 3f 00             	cmpb   $0x0,(%rdi)
    3674:	75 37                	jne    36ad <driver_post+0x4e>
    3676:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    367b:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    367f:	44 89 c0             	mov    %r8d,%eax
    3682:	5b                   	pop    %rbx
    3683:	c3                   	retq   
    3684:	48 89 ca             	mov    %rcx,%rdx
    3687:	48 8d 35 8b 11 00 00 	lea    0x118b(%rip),%rsi        # 4819 <trans_char+0xc9>
    368e:	bf 01 00 00 00       	mov    $0x1,%edi
    3693:	b8 00 00 00 00       	mov    $0x0,%eax
    3698:	e8 13 dd ff ff       	callq  13b0 <__printf_chk@plt>
    369d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    36a2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    36a6:	b8 00 00 00 00       	mov    $0x0,%eax
    36ab:	eb d5                	jmp    3682 <driver_post+0x23>
    36ad:	48 83 ec 08          	sub    $0x8,%rsp
    36b1:	41 51                	push   %r9
    36b3:	49 89 c9             	mov    %rcx,%r9
    36b6:	49 89 d0             	mov    %rdx,%r8
    36b9:	48 89 f9             	mov    %rdi,%rcx
    36bc:	48 89 f2             	mov    %rsi,%rdx
    36bf:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
    36c4:	48 8d 3d 2f 0c 00 00 	lea    0xc2f(%rip),%rdi        # 42fa <_IO_stdin_used+0x2fa>
    36cb:	e8 be f5 ff ff       	callq  2c8e <submitr>
    36d0:	48 83 c4 10          	add    $0x10,%rsp
    36d4:	eb ac                	jmp    3682 <driver_post+0x23>

00000000000036d6 <check>:
    36d6:	f3 0f 1e fa          	endbr64 
    36da:	89 f8                	mov    %edi,%eax
    36dc:	c1 e8 1c             	shr    $0x1c,%eax
    36df:	74 1d                	je     36fe <check+0x28>
    36e1:	b9 00 00 00 00       	mov    $0x0,%ecx
    36e6:	83 f9 1f             	cmp    $0x1f,%ecx
    36e9:	7f 0d                	jg     36f8 <check+0x22>
    36eb:	89 f8                	mov    %edi,%eax
    36ed:	d3 e8                	shr    %cl,%eax
    36ef:	3c 0a                	cmp    $0xa,%al
    36f1:	74 11                	je     3704 <check+0x2e>
    36f3:	83 c1 08             	add    $0x8,%ecx
    36f6:	eb ee                	jmp    36e6 <check+0x10>
    36f8:	b8 01 00 00 00       	mov    $0x1,%eax
    36fd:	c3                   	retq   
    36fe:	b8 00 00 00 00       	mov    $0x0,%eax
    3703:	c3                   	retq   
    3704:	b8 00 00 00 00       	mov    $0x0,%eax
    3709:	c3                   	retq   

000000000000370a <gencookie>:
    370a:	f3 0f 1e fa          	endbr64 
    370e:	53                   	push   %rbx
    370f:	83 c7 01             	add    $0x1,%edi
    3712:	e8 59 db ff ff       	callq  1270 <srandom@plt>
    3717:	e8 64 dc ff ff       	callq  1380 <random@plt>
    371c:	48 89 c7             	mov    %rax,%rdi
    371f:	89 c3                	mov    %eax,%ebx
    3721:	e8 b0 ff ff ff       	callq  36d6 <check>
    3726:	85 c0                	test   %eax,%eax
    3728:	74 ed                	je     3717 <gencookie+0xd>
    372a:	89 d8                	mov    %ebx,%eax
    372c:	5b                   	pop    %rbx
    372d:	c3                   	retq   
    372e:	66 90                	xchg   %ax,%ax

0000000000003730 <__libc_csu_init>:
    3730:	f3 0f 1e fa          	endbr64 
    3734:	41 57                	push   %r15
    3736:	4c 8d 3d 7b 35 00 00 	lea    0x357b(%rip),%r15        # 6cb8 <__frame_dummy_init_array_entry>
    373d:	41 56                	push   %r14
    373f:	49 89 d6             	mov    %rdx,%r14
    3742:	41 55                	push   %r13
    3744:	49 89 f5             	mov    %rsi,%r13
    3747:	41 54                	push   %r12
    3749:	41 89 fc             	mov    %edi,%r12d
    374c:	55                   	push   %rbp
    374d:	48 8d 2d 6c 35 00 00 	lea    0x356c(%rip),%rbp        # 6cc0 <__do_global_dtors_aux_fini_array_entry>
    3754:	53                   	push   %rbx
    3755:	4c 29 fd             	sub    %r15,%rbp
    3758:	48 83 ec 08          	sub    $0x8,%rsp
    375c:	e8 9f d8 ff ff       	callq  1000 <_init>
    3761:	48 c1 fd 03          	sar    $0x3,%rbp
    3765:	74 1f                	je     3786 <__libc_csu_init+0x56>
    3767:	31 db                	xor    %ebx,%ebx
    3769:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3770:	4c 89 f2             	mov    %r14,%rdx
    3773:	4c 89 ee             	mov    %r13,%rsi
    3776:	44 89 e7             	mov    %r12d,%edi
    3779:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    377d:	48 83 c3 01          	add    $0x1,%rbx
    3781:	48 39 dd             	cmp    %rbx,%rbp
    3784:	75 ea                	jne    3770 <__libc_csu_init+0x40>
    3786:	48 83 c4 08          	add    $0x8,%rsp
    378a:	5b                   	pop    %rbx
    378b:	5d                   	pop    %rbp
    378c:	41 5c                	pop    %r12
    378e:	41 5d                	pop    %r13
    3790:	41 5e                	pop    %r14
    3792:	41 5f                	pop    %r15
    3794:	c3                   	retq   
    3795:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    379c:	00 00 00 00 

00000000000037a0 <__libc_csu_fini>:
    37a0:	f3 0f 1e fa          	endbr64 
    37a4:	c3                   	retq   

Disassembly of section .fini:

00000000000037a8 <_fini>:
    37a8:	f3 0f 1e fa          	endbr64 
    37ac:	48 83 ec 08          	sub    $0x8,%rsp
    37b0:	48 83 c4 08          	add    $0x8,%rsp
    37b4:	c3                   	retq   
