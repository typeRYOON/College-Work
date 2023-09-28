ctarget:     file format elf64-x86-64

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
    1473:	4c 8d 05 56 21 00 00 	lea    0x2156(%rip),%r8        # 35d0 <__libc_csu_fini>
    147a:	48 8d 0d df 20 00 00 	lea    0x20df(%rip),%rcx        # 3560 <__libc_csu_init>
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
    1629:	e8 06 1f 00 00       	callq  3534 <gencookie>
    162e:	89 c7                	mov    %eax,%edi
    1630:	89 05 ae 5d 00 00    	mov    %eax,0x5dae(%rip)        # 73e4 <cookie>
    1636:	e8 f9 1e 00 00       	callq  3534 <gencookie>
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
    167c:	c6 05 85 69 00 00 63 	movb   $0x63,0x6985(%rip)        # 8008 <target_prefix>
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
    172f:	e8 45 1b 00 00       	callq  3279 <init_driver>
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
    179d:	48 8d 35 78 0d 00 00 	lea    0xd78(%rip),%rsi        # 251c <seghandler>
    17a4:	bf 0b 00 00 00       	mov    $0xb,%edi
    17a9:	e8 72 fb ff ff       	callq  1320 <signal@plt>
    17ae:	48 8d 35 0d 0d 00 00 	lea    0xd0d(%rip),%rsi        # 24c2 <bushandler>
    17b5:	bf 07 00 00 00       	mov    $0x7,%edi
    17ba:	e8 61 fb ff ff       	callq  1320 <signal@plt>
    17bf:	48 8d 35 b0 0d 00 00 	lea    0xdb0(%rip),%rsi        # 2576 <illegalhandler>
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
    17ff:	48 8d 35 ca 0d 00 00 	lea    0xdca(%rip),%rsi        # 25d0 <sigalrmhandler>
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
    1902:	be 00 00 00 00       	mov    $0x0,%esi
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
    1944:	e8 d9 0d 00 00       	callq  2722 <stable_launch>
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
    1975:	e8 97 07 00 00       	callq  2111 <check_fail>
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
    1e95:	e8 b5 02 00 00       	callq  214f <Gets>
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
    1ec9:	e8 f4 04 00 00       	callq  23c2 <validate>
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
    1f11:	e8 80 05 00 00       	callq  2496 <fail>
    1f16:	bf 00 00 00 00       	mov    $0x0,%edi
    1f1b:	e8 e0 f4 ff ff       	callq  1400 <exit@plt>
    1f20:	48 8d 35 61 24 00 00 	lea    0x2461(%rip),%rsi        # 4388 <_IO_stdin_used+0x388>
    1f27:	bf 01 00 00 00       	mov    $0x1,%edi
    1f2c:	b8 00 00 00 00       	mov    $0x0,%eax
    1f31:	e8 7a f4 ff ff       	callq  13b0 <__printf_chk@plt>
    1f36:	bf 02 00 00 00       	mov    $0x2,%edi
    1f3b:	e8 82 04 00 00       	callq  23c2 <validate>
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
    203f:	e8 7e 03 00 00       	callq  23c2 <validate>
    2044:	bf 00 00 00 00       	mov    $0x0,%edi
    2049:	e8 b2 f3 ff ff       	callq  1400 <exit@plt>
    204e:	48 89 da             	mov    %rbx,%rdx
    2051:	48 8d 35 a8 23 00 00 	lea    0x23a8(%rip),%rsi        # 4400 <_IO_stdin_used+0x400>
    2058:	bf 01 00 00 00       	mov    $0x1,%edi
    205d:	b8 00 00 00 00       	mov    $0x0,%eax
    2062:	e8 49 f3 ff ff       	callq  13b0 <__printf_chk@plt>
    2067:	bf 03 00 00 00       	mov    $0x3,%edi
    206c:	e8 25 04 00 00       	callq  2496 <fail>
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

00000000000020a2 <save_char>:
    20a2:	8b 05 5c 5f 00 00    	mov    0x5f5c(%rip),%eax        # 8004 <gets_cnt>
    20a8:	3d ff 03 00 00       	cmp    $0x3ff,%eax
    20ad:	7f 4a                	jg     20f9 <save_char+0x57>
    20af:	89 f9                	mov    %edi,%ecx
    20b1:	c0 e9 04             	shr    $0x4,%cl
    20b4:	8d 14 40             	lea    (%rax,%rax,2),%edx
    20b7:	4c 8d 05 92 26 00 00 	lea    0x2692(%rip),%r8        # 4750 <trans_char>
    20be:	83 e1 0f             	and    $0xf,%ecx
    20c1:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
    20c6:	48 8d 0d 33 53 00 00 	lea    0x5333(%rip),%rcx        # 7400 <gets_buf>
    20cd:	48 63 f2             	movslq %edx,%rsi
    20d0:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
    20d4:	8d 72 01             	lea    0x1(%rdx),%esi
    20d7:	83 e7 0f             	and    $0xf,%edi
    20da:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
    20df:	48 63 f6             	movslq %esi,%rsi
    20e2:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
    20e6:	83 c2 02             	add    $0x2,%edx
    20e9:	48 63 d2             	movslq %edx,%rdx
    20ec:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
    20f0:	83 c0 01             	add    $0x1,%eax
    20f3:	89 05 0b 5f 00 00    	mov    %eax,0x5f0b(%rip)        # 8004 <gets_cnt>
    20f9:	c3                   	retq   

00000000000020fa <save_term>:
    20fa:	8b 05 04 5f 00 00    	mov    0x5f04(%rip),%eax        # 8004 <gets_cnt>
    2100:	8d 04 40             	lea    (%rax,%rax,2),%eax
    2103:	48 98                	cltq   
    2105:	48 8d 15 f4 52 00 00 	lea    0x52f4(%rip),%rdx        # 7400 <gets_buf>
    210c:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    2110:	c3                   	retq   

0000000000002111 <check_fail>:
    2111:	f3 0f 1e fa          	endbr64 
    2115:	50                   	push   %rax
    2116:	58                   	pop    %rax
    2117:	48 83 ec 08          	sub    $0x8,%rsp
    211b:	0f be 15 e6 5e 00 00 	movsbl 0x5ee6(%rip),%edx        # 8008 <target_prefix>
    2122:	4c 8d 05 d7 52 00 00 	lea    0x52d7(%rip),%r8        # 7400 <gets_buf>
    2129:	8b 0d a9 52 00 00    	mov    0x52a9(%rip),%ecx        # 73d8 <check_level>
    212f:	48 8d 35 15 23 00 00 	lea    0x2315(%rip),%rsi        # 444b <_IO_stdin_used+0x44b>
    2136:	bf 01 00 00 00       	mov    $0x1,%edi
    213b:	b8 00 00 00 00       	mov    $0x0,%eax
    2140:	e8 6b f2 ff ff       	callq  13b0 <__printf_chk@plt>
    2145:	bf 01 00 00 00       	mov    $0x1,%edi
    214a:	e8 b1 f2 ff ff       	callq  1400 <exit@plt>

000000000000214f <Gets>:
    214f:	f3 0f 1e fa          	endbr64 
    2153:	41 54                	push   %r12
    2155:	55                   	push   %rbp
    2156:	53                   	push   %rbx
    2157:	49 89 fc             	mov    %rdi,%r12
    215a:	c7 05 a0 5e 00 00 00 	movl   $0x0,0x5ea0(%rip)        # 8004 <gets_cnt>
    2161:	00 00 00 
    2164:	48 89 fb             	mov    %rdi,%rbx
    2167:	48 8b 3d 62 52 00 00 	mov    0x5262(%rip),%rdi        # 73d0 <infile>
    216e:	e8 bd f2 ff ff       	callq  1430 <getc@plt>
    2173:	83 f8 ff             	cmp    $0xffffffff,%eax
    2176:	74 18                	je     2190 <Gets+0x41>
    2178:	83 f8 0a             	cmp    $0xa,%eax
    217b:	74 13                	je     2190 <Gets+0x41>
    217d:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
    2181:	88 03                	mov    %al,(%rbx)
    2183:	0f b6 f8             	movzbl %al,%edi
    2186:	e8 17 ff ff ff       	callq  20a2 <save_char>
    218b:	48 89 eb             	mov    %rbp,%rbx
    218e:	eb d7                	jmp    2167 <Gets+0x18>
    2190:	c6 03 00             	movb   $0x0,(%rbx)
    2193:	b8 00 00 00 00       	mov    $0x0,%eax
    2198:	e8 5d ff ff ff       	callq  20fa <save_term>
    219d:	4c 89 e0             	mov    %r12,%rax
    21a0:	5b                   	pop    %rbx
    21a1:	5d                   	pop    %rbp
    21a2:	41 5c                	pop    %r12
    21a4:	c3                   	retq   

00000000000021a5 <notify_server>:
    21a5:	f3 0f 1e fa          	endbr64 
    21a9:	55                   	push   %rbp
    21aa:	53                   	push   %rbx
    21ab:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    21b2:	ff 
    21b3:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    21ba:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    21bf:	4c 39 dc             	cmp    %r11,%rsp
    21c2:	75 ef                	jne    21b3 <notify_server+0xe>
    21c4:	48 83 ec 18          	sub    $0x18,%rsp
    21c8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    21cf:	00 00 
    21d1:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    21d8:	00 
    21d9:	31 c0                	xor    %eax,%eax
    21db:	83 3d 06 52 00 00 00 	cmpl   $0x0,0x5206(%rip)        # 73e8 <is_checker>
    21e2:	0f 85 26 01 00 00    	jne    230e <notify_server+0x169>
    21e8:	89 fb                	mov    %edi,%ebx
    21ea:	81 3d 10 5e 00 00 9c 	cmpl   $0x1f9c,0x5e10(%rip)        # 8004 <gets_cnt>
    21f1:	1f 00 00 
    21f4:	7f 18                	jg     220e <notify_server+0x69>
    21f6:	0f be 05 0b 5e 00 00 	movsbl 0x5e0b(%rip),%eax        # 8008 <target_prefix>
    21fd:	83 3d 64 51 00 00 00 	cmpl   $0x0,0x5164(%rip)        # 7368 <notify>
    2204:	74 23                	je     2229 <notify_server+0x84>
    2206:	8b 15 d4 51 00 00    	mov    0x51d4(%rip),%edx        # 73e0 <authkey>
    220c:	eb 20                	jmp    222e <notify_server+0x89>
    220e:	48 8d 35 6b 23 00 00 	lea    0x236b(%rip),%rsi        # 4580 <_IO_stdin_used+0x580>
    2215:	bf 01 00 00 00       	mov    $0x1,%edi
    221a:	e8 91 f1 ff ff       	callq  13b0 <__printf_chk@plt>
    221f:	bf 01 00 00 00       	mov    $0x1,%edi
    2224:	e8 d7 f1 ff ff       	callq  1400 <exit@plt>
    2229:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    222e:	85 db                	test   %ebx,%ebx
    2230:	0f 84 98 00 00 00    	je     22ce <notify_server+0x129>
    2236:	48 8d 2d 29 22 00 00 	lea    0x2229(%rip),%rbp        # 4466 <_IO_stdin_used+0x466>
    223d:	48 89 e7             	mov    %rsp,%rdi
    2240:	48 8d 0d b9 51 00 00 	lea    0x51b9(%rip),%rcx        # 7400 <gets_buf>
    2247:	51                   	push   %rcx
    2248:	56                   	push   %rsi
    2249:	50                   	push   %rax
    224a:	52                   	push   %rdx
    224b:	49 89 e9             	mov    %rbp,%r9
    224e:	44 8b 05 bb 4d 00 00 	mov    0x4dbb(%rip),%r8d        # 7010 <target_id>
    2255:	48 8d 0d 0f 22 00 00 	lea    0x220f(%rip),%rcx        # 446b <_IO_stdin_used+0x46b>
    225c:	ba 00 20 00 00       	mov    $0x2000,%edx
    2261:	be 01 00 00 00       	mov    $0x1,%esi
    2266:	b8 00 00 00 00       	mov    $0x0,%eax
    226b:	e8 d0 f1 ff ff       	callq  1440 <__sprintf_chk@plt>
    2270:	48 83 c4 20          	add    $0x20,%rsp
    2274:	83 3d ed 50 00 00 00 	cmpl   $0x0,0x50ed(%rip)        # 7368 <notify>
    227b:	0f 84 ae 00 00 00    	je     232f <notify_server+0x18a>
    2281:	85 db                	test   %ebx,%ebx
    2283:	74 7d                	je     2302 <notify_server+0x15d>
    2285:	48 89 e1             	mov    %rsp,%rcx
    2288:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
    228f:	00 
    2290:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    2296:	48 8b 15 8b 4d 00 00 	mov    0x4d8b(%rip),%rdx        # 7028 <lab>
    229d:	48 8b 35 8c 4d 00 00 	mov    0x4d8c(%rip),%rsi        # 7030 <course>
    22a4:	48 8b 3d 75 4d 00 00 	mov    0x4d75(%rip),%rdi        # 7020 <user_id>
    22ab:	e8 d9 11 00 00       	callq  3489 <driver_post>
    22b0:	85 c0                	test   %eax,%eax
    22b2:	78 26                	js     22da <notify_server+0x135>
    22b4:	48 8d 3d f5 22 00 00 	lea    0x22f5(%rip),%rdi        # 45b0 <_IO_stdin_used+0x5b0>
    22bb:	e8 e0 ef ff ff       	callq  12a0 <puts@plt>
    22c0:	48 8d 3d cc 21 00 00 	lea    0x21cc(%rip),%rdi        # 4493 <_IO_stdin_used+0x493>
    22c7:	e8 d4 ef ff ff       	callq  12a0 <puts@plt>
    22cc:	eb 40                	jmp    230e <notify_server+0x169>
    22ce:	48 8d 2d 8c 21 00 00 	lea    0x218c(%rip),%rbp        # 4461 <_IO_stdin_used+0x461>
    22d5:	e9 63 ff ff ff       	jmpq   223d <notify_server+0x98>
    22da:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
    22e1:	00 
    22e2:	48 8d 35 9e 21 00 00 	lea    0x219e(%rip),%rsi        # 4487 <_IO_stdin_used+0x487>
    22e9:	bf 01 00 00 00       	mov    $0x1,%edi
    22ee:	b8 00 00 00 00       	mov    $0x0,%eax
    22f3:	e8 b8 f0 ff ff       	callq  13b0 <__printf_chk@plt>
    22f8:	bf 01 00 00 00       	mov    $0x1,%edi
    22fd:	e8 fe f0 ff ff       	callq  1400 <exit@plt>
    2302:	48 8d 3d 94 21 00 00 	lea    0x2194(%rip),%rdi        # 449d <_IO_stdin_used+0x49d>
    2309:	e8 92 ef ff ff       	callq  12a0 <puts@plt>
    230e:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    2315:	00 
    2316:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    231d:	00 00 
    231f:	0f 85 98 00 00 00    	jne    23bd <notify_server+0x218>
    2325:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
    232c:	5b                   	pop    %rbx
    232d:	5d                   	pop    %rbp
    232e:	c3                   	retq   
    232f:	48 89 ea             	mov    %rbp,%rdx
    2332:	48 8d 35 af 22 00 00 	lea    0x22af(%rip),%rsi        # 45e8 <_IO_stdin_used+0x5e8>
    2339:	bf 01 00 00 00       	mov    $0x1,%edi
    233e:	b8 00 00 00 00       	mov    $0x0,%eax
    2343:	e8 68 f0 ff ff       	callq  13b0 <__printf_chk@plt>
    2348:	48 8b 15 d1 4c 00 00 	mov    0x4cd1(%rip),%rdx        # 7020 <user_id>
    234f:	48 8d 35 4e 21 00 00 	lea    0x214e(%rip),%rsi        # 44a4 <_IO_stdin_used+0x4a4>
    2356:	bf 01 00 00 00       	mov    $0x1,%edi
    235b:	b8 00 00 00 00       	mov    $0x0,%eax
    2360:	e8 4b f0 ff ff       	callq  13b0 <__printf_chk@plt>
    2365:	48 8b 15 c4 4c 00 00 	mov    0x4cc4(%rip),%rdx        # 7030 <course>
    236c:	48 8d 35 3e 21 00 00 	lea    0x213e(%rip),%rsi        # 44b1 <_IO_stdin_used+0x4b1>
    2373:	bf 01 00 00 00       	mov    $0x1,%edi
    2378:	b8 00 00 00 00       	mov    $0x0,%eax
    237d:	e8 2e f0 ff ff       	callq  13b0 <__printf_chk@plt>
    2382:	48 8b 15 9f 4c 00 00 	mov    0x4c9f(%rip),%rdx        # 7028 <lab>
    2389:	48 8d 35 2d 21 00 00 	lea    0x212d(%rip),%rsi        # 44bd <_IO_stdin_used+0x4bd>
    2390:	bf 01 00 00 00       	mov    $0x1,%edi
    2395:	b8 00 00 00 00       	mov    $0x0,%eax
    239a:	e8 11 f0 ff ff       	callq  13b0 <__printf_chk@plt>
    239f:	48 89 e2             	mov    %rsp,%rdx
    23a2:	48 8d 35 1d 21 00 00 	lea    0x211d(%rip),%rsi        # 44c6 <_IO_stdin_used+0x4c6>
    23a9:	bf 01 00 00 00       	mov    $0x1,%edi
    23ae:	b8 00 00 00 00       	mov    $0x0,%eax
    23b3:	e8 f8 ef ff ff       	callq  13b0 <__printf_chk@plt>
    23b8:	e9 51 ff ff ff       	jmpq   230e <notify_server+0x169>
    23bd:	e8 fe ee ff ff       	callq  12c0 <__stack_chk_fail@plt>

00000000000023c2 <validate>:
    23c2:	f3 0f 1e fa          	endbr64 
    23c6:	53                   	push   %rbx
    23c7:	89 fb                	mov    %edi,%ebx
    23c9:	83 3d 18 50 00 00 00 	cmpl   $0x0,0x5018(%rip)        # 73e8 <is_checker>
    23d0:	74 72                	je     2444 <validate+0x82>
    23d2:	39 3d 04 50 00 00    	cmp    %edi,0x5004(%rip)        # 73dc <vlevel>
    23d8:	75 32                	jne    240c <validate+0x4a>
    23da:	8b 15 f8 4f 00 00    	mov    0x4ff8(%rip),%edx        # 73d8 <check_level>
    23e0:	39 fa                	cmp    %edi,%edx
    23e2:	75 3e                	jne    2422 <validate+0x60>
    23e4:	0f be 15 1d 5c 00 00 	movsbl 0x5c1d(%rip),%edx        # 8008 <target_prefix>
    23eb:	4c 8d 05 0e 50 00 00 	lea    0x500e(%rip),%r8        # 7400 <gets_buf>
    23f2:	89 f9                	mov    %edi,%ecx
    23f4:	48 8d 35 f5 20 00 00 	lea    0x20f5(%rip),%rsi        # 44f0 <_IO_stdin_used+0x4f0>
    23fb:	bf 01 00 00 00       	mov    $0x1,%edi
    2400:	b8 00 00 00 00       	mov    $0x0,%eax
    2405:	e8 a6 ef ff ff       	callq  13b0 <__printf_chk@plt>
    240a:	5b                   	pop    %rbx
    240b:	c3                   	retq   
    240c:	48 8d 3d bf 20 00 00 	lea    0x20bf(%rip),%rdi        # 44d2 <_IO_stdin_used+0x4d2>
    2413:	e8 88 ee ff ff       	callq  12a0 <puts@plt>
    2418:	b8 00 00 00 00       	mov    $0x0,%eax
    241d:	e8 ef fc ff ff       	callq  2111 <check_fail>
    2422:	89 f9                	mov    %edi,%ecx
    2424:	48 8d 35 e5 21 00 00 	lea    0x21e5(%rip),%rsi        # 4610 <_IO_stdin_used+0x610>
    242b:	bf 01 00 00 00       	mov    $0x1,%edi
    2430:	b8 00 00 00 00       	mov    $0x0,%eax
    2435:	e8 76 ef ff ff       	callq  13b0 <__printf_chk@plt>
    243a:	b8 00 00 00 00       	mov    $0x0,%eax
    243f:	e8 cd fc ff ff       	callq  2111 <check_fail>
    2444:	39 3d 92 4f 00 00    	cmp    %edi,0x4f92(%rip)        # 73dc <vlevel>
    244a:	74 1a                	je     2466 <validate+0xa4>
    244c:	48 8d 3d 7f 20 00 00 	lea    0x207f(%rip),%rdi        # 44d2 <_IO_stdin_used+0x4d2>
    2453:	e8 48 ee ff ff       	callq  12a0 <puts@plt>
    2458:	89 de                	mov    %ebx,%esi
    245a:	bf 00 00 00 00       	mov    $0x0,%edi
    245f:	e8 41 fd ff ff       	callq  21a5 <notify_server>
    2464:	eb a4                	jmp    240a <validate+0x48>
    2466:	0f be 0d 9b 5b 00 00 	movsbl 0x5b9b(%rip),%ecx        # 8008 <target_prefix>
    246d:	89 fa                	mov    %edi,%edx
    246f:	48 8d 35 c2 21 00 00 	lea    0x21c2(%rip),%rsi        # 4638 <_IO_stdin_used+0x638>
    2476:	bf 01 00 00 00       	mov    $0x1,%edi
    247b:	b8 00 00 00 00       	mov    $0x0,%eax
    2480:	e8 2b ef ff ff       	callq  13b0 <__printf_chk@plt>
    2485:	89 de                	mov    %ebx,%esi
    2487:	bf 01 00 00 00       	mov    $0x1,%edi
    248c:	e8 14 fd ff ff       	callq  21a5 <notify_server>
    2491:	e9 74 ff ff ff       	jmpq   240a <validate+0x48>

0000000000002496 <fail>:
    2496:	f3 0f 1e fa          	endbr64 
    249a:	48 83 ec 08          	sub    $0x8,%rsp
    249e:	83 3d 43 4f 00 00 00 	cmpl   $0x0,0x4f43(%rip)        # 73e8 <is_checker>
    24a5:	75 11                	jne    24b8 <fail+0x22>
    24a7:	89 fe                	mov    %edi,%esi
    24a9:	bf 00 00 00 00       	mov    $0x0,%edi
    24ae:	e8 f2 fc ff ff       	callq  21a5 <notify_server>
    24b3:	48 83 c4 08          	add    $0x8,%rsp
    24b7:	c3                   	retq   
    24b8:	b8 00 00 00 00       	mov    $0x0,%eax
    24bd:	e8 4f fc ff ff       	callq  2111 <check_fail>

00000000000024c2 <bushandler>:
    24c2:	f3 0f 1e fa          	endbr64 
    24c6:	50                   	push   %rax
    24c7:	58                   	pop    %rax
    24c8:	48 83 ec 08          	sub    $0x8,%rsp
    24cc:	83 3d 15 4f 00 00 00 	cmpl   $0x0,0x4f15(%rip)        # 73e8 <is_checker>
    24d3:	74 16                	je     24eb <bushandler+0x29>
    24d5:	48 8d 3d 29 20 00 00 	lea    0x2029(%rip),%rdi        # 4505 <_IO_stdin_used+0x505>
    24dc:	e8 bf ed ff ff       	callq  12a0 <puts@plt>
    24e1:	b8 00 00 00 00       	mov    $0x0,%eax
    24e6:	e8 26 fc ff ff       	callq  2111 <check_fail>
    24eb:	48 8d 3d 7e 21 00 00 	lea    0x217e(%rip),%rdi        # 4670 <_IO_stdin_used+0x670>
    24f2:	e8 a9 ed ff ff       	callq  12a0 <puts@plt>
    24f7:	48 8d 3d 11 20 00 00 	lea    0x2011(%rip),%rdi        # 450f <_IO_stdin_used+0x50f>
    24fe:	e8 9d ed ff ff       	callq  12a0 <puts@plt>
    2503:	be 00 00 00 00       	mov    $0x0,%esi
    2508:	bf 00 00 00 00       	mov    $0x0,%edi
    250d:	e8 93 fc ff ff       	callq  21a5 <notify_server>
    2512:	bf 01 00 00 00       	mov    $0x1,%edi
    2517:	e8 e4 ee ff ff       	callq  1400 <exit@plt>

000000000000251c <seghandler>:
    251c:	f3 0f 1e fa          	endbr64 
    2520:	50                   	push   %rax
    2521:	58                   	pop    %rax
    2522:	48 83 ec 08          	sub    $0x8,%rsp
    2526:	83 3d bb 4e 00 00 00 	cmpl   $0x0,0x4ebb(%rip)        # 73e8 <is_checker>
    252d:	74 16                	je     2545 <seghandler+0x29>
    252f:	48 8d 3d ef 1f 00 00 	lea    0x1fef(%rip),%rdi        # 4525 <_IO_stdin_used+0x525>
    2536:	e8 65 ed ff ff       	callq  12a0 <puts@plt>
    253b:	b8 00 00 00 00       	mov    $0x0,%eax
    2540:	e8 cc fb ff ff       	callq  2111 <check_fail>
    2545:	48 8d 3d 44 21 00 00 	lea    0x2144(%rip),%rdi        # 4690 <_IO_stdin_used+0x690>
    254c:	e8 4f ed ff ff       	callq  12a0 <puts@plt>
    2551:	48 8d 3d b7 1f 00 00 	lea    0x1fb7(%rip),%rdi        # 450f <_IO_stdin_used+0x50f>
    2558:	e8 43 ed ff ff       	callq  12a0 <puts@plt>
    255d:	be 00 00 00 00       	mov    $0x0,%esi
    2562:	bf 00 00 00 00       	mov    $0x0,%edi
    2567:	e8 39 fc ff ff       	callq  21a5 <notify_server>
    256c:	bf 01 00 00 00       	mov    $0x1,%edi
    2571:	e8 8a ee ff ff       	callq  1400 <exit@plt>

0000000000002576 <illegalhandler>:
    2576:	f3 0f 1e fa          	endbr64 
    257a:	50                   	push   %rax
    257b:	58                   	pop    %rax
    257c:	48 83 ec 08          	sub    $0x8,%rsp
    2580:	83 3d 61 4e 00 00 00 	cmpl   $0x0,0x4e61(%rip)        # 73e8 <is_checker>
    2587:	74 16                	je     259f <illegalhandler+0x29>
    2589:	48 8d 3d a8 1f 00 00 	lea    0x1fa8(%rip),%rdi        # 4538 <_IO_stdin_used+0x538>
    2590:	e8 0b ed ff ff       	callq  12a0 <puts@plt>
    2595:	b8 00 00 00 00       	mov    $0x0,%eax
    259a:	e8 72 fb ff ff       	callq  2111 <check_fail>
    259f:	48 8d 3d 12 21 00 00 	lea    0x2112(%rip),%rdi        # 46b8 <_IO_stdin_used+0x6b8>
    25a6:	e8 f5 ec ff ff       	callq  12a0 <puts@plt>
    25ab:	48 8d 3d 5d 1f 00 00 	lea    0x1f5d(%rip),%rdi        # 450f <_IO_stdin_used+0x50f>
    25b2:	e8 e9 ec ff ff       	callq  12a0 <puts@plt>
    25b7:	be 00 00 00 00       	mov    $0x0,%esi
    25bc:	bf 00 00 00 00       	mov    $0x0,%edi
    25c1:	e8 df fb ff ff       	callq  21a5 <notify_server>
    25c6:	bf 01 00 00 00       	mov    $0x1,%edi
    25cb:	e8 30 ee ff ff       	callq  1400 <exit@plt>

00000000000025d0 <sigalrmhandler>:
    25d0:	f3 0f 1e fa          	endbr64 
    25d4:	50                   	push   %rax
    25d5:	58                   	pop    %rax
    25d6:	48 83 ec 08          	sub    $0x8,%rsp
    25da:	83 3d 07 4e 00 00 00 	cmpl   $0x0,0x4e07(%rip)        # 73e8 <is_checker>
    25e1:	74 16                	je     25f9 <sigalrmhandler+0x29>
    25e3:	48 8d 3d 62 1f 00 00 	lea    0x1f62(%rip),%rdi        # 454c <_IO_stdin_used+0x54c>
    25ea:	e8 b1 ec ff ff       	callq  12a0 <puts@plt>
    25ef:	b8 00 00 00 00       	mov    $0x0,%eax
    25f4:	e8 18 fb ff ff       	callq  2111 <check_fail>
    25f9:	ba 05 00 00 00       	mov    $0x5,%edx
    25fe:	48 8d 35 e3 20 00 00 	lea    0x20e3(%rip),%rsi        # 46e8 <_IO_stdin_used+0x6e8>
    2605:	bf 01 00 00 00       	mov    $0x1,%edi
    260a:	b8 00 00 00 00       	mov    $0x0,%eax
    260f:	e8 9c ed ff ff       	callq  13b0 <__printf_chk@plt>
    2614:	be 00 00 00 00       	mov    $0x0,%esi
    2619:	bf 00 00 00 00       	mov    $0x0,%edi
    261e:	e8 82 fb ff ff       	callq  21a5 <notify_server>
    2623:	bf 01 00 00 00       	mov    $0x1,%edi
    2628:	e8 d3 ed ff ff       	callq  1400 <exit@plt>

000000000000262d <launch>:
    262d:	f3 0f 1e fa          	endbr64 
    2631:	55                   	push   %rbp
    2632:	48 89 e5             	mov    %rsp,%rbp
    2635:	48 83 ec 10          	sub    $0x10,%rsp
    2639:	48 89 fa             	mov    %rdi,%rdx
    263c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2643:	00 00 
    2645:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2649:	31 c0                	xor    %eax,%eax
    264b:	48 8d 47 17          	lea    0x17(%rdi),%rax
    264f:	48 89 c1             	mov    %rax,%rcx
    2652:	48 83 e1 f0          	and    $0xfffffffffffffff0,%rcx
    2656:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    265c:	48 89 e6             	mov    %rsp,%rsi
    265f:	48 29 c6             	sub    %rax,%rsi
    2662:	48 89 f0             	mov    %rsi,%rax
    2665:	48 39 c4             	cmp    %rax,%rsp
    2668:	74 12                	je     267c <launch+0x4f>
    266a:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2671:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
    2678:	00 00 
    267a:	eb e9                	jmp    2665 <launch+0x38>
    267c:	48 89 c8             	mov    %rcx,%rax
    267f:	25 ff 0f 00 00       	and    $0xfff,%eax
    2684:	48 29 c4             	sub    %rax,%rsp
    2687:	48 85 c0             	test   %rax,%rax
    268a:	74 06                	je     2692 <launch+0x65>
    268c:	48 83 4c 04 f8 00    	orq    $0x0,-0x8(%rsp,%rax,1)
    2692:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
    2697:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
    269b:	be f4 00 00 00       	mov    $0xf4,%esi
    26a0:	e8 3b ec ff ff       	callq  12e0 <memset@plt>
    26a5:	48 8b 05 d4 4c 00 00 	mov    0x4cd4(%rip),%rax        # 7380 <stdin@@GLIBC_2.2.5>
    26ac:	48 39 05 1d 4d 00 00 	cmp    %rax,0x4d1d(%rip)        # 73d0 <infile>
    26b3:	74 3a                	je     26ef <launch+0xc2>
    26b5:	c7 05 1d 4d 00 00 00 	movl   $0x0,0x4d1d(%rip)        # 73dc <vlevel>
    26bc:	00 00 00 
    26bf:	b8 00 00 00 00       	mov    $0x0,%eax
    26c4:	e8 aa f9 ff ff       	callq  2073 <test>
    26c9:	83 3d 18 4d 00 00 00 	cmpl   $0x0,0x4d18(%rip)        # 73e8 <is_checker>
    26d0:	75 35                	jne    2707 <launch+0xda>
    26d2:	48 8d 3d 93 1e 00 00 	lea    0x1e93(%rip),%rdi        # 456c <_IO_stdin_used+0x56c>
    26d9:	e8 c2 eb ff ff       	callq  12a0 <puts@plt>
    26de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    26e2:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    26e9:	00 00 
    26eb:	75 30                	jne    271d <launch+0xf0>
    26ed:	c9                   	leaveq 
    26ee:	c3                   	retq   
    26ef:	48 8d 35 5e 1e 00 00 	lea    0x1e5e(%rip),%rsi        # 4554 <_IO_stdin_used+0x554>
    26f6:	bf 01 00 00 00       	mov    $0x1,%edi
    26fb:	b8 00 00 00 00       	mov    $0x0,%eax
    2700:	e8 ab ec ff ff       	callq  13b0 <__printf_chk@plt>
    2705:	eb ae                	jmp    26b5 <launch+0x88>
    2707:	48 8d 3d 53 1e 00 00 	lea    0x1e53(%rip),%rdi        # 4561 <_IO_stdin_used+0x561>
    270e:	e8 8d eb ff ff       	callq  12a0 <puts@plt>
    2713:	b8 00 00 00 00       	mov    $0x0,%eax
    2718:	e8 f4 f9 ff ff       	callq  2111 <check_fail>
    271d:	e8 9e eb ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000002722 <stable_launch>:
    2722:	f3 0f 1e fa          	endbr64 
    2726:	53                   	push   %rbx
    2727:	48 89 3d 9a 4c 00 00 	mov    %rdi,0x4c9a(%rip)        # 73c8 <global_offset>
    272e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    2734:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    273a:	b9 32 01 00 00       	mov    $0x132,%ecx
    273f:	ba 07 00 00 00       	mov    $0x7,%edx
    2744:	be 00 00 10 00       	mov    $0x100000,%esi
    2749:	bf 00 60 58 55       	mov    $0x55586000,%edi
    274e:	e8 7d eb ff ff       	callq  12d0 <mmap@plt>
    2753:	48 89 c3             	mov    %rax,%rbx
    2756:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
    275c:	75 43                	jne    27a1 <stable_launch+0x7f>
    275e:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
    2765:	48 89 15 a4 58 00 00 	mov    %rdx,0x58a4(%rip)        # 8010 <stack_top>
    276c:	48 89 e0             	mov    %rsp,%rax
    276f:	48 89 d4             	mov    %rdx,%rsp
    2772:	48 89 c2             	mov    %rax,%rdx
    2775:	48 89 15 44 4c 00 00 	mov    %rdx,0x4c44(%rip)        # 73c0 <global_save_stack>
    277c:	48 8b 3d 45 4c 00 00 	mov    0x4c45(%rip),%rdi        # 73c8 <global_offset>
    2783:	e8 a5 fe ff ff       	callq  262d <launch>
    2788:	48 8b 05 31 4c 00 00 	mov    0x4c31(%rip),%rax        # 73c0 <global_save_stack>
    278f:	48 89 c4             	mov    %rax,%rsp
    2792:	be 00 00 10 00       	mov    $0x100000,%esi
    2797:	48 89 df             	mov    %rbx,%rdi
    279a:	e8 01 ec ff ff       	callq  13a0 <munmap@plt>
    279f:	5b                   	pop    %rbx
    27a0:	c3                   	retq   
    27a1:	be 00 00 10 00       	mov    $0x100000,%esi
    27a6:	48 89 c7             	mov    %rax,%rdi
    27a9:	e8 f2 eb ff ff       	callq  13a0 <munmap@plt>
    27ae:	b9 00 60 58 55       	mov    $0x55586000,%ecx
    27b3:	48 8d 15 66 1f 00 00 	lea    0x1f66(%rip),%rdx        # 4720 <_IO_stdin_used+0x720>
    27ba:	be 01 00 00 00       	mov    $0x1,%esi
    27bf:	48 8b 3d da 4b 00 00 	mov    0x4bda(%rip),%rdi        # 73a0 <stderr@@GLIBC_2.2.5>
    27c6:	b8 00 00 00 00       	mov    $0x0,%eax
    27cb:	e8 50 ec ff ff       	callq  1420 <__fprintf_chk@plt>
    27d0:	bf 01 00 00 00       	mov    $0x1,%edi
    27d5:	e8 26 ec ff ff       	callq  1400 <exit@plt>

00000000000027da <rio_readinitb>:
    27da:	89 37                	mov    %esi,(%rdi)
    27dc:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
    27e3:	48 8d 47 10          	lea    0x10(%rdi),%rax
    27e7:	48 89 47 08          	mov    %rax,0x8(%rdi)
    27eb:	c3                   	retq   

00000000000027ec <sigalrm_handler>:
    27ec:	f3 0f 1e fa          	endbr64 
    27f0:	50                   	push   %rax
    27f1:	58                   	pop    %rax
    27f2:	48 83 ec 08          	sub    $0x8,%rsp
    27f6:	b9 00 00 00 00       	mov    $0x0,%ecx
    27fb:	48 8d 15 5e 1f 00 00 	lea    0x1f5e(%rip),%rdx        # 4760 <trans_char+0x10>
    2802:	be 01 00 00 00       	mov    $0x1,%esi
    2807:	48 8b 3d 92 4b 00 00 	mov    0x4b92(%rip),%rdi        # 73a0 <stderr@@GLIBC_2.2.5>
    280e:	b8 00 00 00 00       	mov    $0x0,%eax
    2813:	e8 08 ec ff ff       	callq  1420 <__fprintf_chk@plt>
    2818:	bf 01 00 00 00       	mov    $0x1,%edi
    281d:	e8 de eb ff ff       	callq  1400 <exit@plt>

0000000000002822 <rio_writen>:
    2822:	41 55                	push   %r13
    2824:	41 54                	push   %r12
    2826:	55                   	push   %rbp
    2827:	53                   	push   %rbx
    2828:	48 83 ec 08          	sub    $0x8,%rsp
    282c:	41 89 fc             	mov    %edi,%r12d
    282f:	48 89 f5             	mov    %rsi,%rbp
    2832:	49 89 d5             	mov    %rdx,%r13
    2835:	48 89 d3             	mov    %rdx,%rbx
    2838:	eb 06                	jmp    2840 <rio_writen+0x1e>
    283a:	48 29 c3             	sub    %rax,%rbx
    283d:	48 01 c5             	add    %rax,%rbp
    2840:	48 85 db             	test   %rbx,%rbx
    2843:	74 24                	je     2869 <rio_writen+0x47>
    2845:	48 89 da             	mov    %rbx,%rdx
    2848:	48 89 ee             	mov    %rbp,%rsi
    284b:	44 89 e7             	mov    %r12d,%edi
    284e:	e8 5d ea ff ff       	callq  12b0 <write@plt>
    2853:	48 85 c0             	test   %rax,%rax
    2856:	7f e2                	jg     283a <rio_writen+0x18>
    2858:	e8 03 ea ff ff       	callq  1260 <__errno_location@plt>
    285d:	83 38 04             	cmpl   $0x4,(%rax)
    2860:	75 15                	jne    2877 <rio_writen+0x55>
    2862:	b8 00 00 00 00       	mov    $0x0,%eax
    2867:	eb d1                	jmp    283a <rio_writen+0x18>
    2869:	4c 89 e8             	mov    %r13,%rax
    286c:	48 83 c4 08          	add    $0x8,%rsp
    2870:	5b                   	pop    %rbx
    2871:	5d                   	pop    %rbp
    2872:	41 5c                	pop    %r12
    2874:	41 5d                	pop    %r13
    2876:	c3                   	retq   
    2877:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    287e:	eb ec                	jmp    286c <rio_writen+0x4a>

0000000000002880 <rio_read>:
    2880:	41 55                	push   %r13
    2882:	41 54                	push   %r12
    2884:	55                   	push   %rbp
    2885:	53                   	push   %rbx
    2886:	48 83 ec 08          	sub    $0x8,%rsp
    288a:	48 89 fb             	mov    %rdi,%rbx
    288d:	49 89 f5             	mov    %rsi,%r13
    2890:	49 89 d4             	mov    %rdx,%r12
    2893:	eb 17                	jmp    28ac <rio_read+0x2c>
    2895:	e8 c6 e9 ff ff       	callq  1260 <__errno_location@plt>
    289a:	83 38 04             	cmpl   $0x4,(%rax)
    289d:	74 0d                	je     28ac <rio_read+0x2c>
    289f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    28a6:	eb 54                	jmp    28fc <rio_read+0x7c>
    28a8:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    28ac:	8b 6b 04             	mov    0x4(%rbx),%ebp
    28af:	85 ed                	test   %ebp,%ebp
    28b1:	7f 23                	jg     28d6 <rio_read+0x56>
    28b3:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
    28b7:	8b 3b                	mov    (%rbx),%edi
    28b9:	ba 00 20 00 00       	mov    $0x2000,%edx
    28be:	48 89 ee             	mov    %rbp,%rsi
    28c1:	e8 4a ea ff ff       	callq  1310 <read@plt>
    28c6:	89 43 04             	mov    %eax,0x4(%rbx)
    28c9:	85 c0                	test   %eax,%eax
    28cb:	78 c8                	js     2895 <rio_read+0x15>
    28cd:	75 d9                	jne    28a8 <rio_read+0x28>
    28cf:	b8 00 00 00 00       	mov    $0x0,%eax
    28d4:	eb 26                	jmp    28fc <rio_read+0x7c>
    28d6:	89 e8                	mov    %ebp,%eax
    28d8:	4c 39 e0             	cmp    %r12,%rax
    28db:	72 03                	jb     28e0 <rio_read+0x60>
    28dd:	44 89 e5             	mov    %r12d,%ebp
    28e0:	4c 63 e5             	movslq %ebp,%r12
    28e3:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    28e7:	4c 89 e2             	mov    %r12,%rdx
    28ea:	4c 89 ef             	mov    %r13,%rdi
    28ed:	e8 6e ea ff ff       	callq  1360 <memcpy@plt>
    28f2:	4c 01 63 08          	add    %r12,0x8(%rbx)
    28f6:	29 6b 04             	sub    %ebp,0x4(%rbx)
    28f9:	4c 89 e0             	mov    %r12,%rax
    28fc:	48 83 c4 08          	add    $0x8,%rsp
    2900:	5b                   	pop    %rbx
    2901:	5d                   	pop    %rbp
    2902:	41 5c                	pop    %r12
    2904:	41 5d                	pop    %r13
    2906:	c3                   	retq   

0000000000002907 <rio_readlineb>:
    2907:	41 55                	push   %r13
    2909:	41 54                	push   %r12
    290b:	55                   	push   %rbp
    290c:	53                   	push   %rbx
    290d:	48 83 ec 18          	sub    $0x18,%rsp
    2911:	49 89 fd             	mov    %rdi,%r13
    2914:	48 89 f5             	mov    %rsi,%rbp
    2917:	49 89 d4             	mov    %rdx,%r12
    291a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2921:	00 00 
    2923:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    2928:	31 c0                	xor    %eax,%eax
    292a:	bb 01 00 00 00       	mov    $0x1,%ebx
    292f:	eb 18                	jmp    2949 <rio_readlineb+0x42>
    2931:	85 c0                	test   %eax,%eax
    2933:	75 65                	jne    299a <rio_readlineb+0x93>
    2935:	48 83 fb 01          	cmp    $0x1,%rbx
    2939:	75 3d                	jne    2978 <rio_readlineb+0x71>
    293b:	b8 00 00 00 00       	mov    $0x0,%eax
    2940:	eb 3d                	jmp    297f <rio_readlineb+0x78>
    2942:	48 83 c3 01          	add    $0x1,%rbx
    2946:	48 89 d5             	mov    %rdx,%rbp
    2949:	4c 39 e3             	cmp    %r12,%rbx
    294c:	73 2a                	jae    2978 <rio_readlineb+0x71>
    294e:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
    2953:	ba 01 00 00 00       	mov    $0x1,%edx
    2958:	4c 89 ef             	mov    %r13,%rdi
    295b:	e8 20 ff ff ff       	callq  2880 <rio_read>
    2960:	83 f8 01             	cmp    $0x1,%eax
    2963:	75 cc                	jne    2931 <rio_readlineb+0x2a>
    2965:	48 8d 55 01          	lea    0x1(%rbp),%rdx
    2969:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
    296e:	88 45 00             	mov    %al,0x0(%rbp)
    2971:	3c 0a                	cmp    $0xa,%al
    2973:	75 cd                	jne    2942 <rio_readlineb+0x3b>
    2975:	48 89 d5             	mov    %rdx,%rbp
    2978:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
    297c:	48 89 d8             	mov    %rbx,%rax
    297f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    2984:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    298b:	00 00 
    298d:	75 14                	jne    29a3 <rio_readlineb+0x9c>
    298f:	48 83 c4 18          	add    $0x18,%rsp
    2993:	5b                   	pop    %rbx
    2994:	5d                   	pop    %rbp
    2995:	41 5c                	pop    %r12
    2997:	41 5d                	pop    %r13
    2999:	c3                   	retq   
    299a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    29a1:	eb dc                	jmp    297f <rio_readlineb+0x78>
    29a3:	e8 18 e9 ff ff       	callq  12c0 <__stack_chk_fail@plt>

00000000000029a8 <urlencode>:
    29a8:	41 54                	push   %r12
    29aa:	55                   	push   %rbp
    29ab:	53                   	push   %rbx
    29ac:	48 83 ec 10          	sub    $0x10,%rsp
    29b0:	48 89 fb             	mov    %rdi,%rbx
    29b3:	48 89 f5             	mov    %rsi,%rbp
    29b6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    29bd:	00 00 
    29bf:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    29c4:	31 c0                	xor    %eax,%eax
    29c6:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    29cd:	f2 ae                	repnz scas %es:(%rdi),%al
    29cf:	48 f7 d1             	not    %rcx
    29d2:	8d 41 ff             	lea    -0x1(%rcx),%eax
    29d5:	eb 0f                	jmp    29e6 <urlencode+0x3e>
    29d7:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    29db:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    29df:	48 83 c3 01          	add    $0x1,%rbx
    29e3:	44 89 e0             	mov    %r12d,%eax
    29e6:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
    29ea:	85 c0                	test   %eax,%eax
    29ec:	0f 84 a8 00 00 00    	je     2a9a <urlencode+0xf2>
    29f2:	44 0f b6 03          	movzbl (%rbx),%r8d
    29f6:	41 80 f8 2a          	cmp    $0x2a,%r8b
    29fa:	0f 94 c2             	sete   %dl
    29fd:	41 80 f8 2d          	cmp    $0x2d,%r8b
    2a01:	0f 94 c0             	sete   %al
    2a04:	08 c2                	or     %al,%dl
    2a06:	75 cf                	jne    29d7 <urlencode+0x2f>
    2a08:	41 80 f8 2e          	cmp    $0x2e,%r8b
    2a0c:	74 c9                	je     29d7 <urlencode+0x2f>
    2a0e:	41 80 f8 5f          	cmp    $0x5f,%r8b
    2a12:	74 c3                	je     29d7 <urlencode+0x2f>
    2a14:	41 8d 40 d0          	lea    -0x30(%r8),%eax
    2a18:	3c 09                	cmp    $0x9,%al
    2a1a:	76 bb                	jbe    29d7 <urlencode+0x2f>
    2a1c:	41 8d 40 bf          	lea    -0x41(%r8),%eax
    2a20:	3c 19                	cmp    $0x19,%al
    2a22:	76 b3                	jbe    29d7 <urlencode+0x2f>
    2a24:	41 8d 40 9f          	lea    -0x61(%r8),%eax
    2a28:	3c 19                	cmp    $0x19,%al
    2a2a:	76 ab                	jbe    29d7 <urlencode+0x2f>
    2a2c:	41 80 f8 20          	cmp    $0x20,%r8b
    2a30:	74 56                	je     2a88 <urlencode+0xe0>
    2a32:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    2a36:	3c 5f                	cmp    $0x5f,%al
    2a38:	0f 96 c2             	setbe  %dl
    2a3b:	41 80 f8 09          	cmp    $0x9,%r8b
    2a3f:	0f 94 c0             	sete   %al
    2a42:	08 c2                	or     %al,%dl
    2a44:	74 4f                	je     2a95 <urlencode+0xed>
    2a46:	48 89 e7             	mov    %rsp,%rdi
    2a49:	45 0f b6 c0          	movzbl %r8b,%r8d
    2a4d:	48 8d 0d a1 1d 00 00 	lea    0x1da1(%rip),%rcx        # 47f5 <trans_char+0xa5>
    2a54:	ba 08 00 00 00       	mov    $0x8,%edx
    2a59:	be 01 00 00 00       	mov    $0x1,%esi
    2a5e:	b8 00 00 00 00       	mov    $0x0,%eax
    2a63:	e8 d8 e9 ff ff       	callq  1440 <__sprintf_chk@plt>
    2a68:	0f b6 04 24          	movzbl (%rsp),%eax
    2a6c:	88 45 00             	mov    %al,0x0(%rbp)
    2a6f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    2a74:	88 45 01             	mov    %al,0x1(%rbp)
    2a77:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
    2a7c:	88 45 02             	mov    %al,0x2(%rbp)
    2a7f:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    2a83:	e9 57 ff ff ff       	jmpq   29df <urlencode+0x37>
    2a88:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    2a8c:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2a90:	e9 4a ff ff ff       	jmpq   29df <urlencode+0x37>
    2a95:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2a9a:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    2a9f:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    2aa6:	00 00 
    2aa8:	75 09                	jne    2ab3 <urlencode+0x10b>
    2aaa:	48 83 c4 10          	add    $0x10,%rsp
    2aae:	5b                   	pop    %rbx
    2aaf:	5d                   	pop    %rbp
    2ab0:	41 5c                	pop    %r12
    2ab2:	c3                   	retq   
    2ab3:	e8 08 e8 ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000002ab8 <submitr>:
    2ab8:	f3 0f 1e fa          	endbr64 
    2abc:	41 57                	push   %r15
    2abe:	41 56                	push   %r14
    2ac0:	41 55                	push   %r13
    2ac2:	41 54                	push   %r12
    2ac4:	55                   	push   %rbp
    2ac5:	53                   	push   %rbx
    2ac6:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    2acd:	ff 
    2ace:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2ad5:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    2ada:	4c 39 dc             	cmp    %r11,%rsp
    2add:	75 ef                	jne    2ace <submitr+0x16>
    2adf:	48 83 ec 68          	sub    $0x68,%rsp
    2ae3:	49 89 fc             	mov    %rdi,%r12
    2ae6:	89 74 24 14          	mov    %esi,0x14(%rsp)
    2aea:	49 89 d6             	mov    %rdx,%r14
    2aed:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    2af2:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    2af7:	4d 89 cd             	mov    %r9,%r13
    2afa:	48 8b ac 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbp
    2b01:	00 
    2b02:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2b09:	00 00 
    2b0b:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    2b12:	00 
    2b13:	31 c0                	xor    %eax,%eax
    2b15:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    2b1c:	00 
    2b1d:	ba 00 00 00 00       	mov    $0x0,%edx
    2b22:	be 01 00 00 00       	mov    $0x1,%esi
    2b27:	bf 02 00 00 00       	mov    $0x2,%edi
    2b2c:	e8 1f e9 ff ff       	callq  1450 <socket@plt>
    2b31:	85 c0                	test   %eax,%eax
    2b33:	0f 88 a0 02 00 00    	js     2dd9 <submitr+0x321>
    2b39:	89 c3                	mov    %eax,%ebx
    2b3b:	4c 89 e7             	mov    %r12,%rdi
    2b3e:	e8 ed e7 ff ff       	callq  1330 <gethostbyname@plt>
    2b43:	48 85 c0             	test   %rax,%rax
    2b46:	0f 84 d9 02 00 00    	je     2e25 <submitr+0x36d>
    2b4c:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
    2b51:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    2b58:	00 00 
    2b5a:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    2b61:	00 00 
    2b63:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    2b6a:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2b6e:	48 8b 40 18          	mov    0x18(%rax),%rax
    2b72:	48 8b 30             	mov    (%rax),%rsi
    2b75:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    2b7a:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2b7f:	e8 bc e7 ff ff       	callq  1340 <__memmove_chk@plt>
    2b84:	0f b7 74 24 14       	movzwl 0x14(%rsp),%esi
    2b89:	66 c1 c6 08          	rol    $0x8,%si
    2b8d:	66 89 74 24 32       	mov    %si,0x32(%rsp)
    2b92:	ba 10 00 00 00       	mov    $0x10,%edx
    2b97:	4c 89 fe             	mov    %r15,%rsi
    2b9a:	89 df                	mov    %ebx,%edi
    2b9c:	e8 6f e8 ff ff       	callq  1410 <connect@plt>
    2ba1:	85 c0                	test   %eax,%eax
    2ba3:	0f 88 e4 02 00 00    	js     2e8d <submitr+0x3d5>
    2ba9:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
    2bb0:	b8 00 00 00 00       	mov    $0x0,%eax
    2bb5:	4c 89 c1             	mov    %r8,%rcx
    2bb8:	4c 89 ef             	mov    %r13,%rdi
    2bbb:	f2 ae                	repnz scas %es:(%rdi),%al
    2bbd:	48 89 ca             	mov    %rcx,%rdx
    2bc0:	48 f7 d2             	not    %rdx
    2bc3:	4c 89 c1             	mov    %r8,%rcx
    2bc6:	4c 89 f7             	mov    %r14,%rdi
    2bc9:	f2 ae                	repnz scas %es:(%rdi),%al
    2bcb:	48 f7 d1             	not    %rcx
    2bce:	48 89 ce             	mov    %rcx,%rsi
    2bd1:	4c 89 c1             	mov    %r8,%rcx
    2bd4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    2bd9:	f2 ae                	repnz scas %es:(%rdi),%al
    2bdb:	48 f7 d1             	not    %rcx
    2bde:	48 8d 74 0e fe       	lea    -0x2(%rsi,%rcx,1),%rsi
    2be3:	4c 89 c1             	mov    %r8,%rcx
    2be6:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    2beb:	f2 ae                	repnz scas %es:(%rdi),%al
    2bed:	48 89 c8             	mov    %rcx,%rax
    2bf0:	48 f7 d0             	not    %rax
    2bf3:	48 8d 4c 06 ff       	lea    -0x1(%rsi,%rax,1),%rcx
    2bf8:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
    2bfd:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
    2c04:	00 
    2c05:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    2c0b:	0f 87 d6 02 00 00    	ja     2ee7 <submitr+0x42f>
    2c11:	48 8d b4 24 50 40 00 	lea    0x4050(%rsp),%rsi
    2c18:	00 
    2c19:	b9 00 04 00 00       	mov    $0x400,%ecx
    2c1e:	b8 00 00 00 00       	mov    $0x0,%eax
    2c23:	48 89 f7             	mov    %rsi,%rdi
    2c26:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    2c29:	4c 89 ef             	mov    %r13,%rdi
    2c2c:	e8 77 fd ff ff       	callq  29a8 <urlencode>
    2c31:	85 c0                	test   %eax,%eax
    2c33:	0f 88 21 03 00 00    	js     2f5a <submitr+0x4a2>
    2c39:	4c 8d bc 24 50 20 00 	lea    0x2050(%rsp),%r15
    2c40:	00 
    2c41:	41 54                	push   %r12
    2c43:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
    2c4a:	00 
    2c4b:	50                   	push   %rax
    2c4c:	4d 89 f1             	mov    %r14,%r9
    2c4f:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
    2c54:	48 8d 0d 2d 1b 00 00 	lea    0x1b2d(%rip),%rcx        # 4788 <trans_char+0x38>
    2c5b:	ba 00 20 00 00       	mov    $0x2000,%edx
    2c60:	be 01 00 00 00       	mov    $0x1,%esi
    2c65:	4c 89 ff             	mov    %r15,%rdi
    2c68:	b8 00 00 00 00       	mov    $0x0,%eax
    2c6d:	e8 ce e7 ff ff       	callq  1440 <__sprintf_chk@plt>
    2c72:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2c79:	b8 00 00 00 00       	mov    $0x0,%eax
    2c7e:	4c 89 ff             	mov    %r15,%rdi
    2c81:	f2 ae                	repnz scas %es:(%rdi),%al
    2c83:	48 f7 d1             	not    %rcx
    2c86:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    2c8a:	4c 89 fe             	mov    %r15,%rsi
    2c8d:	89 df                	mov    %ebx,%edi
    2c8f:	e8 8e fb ff ff       	callq  2822 <rio_writen>
    2c94:	48 83 c4 10          	add    $0x10,%rsp
    2c98:	48 85 c0             	test   %rax,%rax
    2c9b:	0f 88 44 03 00 00    	js     2fe5 <submitr+0x52d>
    2ca1:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    2ca6:	89 de                	mov    %ebx,%esi
    2ca8:	4c 89 e7             	mov    %r12,%rdi
    2cab:	e8 2a fb ff ff       	callq  27da <rio_readinitb>
    2cb0:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2cb7:	00 
    2cb8:	ba 00 20 00 00       	mov    $0x2000,%edx
    2cbd:	4c 89 e7             	mov    %r12,%rdi
    2cc0:	e8 42 fc ff ff       	callq  2907 <rio_readlineb>
    2cc5:	48 85 c0             	test   %rax,%rax
    2cc8:	0f 8e 86 03 00 00    	jle    3054 <submitr+0x59c>
    2cce:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    2cd3:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    2cda:	00 
    2cdb:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    2ce2:	00 
    2ce3:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    2cea:	00 
    2ceb:	48 8d 35 0a 1b 00 00 	lea    0x1b0a(%rip),%rsi        # 47fc <trans_char+0xac>
    2cf2:	b8 00 00 00 00       	mov    $0x0,%eax
    2cf7:	e8 94 e6 ff ff       	callq  1390 <__isoc99_sscanf@plt>
    2cfc:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2d03:	00 
    2d04:	b9 03 00 00 00       	mov    $0x3,%ecx
    2d09:	48 8d 3d 03 1b 00 00 	lea    0x1b03(%rip),%rdi        # 4813 <trans_char+0xc3>
    2d10:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2d12:	0f 97 c0             	seta   %al
    2d15:	1c 00                	sbb    $0x0,%al
    2d17:	84 c0                	test   %al,%al
    2d19:	0f 84 b3 03 00 00    	je     30d2 <submitr+0x61a>
    2d1f:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2d26:	00 
    2d27:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2d2c:	ba 00 20 00 00       	mov    $0x2000,%edx
    2d31:	e8 d1 fb ff ff       	callq  2907 <rio_readlineb>
    2d36:	48 85 c0             	test   %rax,%rax
    2d39:	7f c1                	jg     2cfc <submitr+0x244>
    2d3b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2d42:	3a 20 43 
    2d45:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2d4c:	20 75 6e 
    2d4f:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2d53:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2d57:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2d5e:	74 6f 20 
    2d61:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2d68:	68 65 61 
    2d6b:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2d6f:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2d73:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    2d7a:	66 72 6f 
    2d7d:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
    2d84:	20 72 65 
    2d87:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2d8b:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2d8f:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
    2d96:	73 65 72 
    2d99:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2d9d:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
    2da4:	89 df                	mov    %ebx,%edi
    2da6:	e8 55 e5 ff ff       	callq  1300 <close@plt>
    2dab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2db0:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
    2db7:	00 
    2db8:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
    2dbf:	00 00 
    2dc1:	0f 85 7e 04 00 00    	jne    3245 <submitr+0x78d>
    2dc7:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    2dce:	5b                   	pop    %rbx
    2dcf:	5d                   	pop    %rbp
    2dd0:	41 5c                	pop    %r12
    2dd2:	41 5d                	pop    %r13
    2dd4:	41 5e                	pop    %r14
    2dd6:	41 5f                	pop    %r15
    2dd8:	c3                   	retq   
    2dd9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2de0:	3a 20 43 
    2de3:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2dea:	20 75 6e 
    2ded:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2df1:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2df5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2dfc:	74 6f 20 
    2dff:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2e06:	65 20 73 
    2e09:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2e0d:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2e11:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2e18:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2e1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2e23:	eb 8b                	jmp    2db0 <submitr+0x2f8>
    2e25:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2e2c:	3a 20 44 
    2e2f:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2e36:	20 75 6e 
    2e39:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2e3d:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2e41:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2e48:	74 6f 20 
    2e4b:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2e52:	76 65 20 
    2e55:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2e59:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2e5d:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2e64:	72 20 61 
    2e67:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2e6b:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    2e72:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    2e78:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    2e7c:	89 df                	mov    %ebx,%edi
    2e7e:	e8 7d e4 ff ff       	callq  1300 <close@plt>
    2e83:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2e88:	e9 23 ff ff ff       	jmpq   2db0 <submitr+0x2f8>
    2e8d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    2e94:	3a 20 55 
    2e97:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    2e9e:	20 74 6f 
    2ea1:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2ea5:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2ea9:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    2eb0:	65 63 74 
    2eb3:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    2eba:	68 65 20 
    2ebd:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2ec1:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2ec5:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
    2ecc:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
    2ed2:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
    2ed6:	89 df                	mov    %ebx,%edi
    2ed8:	e8 23 e4 ff ff       	callq  1300 <close@plt>
    2edd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ee2:	e9 c9 fe ff ff       	jmpq   2db0 <submitr+0x2f8>
    2ee7:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2eee:	3a 20 52 
    2ef1:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2ef8:	20 73 74 
    2efb:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2eff:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2f03:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    2f0a:	74 6f 6f 
    2f0d:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    2f14:	65 2e 20 
    2f17:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2f1b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2f1f:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    2f26:	61 73 65 
    2f29:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    2f30:	49 54 52 
    2f33:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2f37:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2f3b:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    2f42:	55 46 00 
    2f45:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2f49:	89 df                	mov    %ebx,%edi
    2f4b:	e8 b0 e3 ff ff       	callq  1300 <close@plt>
    2f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f55:	e9 56 fe ff ff       	jmpq   2db0 <submitr+0x2f8>
    2f5a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2f61:	3a 20 52 
    2f64:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2f6b:	20 73 74 
    2f6e:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2f72:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2f76:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    2f7d:	63 6f 6e 
    2f80:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    2f87:	20 61 6e 
    2f8a:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2f8e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2f92:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2f99:	67 61 6c 
    2f9c:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    2fa3:	6e 70 72 
    2fa6:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2faa:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2fae:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    2fb5:	6c 65 20 
    2fb8:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    2fbf:	63 74 65 
    2fc2:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2fc6:	48 89 55 38          	mov    %rdx,0x38(%rbp)
    2fca:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
    2fd0:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
    2fd4:	89 df                	mov    %ebx,%edi
    2fd6:	e8 25 e3 ff ff       	callq  1300 <close@plt>
    2fdb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fe0:	e9 cb fd ff ff       	jmpq   2db0 <submitr+0x2f8>
    2fe5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2fec:	3a 20 43 
    2fef:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2ff6:	20 75 6e 
    2ff9:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2ffd:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3001:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    3008:	74 6f 20 
    300b:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    3012:	20 74 6f 
    3015:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3019:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    301d:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
    3024:	72 65 73 
    3027:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
    302e:	65 72 76 
    3031:	48 89 45 20          	mov    %rax,0x20(%rbp)
    3035:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    3039:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
    303f:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
    3043:	89 df                	mov    %ebx,%edi
    3045:	e8 b6 e2 ff ff       	callq  1300 <close@plt>
    304a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    304f:	e9 5c fd ff ff       	jmpq   2db0 <submitr+0x2f8>
    3054:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    305b:	3a 20 43 
    305e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    3065:	20 75 6e 
    3068:	48 89 45 00          	mov    %rax,0x0(%rbp)
    306c:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3070:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    3077:	74 6f 20 
    307a:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    3081:	66 69 72 
    3084:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3088:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    308c:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    3093:	61 64 65 
    3096:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
    309d:	6d 20 72 
    30a0:	48 89 45 20          	mov    %rax,0x20(%rbp)
    30a4:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    30a8:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
    30af:	20 73 65 
    30b2:	48 89 45 30          	mov    %rax,0x30(%rbp)
    30b6:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
    30bd:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
    30c1:	89 df                	mov    %ebx,%edi
    30c3:	e8 38 e2 ff ff       	callq  1300 <close@plt>
    30c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    30cd:	e9 de fc ff ff       	jmpq   2db0 <submitr+0x2f8>
    30d2:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    30d9:	00 
    30da:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    30df:	ba 00 20 00 00       	mov    $0x2000,%edx
    30e4:	e8 1e f8 ff ff       	callq  2907 <rio_readlineb>
    30e9:	48 85 c0             	test   %rax,%rax
    30ec:	0f 8e 96 00 00 00    	jle    3188 <submitr+0x6d0>
    30f2:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    30f7:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    30fe:	0f 85 08 01 00 00    	jne    320c <submitr+0x754>
    3104:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    310b:	00 
    310c:	48 89 ef             	mov    %rbp,%rdi
    310f:	e8 7c e1 ff ff       	callq  1290 <strcpy@plt>
    3114:	89 df                	mov    %ebx,%edi
    3116:	e8 e5 e1 ff ff       	callq  1300 <close@plt>
    311b:	b9 04 00 00 00       	mov    $0x4,%ecx
    3120:	48 8d 3d e6 16 00 00 	lea    0x16e6(%rip),%rdi        # 480d <trans_char+0xbd>
    3127:	48 89 ee             	mov    %rbp,%rsi
    312a:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    312c:	0f 97 c0             	seta   %al
    312f:	1c 00                	sbb    $0x0,%al
    3131:	0f be c0             	movsbl %al,%eax
    3134:	85 c0                	test   %eax,%eax
    3136:	0f 84 74 fc ff ff    	je     2db0 <submitr+0x2f8>
    313c:	b9 05 00 00 00       	mov    $0x5,%ecx
    3141:	48 8d 3d c9 16 00 00 	lea    0x16c9(%rip),%rdi        # 4811 <trans_char+0xc1>
    3148:	48 89 ee             	mov    %rbp,%rsi
    314b:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    314d:	0f 97 c0             	seta   %al
    3150:	1c 00                	sbb    $0x0,%al
    3152:	0f be c0             	movsbl %al,%eax
    3155:	85 c0                	test   %eax,%eax
    3157:	0f 84 53 fc ff ff    	je     2db0 <submitr+0x2f8>
    315d:	b9 03 00 00 00       	mov    $0x3,%ecx
    3162:	48 8d 3d ad 16 00 00 	lea    0x16ad(%rip),%rdi        # 4816 <trans_char+0xc6>
    3169:	48 89 ee             	mov    %rbp,%rsi
    316c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    316e:	0f 97 c0             	seta   %al
    3171:	1c 00                	sbb    $0x0,%al
    3173:	0f be c0             	movsbl %al,%eax
    3176:	85 c0                	test   %eax,%eax
    3178:	0f 84 32 fc ff ff    	je     2db0 <submitr+0x2f8>
    317e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3183:	e9 28 fc ff ff       	jmpq   2db0 <submitr+0x2f8>
    3188:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    318f:	3a 20 43 
    3192:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    3199:	20 75 6e 
    319c:	48 89 45 00          	mov    %rax,0x0(%rbp)
    31a0:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    31a4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    31ab:	74 6f 20 
    31ae:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    31b5:	73 74 61 
    31b8:	48 89 45 10          	mov    %rax,0x10(%rbp)
    31bc:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    31c0:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    31c7:	65 73 73 
    31ca:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    31d1:	72 6f 6d 
    31d4:	48 89 45 20          	mov    %rax,0x20(%rbp)
    31d8:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    31dc:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
    31e3:	6c 74 20 
    31e6:	48 89 45 30          	mov    %rax,0x30(%rbp)
    31ea:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
    31f1:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
    31f7:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
    31fb:	89 df                	mov    %ebx,%edi
    31fd:	e8 fe e0 ff ff       	callq  1300 <close@plt>
    3202:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3207:	e9 a4 fb ff ff       	jmpq   2db0 <submitr+0x2f8>
    320c:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    3213:	00 
    3214:	48 8d 0d ad 15 00 00 	lea    0x15ad(%rip),%rcx        # 47c8 <trans_char+0x78>
    321b:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    3222:	be 01 00 00 00       	mov    $0x1,%esi
    3227:	48 89 ef             	mov    %rbp,%rdi
    322a:	b8 00 00 00 00       	mov    $0x0,%eax
    322f:	e8 0c e2 ff ff       	callq  1440 <__sprintf_chk@plt>
    3234:	89 df                	mov    %ebx,%edi
    3236:	e8 c5 e0 ff ff       	callq  1300 <close@plt>
    323b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3240:	e9 6b fb ff ff       	jmpq   2db0 <submitr+0x2f8>
    3245:	e8 76 e0 ff ff       	callq  12c0 <__stack_chk_fail@plt>

000000000000324a <init_timeout>:
    324a:	f3 0f 1e fa          	endbr64 
    324e:	85 ff                	test   %edi,%edi
    3250:	74 26                	je     3278 <init_timeout+0x2e>
    3252:	53                   	push   %rbx
    3253:	89 fb                	mov    %edi,%ebx
    3255:	78 1a                	js     3271 <init_timeout+0x27>
    3257:	48 8d 35 8e f5 ff ff 	lea    -0xa72(%rip),%rsi        # 27ec <sigalrm_handler>
    325e:	bf 0e 00 00 00       	mov    $0xe,%edi
    3263:	e8 b8 e0 ff ff       	callq  1320 <signal@plt>
    3268:	89 df                	mov    %ebx,%edi
    326a:	e8 81 e0 ff ff       	callq  12f0 <alarm@plt>
    326f:	5b                   	pop    %rbx
    3270:	c3                   	retq   
    3271:	bb 00 00 00 00       	mov    $0x0,%ebx
    3276:	eb df                	jmp    3257 <init_timeout+0xd>
    3278:	c3                   	retq   

0000000000003279 <init_driver>:
    3279:	f3 0f 1e fa          	endbr64 
    327d:	41 54                	push   %r12
    327f:	55                   	push   %rbp
    3280:	53                   	push   %rbx
    3281:	48 83 ec 20          	sub    $0x20,%rsp
    3285:	48 89 fd             	mov    %rdi,%rbp
    3288:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    328f:	00 00 
    3291:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    3296:	31 c0                	xor    %eax,%eax
    3298:	be 01 00 00 00       	mov    $0x1,%esi
    329d:	bf 0d 00 00 00       	mov    $0xd,%edi
    32a2:	e8 79 e0 ff ff       	callq  1320 <signal@plt>
    32a7:	be 01 00 00 00       	mov    $0x1,%esi
    32ac:	bf 1d 00 00 00       	mov    $0x1d,%edi
    32b1:	e8 6a e0 ff ff       	callq  1320 <signal@plt>
    32b6:	be 01 00 00 00       	mov    $0x1,%esi
    32bb:	bf 1d 00 00 00       	mov    $0x1d,%edi
    32c0:	e8 5b e0 ff ff       	callq  1320 <signal@plt>
    32c5:	ba 00 00 00 00       	mov    $0x0,%edx
    32ca:	be 01 00 00 00       	mov    $0x1,%esi
    32cf:	bf 02 00 00 00       	mov    $0x2,%edi
    32d4:	e8 77 e1 ff ff       	callq  1450 <socket@plt>
    32d9:	85 c0                	test   %eax,%eax
    32db:	0f 88 9c 00 00 00    	js     337d <init_driver+0x104>
    32e1:	89 c3                	mov    %eax,%ebx
    32e3:	48 8d 3d 10 10 00 00 	lea    0x1010(%rip),%rdi        # 42fa <_IO_stdin_used+0x2fa>
    32ea:	e8 41 e0 ff ff       	callq  1330 <gethostbyname@plt>
    32ef:	48 85 c0             	test   %rax,%rax
    32f2:	0f 84 d1 00 00 00    	je     33c9 <init_driver+0x150>
    32f8:	49 89 e4             	mov    %rsp,%r12
    32fb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    3302:	00 
    3303:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    330a:	00 00 
    330c:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    3312:	48 63 50 14          	movslq 0x14(%rax),%rdx
    3316:	48 8b 40 18          	mov    0x18(%rax),%rax
    331a:	48 8b 30             	mov    (%rax),%rsi
    331d:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    3322:	b9 0c 00 00 00       	mov    $0xc,%ecx
    3327:	e8 14 e0 ff ff       	callq  1340 <__memmove_chk@plt>
    332c:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
    3333:	ba 10 00 00 00       	mov    $0x10,%edx
    3338:	4c 89 e6             	mov    %r12,%rsi
    333b:	89 df                	mov    %ebx,%edi
    333d:	e8 ce e0 ff ff       	callq  1410 <connect@plt>
    3342:	85 c0                	test   %eax,%eax
    3344:	0f 88 e7 00 00 00    	js     3431 <init_driver+0x1b8>
    334a:	89 df                	mov    %ebx,%edi
    334c:	e8 af df ff ff       	callq  1300 <close@plt>
    3351:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    3357:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    335b:	b8 00 00 00 00       	mov    $0x0,%eax
    3360:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    3365:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    336c:	00 00 
    336e:	0f 85 10 01 00 00    	jne    3484 <init_driver+0x20b>
    3374:	48 83 c4 20          	add    $0x20,%rsp
    3378:	5b                   	pop    %rbx
    3379:	5d                   	pop    %rbp
    337a:	41 5c                	pop    %r12
    337c:	c3                   	retq   
    337d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    3384:	3a 20 43 
    3387:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    338e:	20 75 6e 
    3391:	48 89 45 00          	mov    %rax,0x0(%rbp)
    3395:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3399:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    33a0:	74 6f 20 
    33a3:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    33aa:	65 20 73 
    33ad:	48 89 45 10          	mov    %rax,0x10(%rbp)
    33b1:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    33b5:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    33bc:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    33c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    33c7:	eb 97                	jmp    3360 <init_driver+0xe7>
    33c9:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    33d0:	3a 20 44 
    33d3:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    33da:	20 75 6e 
    33dd:	48 89 45 00          	mov    %rax,0x0(%rbp)
    33e1:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    33e5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    33ec:	74 6f 20 
    33ef:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    33f6:	76 65 20 
    33f9:	48 89 45 10          	mov    %rax,0x10(%rbp)
    33fd:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3401:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    3408:	72 20 61 
    340b:	48 89 45 20          	mov    %rax,0x20(%rbp)
    340f:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    3416:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    341c:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    3420:	89 df                	mov    %ebx,%edi
    3422:	e8 d9 de ff ff       	callq  1300 <close@plt>
    3427:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    342c:	e9 2f ff ff ff       	jmpq   3360 <init_driver+0xe7>
    3431:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    3438:	3a 20 55 
    343b:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    3442:	20 74 6f 
    3445:	48 89 45 00          	mov    %rax,0x0(%rbp)
    3449:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    344d:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    3454:	65 63 74 
    3457:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
    345e:	65 72 76 
    3461:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3465:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3469:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
    346f:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
    3473:	89 df                	mov    %ebx,%edi
    3475:	e8 86 de ff ff       	callq  1300 <close@plt>
    347a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    347f:	e9 dc fe ff ff       	jmpq   3360 <init_driver+0xe7>
    3484:	e8 37 de ff ff       	callq  12c0 <__stack_chk_fail@plt>

0000000000003489 <driver_post>:
    3489:	f3 0f 1e fa          	endbr64 
    348d:	53                   	push   %rbx
    348e:	4c 89 cb             	mov    %r9,%rbx
    3491:	45 85 c0             	test   %r8d,%r8d
    3494:	75 18                	jne    34ae <driver_post+0x25>
    3496:	48 85 ff             	test   %rdi,%rdi
    3499:	74 05                	je     34a0 <driver_post+0x17>
    349b:	80 3f 00             	cmpb   $0x0,(%rdi)
    349e:	75 37                	jne    34d7 <driver_post+0x4e>
    34a0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    34a5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    34a9:	44 89 c0             	mov    %r8d,%eax
    34ac:	5b                   	pop    %rbx
    34ad:	c3                   	retq   
    34ae:	48 89 ca             	mov    %rcx,%rdx
    34b1:	48 8d 35 61 13 00 00 	lea    0x1361(%rip),%rsi        # 4819 <trans_char+0xc9>
    34b8:	bf 01 00 00 00       	mov    $0x1,%edi
    34bd:	b8 00 00 00 00       	mov    $0x0,%eax
    34c2:	e8 e9 de ff ff       	callq  13b0 <__printf_chk@plt>
    34c7:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    34cc:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    34d0:	b8 00 00 00 00       	mov    $0x0,%eax
    34d5:	eb d5                	jmp    34ac <driver_post+0x23>
    34d7:	48 83 ec 08          	sub    $0x8,%rsp
    34db:	41 51                	push   %r9
    34dd:	49 89 c9             	mov    %rcx,%r9
    34e0:	49 89 d0             	mov    %rdx,%r8
    34e3:	48 89 f9             	mov    %rdi,%rcx
    34e6:	48 89 f2             	mov    %rsi,%rdx
    34e9:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
    34ee:	48 8d 3d 05 0e 00 00 	lea    0xe05(%rip),%rdi        # 42fa <_IO_stdin_used+0x2fa>
    34f5:	e8 be f5 ff ff       	callq  2ab8 <submitr>
    34fa:	48 83 c4 10          	add    $0x10,%rsp
    34fe:	eb ac                	jmp    34ac <driver_post+0x23>

0000000000003500 <check>:
    3500:	f3 0f 1e fa          	endbr64 
    3504:	89 f8                	mov    %edi,%eax
    3506:	c1 e8 1c             	shr    $0x1c,%eax
    3509:	74 1d                	je     3528 <check+0x28>
    350b:	b9 00 00 00 00       	mov    $0x0,%ecx
    3510:	83 f9 1f             	cmp    $0x1f,%ecx
    3513:	7f 0d                	jg     3522 <check+0x22>
    3515:	89 f8                	mov    %edi,%eax
    3517:	d3 e8                	shr    %cl,%eax
    3519:	3c 0a                	cmp    $0xa,%al
    351b:	74 11                	je     352e <check+0x2e>
    351d:	83 c1 08             	add    $0x8,%ecx
    3520:	eb ee                	jmp    3510 <check+0x10>
    3522:	b8 01 00 00 00       	mov    $0x1,%eax
    3527:	c3                   	retq   
    3528:	b8 00 00 00 00       	mov    $0x0,%eax
    352d:	c3                   	retq   
    352e:	b8 00 00 00 00       	mov    $0x0,%eax
    3533:	c3                   	retq   

0000000000003534 <gencookie>:
    3534:	f3 0f 1e fa          	endbr64 
    3538:	53                   	push   %rbx
    3539:	83 c7 01             	add    $0x1,%edi
    353c:	e8 2f dd ff ff       	callq  1270 <srandom@plt>
    3541:	e8 3a de ff ff       	callq  1380 <random@plt>
    3546:	48 89 c7             	mov    %rax,%rdi
    3549:	89 c3                	mov    %eax,%ebx
    354b:	e8 b0 ff ff ff       	callq  3500 <check>
    3550:	85 c0                	test   %eax,%eax
    3552:	74 ed                	je     3541 <gencookie+0xd>
    3554:	89 d8                	mov    %ebx,%eax
    3556:	5b                   	pop    %rbx
    3557:	c3                   	retq   
    3558:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    355f:	00 

0000000000003560 <__libc_csu_init>:
    3560:	f3 0f 1e fa          	endbr64 
    3564:	41 57                	push   %r15
    3566:	4c 8d 3d 4b 37 00 00 	lea    0x374b(%rip),%r15        # 6cb8 <__frame_dummy_init_array_entry>
    356d:	41 56                	push   %r14
    356f:	49 89 d6             	mov    %rdx,%r14
    3572:	41 55                	push   %r13
    3574:	49 89 f5             	mov    %rsi,%r13
    3577:	41 54                	push   %r12
    3579:	41 89 fc             	mov    %edi,%r12d
    357c:	55                   	push   %rbp
    357d:	48 8d 2d 3c 37 00 00 	lea    0x373c(%rip),%rbp        # 6cc0 <__do_global_dtors_aux_fini_array_entry>
    3584:	53                   	push   %rbx
    3585:	4c 29 fd             	sub    %r15,%rbp
    3588:	48 83 ec 08          	sub    $0x8,%rsp
    358c:	e8 6f da ff ff       	callq  1000 <_init>
    3591:	48 c1 fd 03          	sar    $0x3,%rbp
    3595:	74 1f                	je     35b6 <__libc_csu_init+0x56>
    3597:	31 db                	xor    %ebx,%ebx
    3599:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    35a0:	4c 89 f2             	mov    %r14,%rdx
    35a3:	4c 89 ee             	mov    %r13,%rsi
    35a6:	44 89 e7             	mov    %r12d,%edi
    35a9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    35ad:	48 83 c3 01          	add    $0x1,%rbx
    35b1:	48 39 dd             	cmp    %rbx,%rbp
    35b4:	75 ea                	jne    35a0 <__libc_csu_init+0x40>
    35b6:	48 83 c4 08          	add    $0x8,%rsp
    35ba:	5b                   	pop    %rbx
    35bb:	5d                   	pop    %rbp
    35bc:	41 5c                	pop    %r12
    35be:	41 5d                	pop    %r13
    35c0:	41 5e                	pop    %r14
    35c2:	41 5f                	pop    %r15
    35c4:	c3                   	retq   
    35c5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    35cc:	00 00 00 00 

00000000000035d0 <__libc_csu_fini>:
    35d0:	f3 0f 1e fa          	endbr64 
    35d4:	c3                   	retq   

Disassembly of section .fini:

00000000000035d8 <_fini>:
    35d8:	f3 0f 1e fa          	endbr64 
    35dc:	48 83 ec 08          	sub    $0x8,%rsp
    35e0:	48 83 c4 08          	add    $0x8,%rsp
    35e4:	c3                   	retq   
