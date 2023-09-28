bomb:     file format elf64-x86-64

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 4f 00 00 	mov    0x4fd9(%rip),%rax        # 5fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 ca 4e 00 00    	pushq  0x4eca(%rip)        # 5ef0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 cb 4e 00 00 	bnd jmpq *0x4ecb(%rip)        # 5ef8 <_GLOBAL_OFFSET_TABLE_+0x10>
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

Disassembly of section .plt.got:

00000000000011e0 <__cxa_finalize@plt>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	f2 ff 25 0d 4e 00 00 	bnd jmpq *0x4e0d(%rip)        # 5ff8 <__cxa_finalize@GLIBC_2.2.5>
    11eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000011f0 <getenv@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 05 4d 00 00 	bnd jmpq *0x4d05(%rip)        # 5f00 <getenv@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001200 <strcasecmp@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 fd 4c 00 00 	bnd jmpq *0x4cfd(%rip)        # 5f08 <strcasecmp@GLIBC_2.2.5>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001210 <__errno_location@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 f5 4c 00 00 	bnd jmpq *0x4cf5(%rip)        # 5f10 <__errno_location@GLIBC_2.2.5>
    121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001220 <strcpy@plt>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	f2 ff 25 ed 4c 00 00 	bnd jmpq *0x4ced(%rip)        # 5f18 <strcpy@GLIBC_2.2.5>
    122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001230 <puts@plt>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	f2 ff 25 e5 4c 00 00 	bnd jmpq *0x4ce5(%rip)        # 5f20 <puts@GLIBC_2.2.5>
    123b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001240 <write@plt>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	f2 ff 25 dd 4c 00 00 	bnd jmpq *0x4cdd(%rip)        # 5f28 <write@GLIBC_2.2.5>
    124b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001250 <__stack_chk_fail@plt>:
    1250:	f3 0f 1e fa          	endbr64 
    1254:	f2 ff 25 d5 4c 00 00 	bnd jmpq *0x4cd5(%rip)        # 5f30 <__stack_chk_fail@GLIBC_2.4>
    125b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001260 <alarm@plt>:
    1260:	f3 0f 1e fa          	endbr64 
    1264:	f2 ff 25 cd 4c 00 00 	bnd jmpq *0x4ccd(%rip)        # 5f38 <alarm@GLIBC_2.2.5>
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001270 <close@plt>:
    1270:	f3 0f 1e fa          	endbr64 
    1274:	f2 ff 25 c5 4c 00 00 	bnd jmpq *0x4cc5(%rip)        # 5f40 <close@GLIBC_2.2.5>
    127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001280 <read@plt>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	f2 ff 25 bd 4c 00 00 	bnd jmpq *0x4cbd(%rip)        # 5f48 <read@GLIBC_2.2.5>
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001290 <fgets@plt>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	f2 ff 25 b5 4c 00 00 	bnd jmpq *0x4cb5(%rip)        # 5f50 <fgets@GLIBC_2.2.5>
    129b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012a0 <signal@plt>:
    12a0:	f3 0f 1e fa          	endbr64 
    12a4:	f2 ff 25 ad 4c 00 00 	bnd jmpq *0x4cad(%rip)        # 5f58 <signal@GLIBC_2.2.5>
    12ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012b0 <gethostbyname@plt>:
    12b0:	f3 0f 1e fa          	endbr64 
    12b4:	f2 ff 25 a5 4c 00 00 	bnd jmpq *0x4ca5(%rip)        # 5f60 <gethostbyname@GLIBC_2.2.5>
    12bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012c0 <__memmove_chk@plt>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	f2 ff 25 9d 4c 00 00 	bnd jmpq *0x4c9d(%rip)        # 5f68 <__memmove_chk@GLIBC_2.3.4>
    12cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012d0 <strtol@plt>:
    12d0:	f3 0f 1e fa          	endbr64 
    12d4:	f2 ff 25 95 4c 00 00 	bnd jmpq *0x4c95(%rip)        # 5f70 <strtol@GLIBC_2.2.5>
    12db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012e0 <fflush@plt>:
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	f2 ff 25 8d 4c 00 00 	bnd jmpq *0x4c8d(%rip)        # 5f78 <fflush@GLIBC_2.2.5>
    12eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012f0 <__isoc99_sscanf@plt>:
    12f0:	f3 0f 1e fa          	endbr64 
    12f4:	f2 ff 25 85 4c 00 00 	bnd jmpq *0x4c85(%rip)        # 5f80 <__isoc99_sscanf@GLIBC_2.7>
    12fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001300 <__printf_chk@plt>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	f2 ff 25 7d 4c 00 00 	bnd jmpq *0x4c7d(%rip)        # 5f88 <__printf_chk@GLIBC_2.3.4>
    130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001310 <fopen@plt>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	f2 ff 25 75 4c 00 00 	bnd jmpq *0x4c75(%rip)        # 5f90 <fopen@GLIBC_2.2.5>
    131b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001320 <gethostname@plt>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	f2 ff 25 6d 4c 00 00 	bnd jmpq *0x4c6d(%rip)        # 5f98 <gethostname@GLIBC_2.2.5>
    132b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001330 <exit@plt>:
    1330:	f3 0f 1e fa          	endbr64 
    1334:	f2 ff 25 65 4c 00 00 	bnd jmpq *0x4c65(%rip)        # 5fa0 <exit@GLIBC_2.2.5>
    133b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001340 <connect@plt>:
    1340:	f3 0f 1e fa          	endbr64 
    1344:	f2 ff 25 5d 4c 00 00 	bnd jmpq *0x4c5d(%rip)        # 5fa8 <connect@GLIBC_2.2.5>
    134b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001350 <__fprintf_chk@plt>:
    1350:	f3 0f 1e fa          	endbr64 
    1354:	f2 ff 25 55 4c 00 00 	bnd jmpq *0x4c55(%rip)        # 5fb0 <__fprintf_chk@GLIBC_2.3.4>
    135b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001360 <sleep@plt>:
    1360:	f3 0f 1e fa          	endbr64 
    1364:	f2 ff 25 4d 4c 00 00 	bnd jmpq *0x4c4d(%rip)        # 5fb8 <sleep@GLIBC_2.2.5>
    136b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001370 <__ctype_b_loc@plt>:
    1370:	f3 0f 1e fa          	endbr64 
    1374:	f2 ff 25 45 4c 00 00 	bnd jmpq *0x4c45(%rip)        # 5fc0 <__ctype_b_loc@GLIBC_2.3>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001380 <__sprintf_chk@plt>:
    1380:	f3 0f 1e fa          	endbr64 
    1384:	f2 ff 25 3d 4c 00 00 	bnd jmpq *0x4c3d(%rip)        # 5fc8 <__sprintf_chk@GLIBC_2.3.4>
    138b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001390 <socket@plt>:
    1390:	f3 0f 1e fa          	endbr64 
    1394:	f2 ff 25 35 4c 00 00 	bnd jmpq *0x4c35(%rip)        # 5fd0 <socket@GLIBC_2.2.5>
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000013a0 <_start>:
    13a0:	f3 0f 1e fa          	endbr64 
    13a4:	31 ed                	xor    %ebp,%ebp
    13a6:	49 89 d1             	mov    %rdx,%r9
    13a9:	5e                   	pop    %rsi
    13aa:	48 89 e2             	mov    %rsp,%rdx
    13ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13b1:	50                   	push   %rax
    13b2:	54                   	push   %rsp
    13b3:	4c 8d 05 76 1a 00 00 	lea    0x1a76(%rip),%r8        # 2e30 <__libc_csu_fini>
    13ba:	48 8d 0d ff 19 00 00 	lea    0x19ff(%rip),%rcx        # 2dc0 <__libc_csu_init>
    13c1:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1489 <main>
    13c8:	ff 15 12 4c 00 00    	callq  *0x4c12(%rip)        # 5fe0 <__libc_start_main@GLIBC_2.2.5>
    13ce:	f4                   	hlt    
    13cf:	90                   	nop

00000000000013d0 <deregister_tm_clones>:
    13d0:	48 8d 3d 49 52 00 00 	lea    0x5249(%rip),%rdi        # 6620 <stdout@@GLIBC_2.2.5>
    13d7:	48 8d 05 42 52 00 00 	lea    0x5242(%rip),%rax        # 6620 <stdout@@GLIBC_2.2.5>
    13de:	48 39 f8             	cmp    %rdi,%rax
    13e1:	74 15                	je     13f8 <deregister_tm_clones+0x28>
    13e3:	48 8b 05 ee 4b 00 00 	mov    0x4bee(%rip),%rax        # 5fd8 <_ITM_deregisterTMCloneTable>
    13ea:	48 85 c0             	test   %rax,%rax
    13ed:	74 09                	je     13f8 <deregister_tm_clones+0x28>
    13ef:	ff e0                	jmpq   *%rax
    13f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    13f8:	c3                   	retq   
    13f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001400 <register_tm_clones>:
    1400:	48 8d 3d 19 52 00 00 	lea    0x5219(%rip),%rdi        # 6620 <stdout@@GLIBC_2.2.5>
    1407:	48 8d 35 12 52 00 00 	lea    0x5212(%rip),%rsi        # 6620 <stdout@@GLIBC_2.2.5>
    140e:	48 29 fe             	sub    %rdi,%rsi
    1411:	48 89 f0             	mov    %rsi,%rax
    1414:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1418:	48 c1 f8 03          	sar    $0x3,%rax
    141c:	48 01 c6             	add    %rax,%rsi
    141f:	48 d1 fe             	sar    %rsi
    1422:	74 14                	je     1438 <register_tm_clones+0x38>
    1424:	48 8b 05 c5 4b 00 00 	mov    0x4bc5(%rip),%rax        # 5ff0 <_ITM_registerTMCloneTable>
    142b:	48 85 c0             	test   %rax,%rax
    142e:	74 08                	je     1438 <register_tm_clones+0x38>
    1430:	ff e0                	jmpq   *%rax
    1432:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1438:	c3                   	retq   
    1439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001440 <__do_global_dtors_aux>:
    1440:	f3 0f 1e fa          	endbr64 
    1444:	80 3d fd 51 00 00 00 	cmpb   $0x0,0x51fd(%rip)        # 6648 <completed.8061>
    144b:	75 2b                	jne    1478 <__do_global_dtors_aux+0x38>
    144d:	55                   	push   %rbp
    144e:	48 83 3d a2 4b 00 00 	cmpq   $0x0,0x4ba2(%rip)        # 5ff8 <__cxa_finalize@GLIBC_2.2.5>
    1455:	00 
    1456:	48 89 e5             	mov    %rsp,%rbp
    1459:	74 0c                	je     1467 <__do_global_dtors_aux+0x27>
    145b:	48 8b 3d a6 4b 00 00 	mov    0x4ba6(%rip),%rdi        # 6008 <__dso_handle>
    1462:	e8 79 fd ff ff       	callq  11e0 <__cxa_finalize@plt>
    1467:	e8 64 ff ff ff       	callq  13d0 <deregister_tm_clones>
    146c:	c6 05 d5 51 00 00 01 	movb   $0x1,0x51d5(%rip)        # 6648 <completed.8061>
    1473:	5d                   	pop    %rbp
    1474:	c3                   	retq   
    1475:	0f 1f 00             	nopl   (%rax)
    1478:	c3                   	retq   
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001480 <frame_dummy>:
    1480:	f3 0f 1e fa          	endbr64 
    1484:	e9 77 ff ff ff       	jmpq   1400 <register_tm_clones>

0000000000001489 <main>:
    1489:	f3 0f 1e fa          	endbr64 
    148d:	53                   	push   %rbx
    148e:	83 ff 01             	cmp    $0x1,%edi
    1491:	0f 84 f8 00 00 00    	je     158f <main+0x106>
    1497:	48 89 f3             	mov    %rsi,%rbx
    149a:	83 ff 02             	cmp    $0x2,%edi
    149d:	0f 85 21 01 00 00    	jne    15c4 <main+0x13b>
    14a3:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    14a7:	48 8d 35 56 1b 00 00 	lea    0x1b56(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    14ae:	e8 5d fe ff ff       	callq  1310 <fopen@plt>
    14b3:	48 89 05 96 51 00 00 	mov    %rax,0x5196(%rip)        # 6650 <infile>
    14ba:	48 85 c0             	test   %rax,%rax
    14bd:	0f 84 df 00 00 00    	je     15a2 <main+0x119>
    14c3:	e8 01 08 00 00       	callq  1cc9 <initialize_bomb>
    14c8:	48 8d 3d b9 1b 00 00 	lea    0x1bb9(%rip),%rdi        # 3088 <_IO_stdin_used+0x88>
    14cf:	e8 5c fd ff ff       	callq  1230 <puts@plt>
    14d4:	48 8d 3d ed 1b 00 00 	lea    0x1bed(%rip),%rdi        # 30c8 <_IO_stdin_used+0xc8>
    14db:	e8 50 fd ff ff       	callq  1230 <puts@plt>
    14e0:	e8 fe 0a 00 00       	callq  1fe3 <read_line>
    14e5:	48 89 c7             	mov    %rax,%rdi
    14e8:	e8 fa 00 00 00       	callq  15e7 <phase_1>
    14ed:	e8 38 0c 00 00       	callq  212a <phase_defused>
    14f2:	48 8d 3d ff 1b 00 00 	lea    0x1bff(%rip),%rdi        # 30f8 <_IO_stdin_used+0xf8>
    14f9:	e8 32 fd ff ff       	callq  1230 <puts@plt>
    14fe:	e8 e0 0a 00 00       	callq  1fe3 <read_line>
    1503:	48 89 c7             	mov    %rax,%rdi
    1506:	e8 00 01 00 00       	callq  160b <phase_2>
    150b:	e8 1a 0c 00 00       	callq  212a <phase_defused>
    1510:	48 8d 3d 26 1b 00 00 	lea    0x1b26(%rip),%rdi        # 303d <_IO_stdin_used+0x3d>
    1517:	e8 14 fd ff ff       	callq  1230 <puts@plt>
    151c:	e8 c2 0a 00 00       	callq  1fe3 <read_line>
    1521:	48 89 c7             	mov    %rax,%rdi
    1524:	e8 51 01 00 00       	callq  167a <phase_3>
    1529:	e8 fc 0b 00 00       	callq  212a <phase_defused>
    152e:	48 8d 3d 26 1b 00 00 	lea    0x1b26(%rip),%rdi        # 305b <_IO_stdin_used+0x5b>
    1535:	e8 f6 fc ff ff       	callq  1230 <puts@plt>
    153a:	e8 a4 0a 00 00       	callq  1fe3 <read_line>
    153f:	48 89 c7             	mov    %rax,%rdi
    1542:	e8 f2 01 00 00       	callq  1739 <phase_4>
    1547:	e8 de 0b 00 00       	callq  212a <phase_defused>
    154c:	48 8d 3d d5 1b 00 00 	lea    0x1bd5(%rip),%rdi        # 3128 <_IO_stdin_used+0x128>
    1553:	e8 d8 fc ff ff       	callq  1230 <puts@plt>
    1558:	e8 86 0a 00 00       	callq  1fe3 <read_line>
    155d:	48 89 c7             	mov    %rax,%rdi
    1560:	e8 a6 04 00 00       	callq  1a0b <phase_5>
    1565:	e8 c0 0b 00 00       	callq  212a <phase_defused>
    156a:	48 8d 3d f9 1a 00 00 	lea    0x1af9(%rip),%rdi        # 306a <_IO_stdin_used+0x6a>
    1571:	e8 ba fc ff ff       	callq  1230 <puts@plt>
    1576:	e8 68 0a 00 00       	callq  1fe3 <read_line>
    157b:	48 89 c7             	mov    %rax,%rdi
    157e:	e8 01 05 00 00       	callq  1a84 <phase_6>
    1583:	e8 a2 0b 00 00       	callq  212a <phase_defused>
    1588:	b8 00 00 00 00       	mov    $0x0,%eax
    158d:	5b                   	pop    %rbx
    158e:	c3                   	retq   
    158f:	48 8b 05 9a 50 00 00 	mov    0x509a(%rip),%rax        # 6630 <stdin@@GLIBC_2.2.5>
    1596:	48 89 05 b3 50 00 00 	mov    %rax,0x50b3(%rip)        # 6650 <infile>
    159d:	e9 21 ff ff ff       	jmpq   14c3 <main+0x3a>
    15a2:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    15a6:	48 8b 13             	mov    (%rbx),%rdx
    15a9:	48 8d 35 56 1a 00 00 	lea    0x1a56(%rip),%rsi        # 3006 <_IO_stdin_used+0x6>
    15b0:	bf 01 00 00 00       	mov    $0x1,%edi
    15b5:	e8 46 fd ff ff       	callq  1300 <__printf_chk@plt>
    15ba:	bf 08 00 00 00       	mov    $0x8,%edi
    15bf:	e8 6c fd ff ff       	callq  1330 <exit@plt>
    15c4:	48 8b 16             	mov    (%rsi),%rdx
    15c7:	48 8d 35 55 1a 00 00 	lea    0x1a55(%rip),%rsi        # 3023 <_IO_stdin_used+0x23>
    15ce:	bf 01 00 00 00       	mov    $0x1,%edi
    15d3:	b8 00 00 00 00       	mov    $0x0,%eax
    15d8:	e8 23 fd ff ff       	callq  1300 <__printf_chk@plt>
    15dd:	bf 08 00 00 00       	mov    $0x8,%edi
    15e2:	e8 49 fd ff ff       	callq  1330 <exit@plt>

00000000000015e7 <phase_1>:
    15e7:	f3 0f 1e fa          	endbr64 
    15eb:	48 83 ec 08          	sub    $0x8,%rsp
    15ef:	48 8d 35 5a 1b 00 00 	lea    0x1b5a(%rip),%rsi        # 3150 <_IO_stdin_used+0x150>
    15f6:	e8 6e 06 00 00       	callq  1c69 <strings_not_equal>
    15fb:	85 c0                	test   %eax,%eax
    15fd:	75 05                	jne    1604 <phase_1+0x1d>
    15ff:	48 83 c4 08          	add    $0x8,%rsp
    1603:	c3                   	retq   
    1604:	e8 53 09 00 00       	callq  1f5c <explode_bomb>
    1609:	eb f4                	jmp    15ff <phase_1+0x18>

000000000000160b <phase_2>:
    160b:	f3 0f 1e fa          	endbr64 
    160f:	55                   	push   %rbp
    1610:	53                   	push   %rbx
    1611:	48 83 ec 28          	sub    $0x28,%rsp
    1615:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    161c:	00 00 
    161e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1623:	31 c0                	xor    %eax,%eax
    1625:	48 89 e6             	mov    %rsp,%rsi
    1628:	e8 71 09 00 00       	callq  1f9e <read_six_numbers>
    162d:	83 3c 24 09          	cmpl   $0x9,(%rsp)
    1631:	7e 0a                	jle    163d <phase_2+0x32>
    1633:	48 89 e3             	mov    %rsp,%rbx
    1636:	48 8d 6c 24 14       	lea    0x14(%rsp),%rbp
    163b:	eb 15                	jmp    1652 <phase_2+0x47>
    163d:	e8 1a 09 00 00       	callq  1f5c <explode_bomb>
    1642:	eb ef                	jmp    1633 <phase_2+0x28>
    1644:	e8 13 09 00 00       	callq  1f5c <explode_bomb>
    1649:	48 83 c3 04          	add    $0x4,%rbx
    164d:	48 39 eb             	cmp    %rbp,%rbx
    1650:	74 0c                	je     165e <phase_2+0x53>
    1652:	8b 03                	mov    (%rbx),%eax
    1654:	83 c0 05             	add    $0x5,%eax
    1657:	39 43 04             	cmp    %eax,0x4(%rbx)
    165a:	74 ed                	je     1649 <phase_2+0x3e>
    165c:	eb e6                	jmp    1644 <phase_2+0x39>
    165e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1663:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    166a:	00 00 
    166c:	75 07                	jne    1675 <phase_2+0x6a>
    166e:	48 83 c4 28          	add    $0x28,%rsp
    1672:	5b                   	pop    %rbx
    1673:	5d                   	pop    %rbp
    1674:	c3                   	retq   
    1675:	e8 d6 fb ff ff       	callq  1250 <__stack_chk_fail@plt>

000000000000167a <phase_3>:
    167a:	f3 0f 1e fa          	endbr64 
    167e:	48 83 ec 18          	sub    $0x18,%rsp
    1682:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1689:	00 00 
    168b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1690:	31 c0                	xor    %eax,%eax
    1692:	48 8d 4c 24 03       	lea    0x3(%rsp),%rcx
    1697:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
    169c:	48 8d 35 23 1b 00 00 	lea    0x1b23(%rip),%rsi        # 31c6 <_IO_stdin_used+0x1c6>
    16a3:	e8 48 fc ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    16a8:	83 f8 01             	cmp    $0x1,%eax
    16ab:	7e 1c                	jle    16c9 <phase_3+0x4f>
    16ad:	83 7c 24 04 07       	cmpl   $0x7,0x4(%rsp)
    16b2:	77 66                	ja     171a <phase_3+0xa0>
    16b4:	8b 44 24 04          	mov    0x4(%rsp),%eax
    16b8:	48 8d 15 21 1b 00 00 	lea    0x1b21(%rip),%rdx        # 31e0 <_IO_stdin_used+0x1e0>
    16bf:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    16c3:	48 01 d0             	add    %rdx,%rax
    16c6:	3e ff e0             	notrack jmpq *%rax
    16c9:	e8 8e 08 00 00       	callq  1f5c <explode_bomb>
    16ce:	eb dd                	jmp    16ad <phase_3+0x33>
    16d0:	b8 61 00 00 00       	mov    $0x61,%eax
    16d5:	38 44 24 03          	cmp    %al,0x3(%rsp)
    16d9:	75 52                	jne    172d <phase_3+0xb3>
    16db:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    16e0:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    16e7:	00 00 
    16e9:	75 49                	jne    1734 <phase_3+0xba>
    16eb:	48 83 c4 18          	add    $0x18,%rsp
    16ef:	c3                   	retq   
    16f0:	b8 6d 00 00 00       	mov    $0x6d,%eax
    16f5:	eb de                	jmp    16d5 <phase_3+0x5b>
    16f7:	b8 6a 00 00 00       	mov    $0x6a,%eax
    16fc:	eb d7                	jmp    16d5 <phase_3+0x5b>
    16fe:	b8 76 00 00 00       	mov    $0x76,%eax
    1703:	eb d0                	jmp    16d5 <phase_3+0x5b>
    1705:	b8 7a 00 00 00       	mov    $0x7a,%eax
    170a:	eb c9                	jmp    16d5 <phase_3+0x5b>
    170c:	b8 6a 00 00 00       	mov    $0x6a,%eax
    1711:	eb c2                	jmp    16d5 <phase_3+0x5b>
    1713:	b8 75 00 00 00       	mov    $0x75,%eax
    1718:	eb bb                	jmp    16d5 <phase_3+0x5b>
    171a:	e8 3d 08 00 00       	callq  1f5c <explode_bomb>
    171f:	b8 73 00 00 00       	mov    $0x73,%eax
    1724:	eb af                	jmp    16d5 <phase_3+0x5b>
    1726:	b8 79 00 00 00       	mov    $0x79,%eax
    172b:	eb a8                	jmp    16d5 <phase_3+0x5b>
    172d:	e8 2a 08 00 00       	callq  1f5c <explode_bomb>
    1732:	eb a7                	jmp    16db <phase_3+0x61>
    1734:	e8 17 fb ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001739 <phase_4>:
    1739:	f3 0f 1e fa          	endbr64 
    173d:	55                   	push   %rbp
    173e:	53                   	push   %rbx
    173f:	48 81 ec b8 01 00 00 	sub    $0x1b8,%rsp
    1746:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    174d:	00 00 
    174f:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
    1756:	00 
    1757:	31 c0                	xor    %eax,%eax
    1759:	c7 44 24 10 22 02 00 	movl   $0x222,0x10(%rsp)
    1760:	00 
    1761:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
    1768:	00 00 
    176a:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
    1771:	00 00 
    1773:	c7 44 24 30 4a fd ff 	movl   $0xfffffd4a,0x30(%rsp)
    177a:	ff 
    177b:	4c 8d 5c 24 10       	lea    0x10(%rsp),%r11
    1780:	4c 89 5c 24 38       	mov    %r11,0x38(%rsp)
    1785:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
    178c:	00 00 
    178e:	c7 44 24 50 04 03 00 	movl   $0x304,0x50(%rsp)
    1795:	00 
    1796:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
    179b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    17a0:	4c 89 5c 24 68       	mov    %r11,0x68(%rsp)
    17a5:	c7 44 24 70 6f 02 00 	movl   $0x26f,0x70(%rsp)
    17ac:	00 
    17ad:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
    17b2:	48 89 54 24 78       	mov    %rdx,0x78(%rsp)
    17b7:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
    17be:	00 
    17bf:	c7 84 24 90 00 00 00 	movl   $0xfffffc97,0x90(%rsp)
    17c6:	97 fc ff ff 
    17ca:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
    17cf:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
    17d6:	00 
    17d7:	48 89 94 24 a8 00 00 	mov    %rdx,0xa8(%rsp)
    17de:	00 
    17df:	c7 84 24 b0 00 00 00 	movl   $0x291,0xb0(%rsp)
    17e6:	91 02 00 00 
    17ea:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
    17f1:	00 
    17f2:	48 89 b4 24 b8 00 00 	mov    %rsi,0xb8(%rsp)
    17f9:	00 
    17fa:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
    1801:	00 
    1802:	c7 84 24 d0 00 00 00 	movl   $0x24a,0xd0(%rsp)
    1809:	4a 02 00 00 
    180d:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
    1814:	00 
    1815:	4c 89 84 24 d8 00 00 	mov    %r8,0xd8(%rsp)
    181c:	00 
    181d:	48 89 b4 24 e8 00 00 	mov    %rsi,0xe8(%rsp)
    1824:	00 
    1825:	c7 84 24 f0 00 00 00 	movl   $0xfffffcd0,0xf0(%rsp)
    182c:	d0 fc ff ff 
    1830:	4c 8d 8c 24 d0 00 00 	lea    0xd0(%rsp),%r9
    1837:	00 
    1838:	4c 89 8c 24 f8 00 00 	mov    %r9,0xf8(%rsp)
    183f:	00 
    1840:	4c 89 84 24 08 01 00 	mov    %r8,0x108(%rsp)
    1847:	00 
    1848:	c7 84 24 10 01 00 00 	movl   $0x7d,0x110(%rsp)
    184f:	7d 00 00 00 
    1853:	4c 8d 94 24 f0 00 00 	lea    0xf0(%rsp),%r10
    185a:	00 
    185b:	4c 89 94 24 18 01 00 	mov    %r10,0x118(%rsp)
    1862:	00 
    1863:	4c 89 8c 24 28 01 00 	mov    %r9,0x128(%rsp)
    186a:	00 
    186b:	c7 84 24 30 01 00 00 	movl   $0x2f4,0x130(%rsp)
    1872:	f4 02 00 00 
    1876:	48 8d 9c 24 10 01 00 	lea    0x110(%rsp),%rbx
    187d:	00 
    187e:	48 89 9c 24 38 01 00 	mov    %rbx,0x138(%rsp)
    1885:	00 
    1886:	48 c7 84 24 40 01 00 	movq   $0x0,0x140(%rsp)
    188d:	00 00 00 00 00 
    1892:	4c 89 94 24 48 01 00 	mov    %r10,0x148(%rsp)
    1899:	00 
    189a:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    189f:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    18a4:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
    18a9:	48 89 b4 24 80 00 00 	mov    %rsi,0x80(%rsp)
    18b0:	00 
    18b1:	4c 89 84 24 a0 00 00 	mov    %r8,0xa0(%rsp)
    18b8:	00 
    18b9:	4c 89 8c 24 c0 00 00 	mov    %r9,0xc0(%rsp)
    18c0:	00 
    18c1:	4c 89 94 24 e0 00 00 	mov    %r10,0xe0(%rsp)
    18c8:	00 
    18c9:	48 89 9c 24 00 01 00 	mov    %rbx,0x100(%rsp)
    18d0:	00 
    18d1:	48 8d ac 24 30 01 00 	lea    0x130(%rsp),%rbp
    18d8:	00 
    18d9:	48 89 ac 24 20 01 00 	mov    %rbp,0x120(%rsp)
    18e0:	00 
    18e1:	48 c7 84 24 50 01 00 	movq   $0x0,0x150(%rsp)
    18e8:	00 00 00 00 00 
    18ed:	48 89 ac 24 58 01 00 	mov    %rbp,0x158(%rsp)
    18f4:	00 
    18f5:	48 89 9c 24 60 01 00 	mov    %rbx,0x160(%rsp)
    18fc:	00 
    18fd:	4c 89 94 24 68 01 00 	mov    %r10,0x168(%rsp)
    1904:	00 
    1905:	4c 89 8c 24 70 01 00 	mov    %r9,0x170(%rsp)
    190c:	00 
    190d:	4c 89 84 24 78 01 00 	mov    %r8,0x178(%rsp)
    1914:	00 
    1915:	48 89 b4 24 80 01 00 	mov    %rsi,0x180(%rsp)
    191c:	00 
    191d:	48 89 8c 24 88 01 00 	mov    %rcx,0x188(%rsp)
    1924:	00 
    1925:	48 89 94 24 90 01 00 	mov    %rdx,0x190(%rsp)
    192c:	00 
    192d:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
    1934:	00 
    1935:	4c 89 9c 24 a0 01 00 	mov    %r11,0x1a0(%rsp)
    193c:	00 
    193d:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    1942:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    1947:	48 8d 35 17 1b 00 00 	lea    0x1b17(%rip),%rsi        # 3465 <array.3501+0x265>
    194e:	b8 00 00 00 00       	mov    $0x0,%eax
    1953:	e8 98 f9 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    1958:	83 f8 01             	cmp    $0x1,%eax
    195b:	7e 4c                	jle    19a9 <phase_4+0x270>
    195d:	83 7c 24 08 0a       	cmpl   $0xa,0x8(%rsp)
    1962:	77 4c                	ja     19b0 <phase_4+0x277>
    1964:	48 63 44 24 08       	movslq 0x8(%rsp),%rax
    1969:	48 8b 84 c4 50 01 00 	mov    0x150(%rsp,%rax,8),%rax
    1970:	00 
    1971:	48 85 c0             	test   %rax,%rax
    1974:	74 41                	je     19b7 <phase_4+0x27e>
    1976:	ba 00 00 00 00       	mov    $0x0,%edx
    197b:	03 10                	add    (%rax),%edx
    197d:	48 8b 40 18          	mov    0x18(%rax),%rax
    1981:	48 85 c0             	test   %rax,%rax
    1984:	75 f5                	jne    197b <phase_4+0x242>
    1986:	39 54 24 0c          	cmp    %edx,0xc(%rsp)
    198a:	75 32                	jne    19be <phase_4+0x285>
    198c:	48 8b 84 24 a8 01 00 	mov    0x1a8(%rsp),%rax
    1993:	00 
    1994:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    199b:	00 00 
    199d:	75 26                	jne    19c5 <phase_4+0x28c>
    199f:	48 81 c4 b8 01 00 00 	add    $0x1b8,%rsp
    19a6:	5b                   	pop    %rbx
    19a7:	5d                   	pop    %rbp
    19a8:	c3                   	retq   
    19a9:	e8 ae 05 00 00       	callq  1f5c <explode_bomb>
    19ae:	eb ad                	jmp    195d <phase_4+0x224>
    19b0:	e8 a7 05 00 00       	callq  1f5c <explode_bomb>
    19b5:	eb ad                	jmp    1964 <phase_4+0x22b>
    19b7:	ba 00 00 00 00       	mov    $0x0,%edx
    19bc:	eb c8                	jmp    1986 <phase_4+0x24d>
    19be:	e8 99 05 00 00       	callq  1f5c <explode_bomb>
    19c3:	eb c7                	jmp    198c <phase_4+0x253>
    19c5:	e8 86 f8 ff ff       	callq  1250 <__stack_chk_fail@plt>

00000000000019ca <func4>:
    19ca:	f3 0f 1e fa          	endbr64 
    19ce:	48 83 ec 08          	sub    $0x8,%rsp
    19d2:	89 d0                	mov    %edx,%eax
    19d4:	29 f0                	sub    %esi,%eax
    19d6:	89 c1                	mov    %eax,%ecx
    19d8:	c1 e9 1f             	shr    $0x1f,%ecx
    19db:	01 c1                	add    %eax,%ecx
    19dd:	d1 f9                	sar    %ecx
    19df:	01 f1                	add    %esi,%ecx
    19e1:	39 f9                	cmp    %edi,%ecx
    19e3:	7f 0c                	jg     19f1 <func4+0x27>
    19e5:	b8 00 00 00 00       	mov    $0x0,%eax
    19ea:	7c 11                	jl     19fd <func4+0x33>
    19ec:	48 83 c4 08          	add    $0x8,%rsp
    19f0:	c3                   	retq   
    19f1:	8d 51 ff             	lea    -0x1(%rcx),%edx
    19f4:	e8 d1 ff ff ff       	callq  19ca <func4>
    19f9:	01 c0                	add    %eax,%eax
    19fb:	eb ef                	jmp    19ec <func4+0x22>
    19fd:	8d 71 01             	lea    0x1(%rcx),%esi
    1a00:	e8 c5 ff ff ff       	callq  19ca <func4>
    1a05:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    1a09:	eb e1                	jmp    19ec <func4+0x22>

0000000000001a0b <phase_5>:
    1a0b:	f3 0f 1e fa          	endbr64 
    1a0f:	48 83 ec 18          	sub    $0x18,%rsp
    1a13:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1a1a:	00 00 
    1a1c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1a21:	31 c0                	xor    %eax,%eax
    1a23:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    1a28:	48 89 e2             	mov    %rsp,%rdx
    1a2b:	48 8d 35 33 1a 00 00 	lea    0x1a33(%rip),%rsi        # 3465 <array.3501+0x265>
    1a32:	e8 b9 f8 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    1a37:	83 f8 02             	cmp    $0x2,%eax
    1a3a:	75 06                	jne    1a42 <phase_5+0x37>
    1a3c:	83 3c 24 0e          	cmpl   $0xe,(%rsp)
    1a40:	76 05                	jbe    1a47 <phase_5+0x3c>
    1a42:	e8 15 05 00 00       	callq  1f5c <explode_bomb>
    1a47:	ba 0e 00 00 00       	mov    $0xe,%edx
    1a4c:	be 00 00 00 00       	mov    $0x0,%esi
    1a51:	8b 3c 24             	mov    (%rsp),%edi
    1a54:	e8 71 ff ff ff       	callq  19ca <func4>
    1a59:	83 f8 05             	cmp    $0x5,%eax
    1a5c:	75 07                	jne    1a65 <phase_5+0x5a>
    1a5e:	83 7c 24 04 05       	cmpl   $0x5,0x4(%rsp)
    1a63:	74 05                	je     1a6a <phase_5+0x5f>
    1a65:	e8 f2 04 00 00       	callq  1f5c <explode_bomb>
    1a6a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1a6f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1a76:	00 00 
    1a78:	75 05                	jne    1a7f <phase_5+0x74>
    1a7a:	48 83 c4 18          	add    $0x18,%rsp
    1a7e:	c3                   	retq   
    1a7f:	e8 cc f7 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001a84 <phase_6>:
    1a84:	f3 0f 1e fa          	endbr64 
    1a88:	48 83 ec 18          	sub    $0x18,%rsp
    1a8c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1a93:	00 00 
    1a95:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1a9a:	31 c0                	xor    %eax,%eax
    1a9c:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    1aa1:	48 89 e2             	mov    %rsp,%rdx
    1aa4:	48 8d 35 ba 19 00 00 	lea    0x19ba(%rip),%rsi        # 3465 <array.3501+0x265>
    1aab:	e8 40 f8 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    1ab0:	83 f8 01             	cmp    $0x1,%eax
    1ab3:	7e 5a                	jle    1b0f <phase_6+0x8b>
    1ab5:	8b 04 24             	mov    (%rsp),%eax
    1ab8:	83 e0 0f             	and    $0xf,%eax
    1abb:	89 04 24             	mov    %eax,(%rsp)
    1abe:	83 f8 0f             	cmp    $0xf,%eax
    1ac1:	74 32                	je     1af5 <phase_6+0x71>
    1ac3:	b9 00 00 00 00       	mov    $0x0,%ecx
    1ac8:	ba 00 00 00 00       	mov    $0x0,%edx
    1acd:	48 8d 35 2c 17 00 00 	lea    0x172c(%rip),%rsi        # 3200 <array.3501>
    1ad4:	83 c2 01             	add    $0x1,%edx
    1ad7:	48 98                	cltq   
    1ad9:	8b 04 86             	mov    (%rsi,%rax,4),%eax
    1adc:	01 c1                	add    %eax,%ecx
    1ade:	83 f8 0f             	cmp    $0xf,%eax
    1ae1:	75 f1                	jne    1ad4 <phase_6+0x50>
    1ae3:	c7 04 24 0f 00 00 00 	movl   $0xf,(%rsp)
    1aea:	83 fa 0f             	cmp    $0xf,%edx
    1aed:	75 06                	jne    1af5 <phase_6+0x71>
    1aef:	39 4c 24 04          	cmp    %ecx,0x4(%rsp)
    1af3:	74 05                	je     1afa <phase_6+0x76>
    1af5:	e8 62 04 00 00       	callq  1f5c <explode_bomb>
    1afa:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1aff:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1b06:	00 00 
    1b08:	75 0c                	jne    1b16 <phase_6+0x92>
    1b0a:	48 83 c4 18          	add    $0x18,%rsp
    1b0e:	c3                   	retq   
    1b0f:	e8 48 04 00 00       	callq  1f5c <explode_bomb>
    1b14:	eb 9f                	jmp    1ab5 <phase_6+0x31>
    1b16:	e8 35 f7 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001b1b <fun7>:
    1b1b:	f3 0f 1e fa          	endbr64 
    1b1f:	48 85 ff             	test   %rdi,%rdi
    1b22:	74 32                	je     1b56 <fun7+0x3b>
    1b24:	48 83 ec 08          	sub    $0x8,%rsp
    1b28:	8b 17                	mov    (%rdi),%edx
    1b2a:	39 f2                	cmp    %esi,%edx
    1b2c:	7f 0c                	jg     1b3a <fun7+0x1f>
    1b2e:	b8 00 00 00 00       	mov    $0x0,%eax
    1b33:	75 12                	jne    1b47 <fun7+0x2c>
    1b35:	48 83 c4 08          	add    $0x8,%rsp
    1b39:	c3                   	retq   
    1b3a:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    1b3e:	e8 d8 ff ff ff       	callq  1b1b <fun7>
    1b43:	01 c0                	add    %eax,%eax
    1b45:	eb ee                	jmp    1b35 <fun7+0x1a>
    1b47:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    1b4b:	e8 cb ff ff ff       	callq  1b1b <fun7>
    1b50:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    1b54:	eb df                	jmp    1b35 <fun7+0x1a>
    1b56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1b5b:	c3                   	retq   

0000000000001b5c <secret_phase>:
    1b5c:	f3 0f 1e fa          	endbr64 
    1b60:	53                   	push   %rbx
    1b61:	e8 7d 04 00 00       	callq  1fe3 <read_line>
    1b66:	48 89 c7             	mov    %rax,%rdi
    1b69:	ba 0a 00 00 00       	mov    $0xa,%edx
    1b6e:	be 00 00 00 00       	mov    $0x0,%esi
    1b73:	e8 58 f7 ff ff       	callq  12d0 <strtol@plt>
    1b78:	48 89 c3             	mov    %rax,%rbx
    1b7b:	8d 40 ce             	lea    -0x32(%rax),%eax
    1b7e:	3d b6 03 00 00       	cmp    $0x3b6,%eax
    1b83:	77 26                	ja     1bab <secret_phase+0x4f>
    1b85:	89 de                	mov    %ebx,%esi
    1b87:	48 8d 3d a2 45 00 00 	lea    0x45a2(%rip),%rdi        # 6130 <n1>
    1b8e:	e8 88 ff ff ff       	callq  1b1b <fun7>
    1b93:	83 f8 01             	cmp    $0x1,%eax
    1b96:	75 1a                	jne    1bb2 <secret_phase+0x56>
    1b98:	48 8d 3d 01 16 00 00 	lea    0x1601(%rip),%rdi        # 31a0 <_IO_stdin_used+0x1a0>
    1b9f:	e8 8c f6 ff ff       	callq  1230 <puts@plt>
    1ba4:	e8 81 05 00 00       	callq  212a <phase_defused>
    1ba9:	5b                   	pop    %rbx
    1baa:	c3                   	retq   
    1bab:	e8 ac 03 00 00       	callq  1f5c <explode_bomb>
    1bb0:	eb d3                	jmp    1b85 <secret_phase+0x29>
    1bb2:	e8 a5 03 00 00       	callq  1f5c <explode_bomb>
    1bb7:	eb df                	jmp    1b98 <secret_phase+0x3c>

0000000000001bb9 <sig_handler>:
    1bb9:	f3 0f 1e fa          	endbr64 
    1bbd:	50                   	push   %rax
    1bbe:	58                   	pop    %rax
    1bbf:	48 83 ec 08          	sub    $0x8,%rsp
    1bc3:	48 8d 3d 76 16 00 00 	lea    0x1676(%rip),%rdi        # 3240 <array.3501+0x40>
    1bca:	e8 61 f6 ff ff       	callq  1230 <puts@plt>
    1bcf:	bf 03 00 00 00       	mov    $0x3,%edi
    1bd4:	e8 87 f7 ff ff       	callq  1360 <sleep@plt>
    1bd9:	48 8d 35 01 18 00 00 	lea    0x1801(%rip),%rsi        # 33e1 <array.3501+0x1e1>
    1be0:	bf 01 00 00 00       	mov    $0x1,%edi
    1be5:	b8 00 00 00 00       	mov    $0x0,%eax
    1bea:	e8 11 f7 ff ff       	callq  1300 <__printf_chk@plt>
    1bef:	48 8b 3d 2a 4a 00 00 	mov    0x4a2a(%rip),%rdi        # 6620 <stdout@@GLIBC_2.2.5>
    1bf6:	e8 e5 f6 ff ff       	callq  12e0 <fflush@plt>
    1bfb:	bf 01 00 00 00       	mov    $0x1,%edi
    1c00:	e8 5b f7 ff ff       	callq  1360 <sleep@plt>
    1c05:	48 8d 3d dd 17 00 00 	lea    0x17dd(%rip),%rdi        # 33e9 <array.3501+0x1e9>
    1c0c:	e8 1f f6 ff ff       	callq  1230 <puts@plt>
    1c11:	bf 10 00 00 00       	mov    $0x10,%edi
    1c16:	e8 15 f7 ff ff       	callq  1330 <exit@plt>

0000000000001c1b <invalid_phase>:
    1c1b:	f3 0f 1e fa          	endbr64 
    1c1f:	50                   	push   %rax
    1c20:	58                   	pop    %rax
    1c21:	48 83 ec 08          	sub    $0x8,%rsp
    1c25:	48 89 fa             	mov    %rdi,%rdx
    1c28:	48 8d 35 c2 17 00 00 	lea    0x17c2(%rip),%rsi        # 33f1 <array.3501+0x1f1>
    1c2f:	bf 01 00 00 00       	mov    $0x1,%edi
    1c34:	b8 00 00 00 00       	mov    $0x0,%eax
    1c39:	e8 c2 f6 ff ff       	callq  1300 <__printf_chk@plt>
    1c3e:	bf 08 00 00 00       	mov    $0x8,%edi
    1c43:	e8 e8 f6 ff ff       	callq  1330 <exit@plt>

0000000000001c48 <string_length>:
    1c48:	f3 0f 1e fa          	endbr64 
    1c4c:	80 3f 00             	cmpb   $0x0,(%rdi)
    1c4f:	74 12                	je     1c63 <string_length+0x1b>
    1c51:	b8 00 00 00 00       	mov    $0x0,%eax
    1c56:	48 83 c7 01          	add    $0x1,%rdi
    1c5a:	83 c0 01             	add    $0x1,%eax
    1c5d:	80 3f 00             	cmpb   $0x0,(%rdi)
    1c60:	75 f4                	jne    1c56 <string_length+0xe>
    1c62:	c3                   	retq   
    1c63:	b8 00 00 00 00       	mov    $0x0,%eax
    1c68:	c3                   	retq   

0000000000001c69 <strings_not_equal>:
    1c69:	f3 0f 1e fa          	endbr64 
    1c6d:	41 54                	push   %r12
    1c6f:	55                   	push   %rbp
    1c70:	53                   	push   %rbx
    1c71:	48 89 fb             	mov    %rdi,%rbx
    1c74:	48 89 f5             	mov    %rsi,%rbp
    1c77:	e8 cc ff ff ff       	callq  1c48 <string_length>
    1c7c:	41 89 c4             	mov    %eax,%r12d
    1c7f:	48 89 ef             	mov    %rbp,%rdi
    1c82:	e8 c1 ff ff ff       	callq  1c48 <string_length>
    1c87:	89 c2                	mov    %eax,%edx
    1c89:	b8 01 00 00 00       	mov    $0x1,%eax
    1c8e:	41 39 d4             	cmp    %edx,%r12d
    1c91:	75 31                	jne    1cc4 <strings_not_equal+0x5b>
    1c93:	0f b6 13             	movzbl (%rbx),%edx
    1c96:	84 d2                	test   %dl,%dl
    1c98:	74 1e                	je     1cb8 <strings_not_equal+0x4f>
    1c9a:	b8 00 00 00 00       	mov    $0x0,%eax
    1c9f:	38 54 05 00          	cmp    %dl,0x0(%rbp,%rax,1)
    1ca3:	75 1a                	jne    1cbf <strings_not_equal+0x56>
    1ca5:	48 83 c0 01          	add    $0x1,%rax
    1ca9:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    1cad:	84 d2                	test   %dl,%dl
    1caf:	75 ee                	jne    1c9f <strings_not_equal+0x36>
    1cb1:	b8 00 00 00 00       	mov    $0x0,%eax
    1cb6:	eb 0c                	jmp    1cc4 <strings_not_equal+0x5b>
    1cb8:	b8 00 00 00 00       	mov    $0x0,%eax
    1cbd:	eb 05                	jmp    1cc4 <strings_not_equal+0x5b>
    1cbf:	b8 01 00 00 00       	mov    $0x1,%eax
    1cc4:	5b                   	pop    %rbx
    1cc5:	5d                   	pop    %rbp
    1cc6:	41 5c                	pop    %r12
    1cc8:	c3                   	retq   

0000000000001cc9 <initialize_bomb>:
    1cc9:	f3 0f 1e fa          	endbr64 
    1ccd:	55                   	push   %rbp
    1cce:	53                   	push   %rbx
    1ccf:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1cd6:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1cdb:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1ce2:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1ce7:	48 83 ec 58          	sub    $0x58,%rsp
    1ceb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1cf2:	00 00 
    1cf4:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
    1cfb:	00 
    1cfc:	31 c0                	xor    %eax,%eax
    1cfe:	48 8d 35 b4 fe ff ff 	lea    -0x14c(%rip),%rsi        # 1bb9 <sig_handler>
    1d05:	bf 02 00 00 00       	mov    $0x2,%edi
    1d0a:	e8 91 f5 ff ff       	callq  12a0 <signal@plt>
    1d0f:	48 89 e7             	mov    %rsp,%rdi
    1d12:	be 40 00 00 00       	mov    $0x40,%esi
    1d17:	e8 04 f6 ff ff       	callq  1320 <gethostname@plt>
    1d1c:	85 c0                	test   %eax,%eax
    1d1e:	75 45                	jne    1d65 <initialize_bomb+0x9c>
    1d20:	48 8b 3d f9 44 00 00 	mov    0x44f9(%rip),%rdi        # 6220 <host_table>
    1d27:	48 8d 1d fa 44 00 00 	lea    0x44fa(%rip),%rbx        # 6228 <host_table+0x8>
    1d2e:	48 89 e5             	mov    %rsp,%rbp
    1d31:	48 85 ff             	test   %rdi,%rdi
    1d34:	74 19                	je     1d4f <initialize_bomb+0x86>
    1d36:	48 89 ee             	mov    %rbp,%rsi
    1d39:	e8 c2 f4 ff ff       	callq  1200 <strcasecmp@plt>
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	74 5e                	je     1da0 <initialize_bomb+0xd7>
    1d42:	48 83 c3 08          	add    $0x8,%rbx
    1d46:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
    1d4a:	48 85 ff             	test   %rdi,%rdi
    1d4d:	75 e7                	jne    1d36 <initialize_bomb+0x6d>
    1d4f:	48 8d 3d 5a 15 00 00 	lea    0x155a(%rip),%rdi        # 32b0 <array.3501+0xb0>
    1d56:	e8 d5 f4 ff ff       	callq  1230 <puts@plt>
    1d5b:	bf 08 00 00 00       	mov    $0x8,%edi
    1d60:	e8 cb f5 ff ff       	callq  1330 <exit@plt>
    1d65:	48 8d 3d 0c 15 00 00 	lea    0x150c(%rip),%rdi        # 3278 <array.3501+0x78>
    1d6c:	e8 bf f4 ff ff       	callq  1230 <puts@plt>
    1d71:	bf 08 00 00 00       	mov    $0x8,%edi
    1d76:	e8 b5 f5 ff ff       	callq  1330 <exit@plt>
    1d7b:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    1d80:	48 8d 35 7b 16 00 00 	lea    0x167b(%rip),%rsi        # 3402 <array.3501+0x202>
    1d87:	bf 01 00 00 00       	mov    $0x1,%edi
    1d8c:	b8 00 00 00 00       	mov    $0x0,%eax
    1d91:	e8 6a f5 ff ff       	callq  1300 <__printf_chk@plt>
    1d96:	bf 08 00 00 00       	mov    $0x8,%edi
    1d9b:	e8 90 f5 ff ff       	callq  1330 <exit@plt>
    1da0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    1da5:	e8 aa 0d 00 00       	callq  2b54 <init_driver>
    1daa:	85 c0                	test   %eax,%eax
    1dac:	78 cd                	js     1d7b <initialize_bomb+0xb2>
    1dae:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
    1db5:	00 
    1db6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1dbd:	00 00 
    1dbf:	75 0a                	jne    1dcb <initialize_bomb+0x102>
    1dc1:	48 81 c4 58 20 00 00 	add    $0x2058,%rsp
    1dc8:	5b                   	pop    %rbx
    1dc9:	5d                   	pop    %rbp
    1dca:	c3                   	retq   
    1dcb:	e8 80 f4 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001dd0 <initialize_bomb_solve>:
    1dd0:	f3 0f 1e fa          	endbr64 
    1dd4:	c3                   	retq   

0000000000001dd5 <blank_line>:
    1dd5:	f3 0f 1e fa          	endbr64 
    1dd9:	55                   	push   %rbp
    1dda:	53                   	push   %rbx
    1ddb:	48 83 ec 08          	sub    $0x8,%rsp
    1ddf:	48 89 fd             	mov    %rdi,%rbp
    1de2:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1de6:	84 db                	test   %bl,%bl
    1de8:	74 1e                	je     1e08 <blank_line+0x33>
    1dea:	e8 81 f5 ff ff       	callq  1370 <__ctype_b_loc@plt>
    1def:	48 83 c5 01          	add    $0x1,%rbp
    1df3:	48 0f be db          	movsbq %bl,%rbx
    1df7:	48 8b 00             	mov    (%rax),%rax
    1dfa:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    1dff:	75 e1                	jne    1de2 <blank_line+0xd>
    1e01:	b8 00 00 00 00       	mov    $0x0,%eax
    1e06:	eb 05                	jmp    1e0d <blank_line+0x38>
    1e08:	b8 01 00 00 00       	mov    $0x1,%eax
    1e0d:	48 83 c4 08          	add    $0x8,%rsp
    1e11:	5b                   	pop    %rbx
    1e12:	5d                   	pop    %rbp
    1e13:	c3                   	retq   

0000000000001e14 <skip>:
    1e14:	f3 0f 1e fa          	endbr64 
    1e18:	55                   	push   %rbp
    1e19:	53                   	push   %rbx
    1e1a:	48 83 ec 08          	sub    $0x8,%rsp
    1e1e:	48 8d 2d 3b 48 00 00 	lea    0x483b(%rip),%rbp        # 6660 <input_strings>
    1e25:	48 63 05 20 48 00 00 	movslq 0x4820(%rip),%rax        # 664c <num_input_strings>
    1e2c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1e30:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1e34:	48 8d 7c 85 00       	lea    0x0(%rbp,%rax,4),%rdi
    1e39:	48 8b 15 10 48 00 00 	mov    0x4810(%rip),%rdx        # 6650 <infile>
    1e40:	be 64 00 00 00       	mov    $0x64,%esi
    1e45:	e8 46 f4 ff ff       	callq  1290 <fgets@plt>
    1e4a:	48 89 c3             	mov    %rax,%rbx
    1e4d:	48 85 c0             	test   %rax,%rax
    1e50:	74 0c                	je     1e5e <skip+0x4a>
    1e52:	48 89 c7             	mov    %rax,%rdi
    1e55:	e8 7b ff ff ff       	callq  1dd5 <blank_line>
    1e5a:	85 c0                	test   %eax,%eax
    1e5c:	75 c7                	jne    1e25 <skip+0x11>
    1e5e:	48 89 d8             	mov    %rbx,%rax
    1e61:	48 83 c4 08          	add    $0x8,%rsp
    1e65:	5b                   	pop    %rbx
    1e66:	5d                   	pop    %rbp
    1e67:	c3                   	retq   

0000000000001e68 <send_msg>:
    1e68:	f3 0f 1e fa          	endbr64 
    1e6c:	53                   	push   %rbx
    1e6d:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    1e74:	ff 
    1e75:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1e7c:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1e81:	4c 39 dc             	cmp    %r11,%rsp
    1e84:	75 ef                	jne    1e75 <send_msg+0xd>
    1e86:	48 83 ec 10          	sub    $0x10,%rsp
    1e8a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1e91:	00 00 
    1e93:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    1e9a:	00 
    1e9b:	31 c0                	xor    %eax,%eax
    1e9d:	8b 15 a9 47 00 00    	mov    0x47a9(%rip),%edx        # 664c <num_input_strings>
    1ea3:	8d 42 ff             	lea    -0x1(%rdx),%eax
    1ea6:	48 98                	cltq   
    1ea8:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1eac:	48 8d 0c 80          	lea    (%rax,%rax,4),%rcx
    1eb0:	48 8d 05 a9 47 00 00 	lea    0x47a9(%rip),%rax        # 6660 <input_strings>
    1eb7:	48 8d 04 88          	lea    (%rax,%rcx,4),%rax
    1ebb:	85 ff                	test   %edi,%edi
    1ebd:	4c 8d 0d 58 15 00 00 	lea    0x1558(%rip),%r9        # 341c <array.3501+0x21c>
    1ec4:	48 8d 0d 59 15 00 00 	lea    0x1559(%rip),%rcx        # 3424 <array.3501+0x224>
    1ecb:	4c 0f 44 c9          	cmove  %rcx,%r9
    1ecf:	48 89 e3             	mov    %rsp,%rbx
    1ed2:	50                   	push   %rax
    1ed3:	52                   	push   %rdx
    1ed4:	44 8b 05 51 42 00 00 	mov    0x4251(%rip),%r8d        # 612c <bomb_id>
    1edb:	48 8d 0d 4b 15 00 00 	lea    0x154b(%rip),%rcx        # 342d <array.3501+0x22d>
    1ee2:	ba 00 20 00 00       	mov    $0x2000,%edx
    1ee7:	be 01 00 00 00       	mov    $0x1,%esi
    1eec:	48 89 df             	mov    %rbx,%rdi
    1eef:	b8 00 00 00 00       	mov    $0x0,%eax
    1ef4:	e8 87 f4 ff ff       	callq  1380 <__sprintf_chk@plt>
    1ef9:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
    1f00:	00 
    1f01:	b9 00 00 00 00       	mov    $0x0,%ecx
    1f06:	48 89 da             	mov    %rbx,%rdx
    1f09:	48 8d 35 00 42 00 00 	lea    0x4200(%rip),%rsi        # 6110 <user_password>
    1f10:	48 8d 3d 0e 42 00 00 	lea    0x420e(%rip),%rdi        # 6125 <userid>
    1f17:	e8 2d 0e 00 00       	callq  2d49 <driver_post>
    1f1c:	48 83 c4 10          	add    $0x10,%rsp
    1f20:	85 c0                	test   %eax,%eax
    1f22:	78 1c                	js     1f40 <send_msg+0xd8>
    1f24:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    1f2b:	00 
    1f2c:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1f33:	00 00 
    1f35:	75 20                	jne    1f57 <send_msg+0xef>
    1f37:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
    1f3e:	5b                   	pop    %rbx
    1f3f:	c3                   	retq   
    1f40:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
    1f47:	00 
    1f48:	e8 e3 f2 ff ff       	callq  1230 <puts@plt>
    1f4d:	bf 00 00 00 00       	mov    $0x0,%edi
    1f52:	e8 d9 f3 ff ff       	callq  1330 <exit@plt>
    1f57:	e8 f4 f2 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000001f5c <explode_bomb>:
    1f5c:	f3 0f 1e fa          	endbr64 
    1f60:	50                   	push   %rax
    1f61:	58                   	pop    %rax
    1f62:	48 83 ec 08          	sub    $0x8,%rsp
    1f66:	48 8d 3d cc 14 00 00 	lea    0x14cc(%rip),%rdi        # 3439 <array.3501+0x239>
    1f6d:	e8 be f2 ff ff       	callq  1230 <puts@plt>
    1f72:	48 8d 3d c9 14 00 00 	lea    0x14c9(%rip),%rdi        # 3442 <array.3501+0x242>
    1f79:	e8 b2 f2 ff ff       	callq  1230 <puts@plt>
    1f7e:	bf 00 00 00 00       	mov    $0x0,%edi
    1f83:	e8 e0 fe ff ff       	callq  1e68 <send_msg>
    1f88:	48 8d 3d 59 13 00 00 	lea    0x1359(%rip),%rdi        # 32e8 <array.3501+0xe8>
    1f8f:	e8 9c f2 ff ff       	callq  1230 <puts@plt>
    1f94:	bf 08 00 00 00       	mov    $0x8,%edi
    1f99:	e8 92 f3 ff ff       	callq  1330 <exit@plt>

0000000000001f9e <read_six_numbers>:
    1f9e:	f3 0f 1e fa          	endbr64 
    1fa2:	48 83 ec 08          	sub    $0x8,%rsp
    1fa6:	48 89 f2             	mov    %rsi,%rdx
    1fa9:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1fad:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1fb1:	50                   	push   %rax
    1fb2:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1fb6:	50                   	push   %rax
    1fb7:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1fbb:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1fbf:	48 8d 35 93 14 00 00 	lea    0x1493(%rip),%rsi        # 3459 <array.3501+0x259>
    1fc6:	b8 00 00 00 00       	mov    $0x0,%eax
    1fcb:	e8 20 f3 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    1fd0:	48 83 c4 10          	add    $0x10,%rsp
    1fd4:	83 f8 05             	cmp    $0x5,%eax
    1fd7:	7e 05                	jle    1fde <read_six_numbers+0x40>
    1fd9:	48 83 c4 08          	add    $0x8,%rsp
    1fdd:	c3                   	retq   
    1fde:	e8 79 ff ff ff       	callq  1f5c <explode_bomb>

0000000000001fe3 <read_line>:
    1fe3:	f3 0f 1e fa          	endbr64 
    1fe7:	48 83 ec 08          	sub    $0x8,%rsp
    1feb:	b8 00 00 00 00       	mov    $0x0,%eax
    1ff0:	e8 1f fe ff ff       	callq  1e14 <skip>
    1ff5:	48 85 c0             	test   %rax,%rax
    1ff8:	74 6e                	je     2068 <read_line+0x85>
    1ffa:	8b 15 4c 46 00 00    	mov    0x464c(%rip),%edx        # 664c <num_input_strings>
    2000:	48 63 c2             	movslq %edx,%rax
    2003:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    2007:	48 8d 0c 80          	lea    (%rax,%rax,4),%rcx
    200b:	48 8d 05 4e 46 00 00 	lea    0x464e(%rip),%rax        # 6660 <input_strings>
    2012:	48 8d 34 88          	lea    (%rax,%rcx,4),%rsi
    2016:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    201d:	b8 00 00 00 00       	mov    $0x0,%eax
    2022:	48 89 f7             	mov    %rsi,%rdi
    2025:	f2 ae                	repnz scas %es:(%rdi),%al
    2027:	48 f7 d1             	not    %rcx
    202a:	48 83 e9 01          	sub    $0x1,%rcx
    202e:	83 f9 62             	cmp    $0x62,%ecx
    2031:	0f 8f a9 00 00 00    	jg     20e0 <read_line+0xfd>
    2037:	83 e9 01             	sub    $0x1,%ecx
    203a:	48 63 c9             	movslq %ecx,%rcx
    203d:	48 63 c2             	movslq %edx,%rax
    2040:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    2044:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    2048:	48 8d 05 11 46 00 00 	lea    0x4611(%rip),%rax        # 6660 <input_strings>
    204f:	48 8d 04 b8          	lea    (%rax,%rdi,4),%rax
    2053:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    2057:	83 c2 01             	add    $0x1,%edx
    205a:	89 15 ec 45 00 00    	mov    %edx,0x45ec(%rip)        # 664c <num_input_strings>
    2060:	48 89 f0             	mov    %rsi,%rax
    2063:	48 83 c4 08          	add    $0x8,%rsp
    2067:	c3                   	retq   
    2068:	48 8b 05 c1 45 00 00 	mov    0x45c1(%rip),%rax        # 6630 <stdin@@GLIBC_2.2.5>
    206f:	48 39 05 da 45 00 00 	cmp    %rax,0x45da(%rip)        # 6650 <infile>
    2076:	74 1b                	je     2093 <read_line+0xb0>
    2078:	48 8d 3d 0a 14 00 00 	lea    0x140a(%rip),%rdi        # 3489 <array.3501+0x289>
    207f:	e8 6c f1 ff ff       	callq  11f0 <getenv@plt>
    2084:	48 85 c0             	test   %rax,%rax
    2087:	74 20                	je     20a9 <read_line+0xc6>
    2089:	bf 00 00 00 00       	mov    $0x0,%edi
    208e:	e8 9d f2 ff ff       	callq  1330 <exit@plt>
    2093:	48 8d 3d d1 13 00 00 	lea    0x13d1(%rip),%rdi        # 346b <array.3501+0x26b>
    209a:	e8 91 f1 ff ff       	callq  1230 <puts@plt>
    209f:	bf 08 00 00 00       	mov    $0x8,%edi
    20a4:	e8 87 f2 ff ff       	callq  1330 <exit@plt>
    20a9:	48 8b 05 80 45 00 00 	mov    0x4580(%rip),%rax        # 6630 <stdin@@GLIBC_2.2.5>
    20b0:	48 89 05 99 45 00 00 	mov    %rax,0x4599(%rip)        # 6650 <infile>
    20b7:	b8 00 00 00 00       	mov    $0x0,%eax
    20bc:	e8 53 fd ff ff       	callq  1e14 <skip>
    20c1:	48 85 c0             	test   %rax,%rax
    20c4:	0f 85 30 ff ff ff    	jne    1ffa <read_line+0x17>
    20ca:	48 8d 3d 9a 13 00 00 	lea    0x139a(%rip),%rdi        # 346b <array.3501+0x26b>
    20d1:	e8 5a f1 ff ff       	callq  1230 <puts@plt>
    20d6:	bf 00 00 00 00       	mov    $0x0,%edi
    20db:	e8 50 f2 ff ff       	callq  1330 <exit@plt>
    20e0:	48 8d 3d ad 13 00 00 	lea    0x13ad(%rip),%rdi        # 3494 <array.3501+0x294>
    20e7:	e8 44 f1 ff ff       	callq  1230 <puts@plt>
    20ec:	8b 05 5a 45 00 00    	mov    0x455a(%rip),%eax        # 664c <num_input_strings>
    20f2:	8d 50 01             	lea    0x1(%rax),%edx
    20f5:	89 15 51 45 00 00    	mov    %edx,0x4551(%rip)        # 664c <num_input_strings>
    20fb:	48 98                	cltq   
    20fd:	48 6b c0 64          	imul   $0x64,%rax,%rax
    2101:	48 8d 15 58 45 00 00 	lea    0x4558(%rip),%rdx        # 6660 <input_strings>
    2108:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    210f:	75 6e 63 
    2112:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    2119:	2a 2a 00 
    211c:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    2120:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    2125:	e8 32 fe ff ff       	callq  1f5c <explode_bomb>

000000000000212a <phase_defused>:
    212a:	f3 0f 1e fa          	endbr64 
    212e:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
    2135:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    213c:	00 00 
    213e:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
    2143:	31 c0                	xor    %eax,%eax
    2145:	bf 01 00 00 00       	mov    $0x1,%edi
    214a:	e8 19 fd ff ff       	callq  1e68 <send_msg>
    214f:	83 3d f6 44 00 00 06 	cmpl   $0x6,0x44f6(%rip)        # 664c <num_input_strings>
    2156:	74 1c                	je     2174 <phase_defused+0x4a>
    2158:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
    215d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    2164:	00 00 
    2166:	0f 85 87 00 00 00    	jne    21f3 <phase_defused+0xc9>
    216c:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
    2173:	c3                   	retq   
    2174:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    2179:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    217e:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    2183:	48 8d 35 25 13 00 00 	lea    0x1325(%rip),%rsi        # 34af <array.3501+0x2af>
    218a:	48 8d 3d 5f 46 00 00 	lea    0x465f(%rip),%rdi        # 67f0 <input_strings+0x190>
    2191:	b8 00 00 00 00       	mov    $0x0,%eax
    2196:	e8 55 f1 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    219b:	83 f8 03             	cmp    $0x3,%eax
    219e:	74 1a                	je     21ba <phase_defused+0x90>
    21a0:	48 8d 3d c9 11 00 00 	lea    0x11c9(%rip),%rdi        # 3370 <array.3501+0x170>
    21a7:	e8 84 f0 ff ff       	callq  1230 <puts@plt>
    21ac:	48 8d 3d ed 11 00 00 	lea    0x11ed(%rip),%rdi        # 33a0 <array.3501+0x1a0>
    21b3:	e8 78 f0 ff ff       	callq  1230 <puts@plt>
    21b8:	eb 9e                	jmp    2158 <phase_defused+0x2e>
    21ba:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    21bf:	48 8d 35 f2 12 00 00 	lea    0x12f2(%rip),%rsi        # 34b8 <array.3501+0x2b8>
    21c6:	e8 9e fa ff ff       	callq  1c69 <strings_not_equal>
    21cb:	85 c0                	test   %eax,%eax
    21cd:	75 d1                	jne    21a0 <phase_defused+0x76>
    21cf:	48 8d 3d 3a 11 00 00 	lea    0x113a(%rip),%rdi        # 3310 <array.3501+0x110>
    21d6:	e8 55 f0 ff ff       	callq  1230 <puts@plt>
    21db:	48 8d 3d 56 11 00 00 	lea    0x1156(%rip),%rdi        # 3338 <array.3501+0x138>
    21e2:	e8 49 f0 ff ff       	callq  1230 <puts@plt>
    21e7:	b8 00 00 00 00       	mov    $0x0,%eax
    21ec:	e8 6b f9 ff ff       	callq  1b5c <secret_phase>
    21f1:	eb ad                	jmp    21a0 <phase_defused+0x76>
    21f3:	e8 58 f0 ff ff       	callq  1250 <__stack_chk_fail@plt>

00000000000021f8 <sigalrm_handler>:
    21f8:	f3 0f 1e fa          	endbr64 
    21fc:	50                   	push   %rax
    21fd:	58                   	pop    %rax
    21fe:	48 83 ec 08          	sub    $0x8,%rsp
    2202:	b9 00 00 00 00       	mov    $0x0,%ecx
    2207:	48 8d 15 92 13 00 00 	lea    0x1392(%rip),%rdx        # 35a0 <array.3501+0x3a0>
    220e:	be 01 00 00 00       	mov    $0x1,%esi
    2213:	48 8b 3d 26 44 00 00 	mov    0x4426(%rip),%rdi        # 6640 <stderr@@GLIBC_2.2.5>
    221a:	b8 00 00 00 00       	mov    $0x0,%eax
    221f:	e8 2c f1 ff ff       	callq  1350 <__fprintf_chk@plt>
    2224:	bf 01 00 00 00       	mov    $0x1,%edi
    2229:	e8 02 f1 ff ff       	callq  1330 <exit@plt>

000000000000222e <rio_readlineb>:
    222e:	41 56                	push   %r14
    2230:	41 55                	push   %r13
    2232:	41 54                	push   %r12
    2234:	55                   	push   %rbp
    2235:	53                   	push   %rbx
    2236:	48 89 f5             	mov    %rsi,%rbp
    2239:	48 83 fa 01          	cmp    $0x1,%rdx
    223d:	0f 86 90 00 00 00    	jbe    22d3 <rio_readlineb+0xa5>
    2243:	48 89 fb             	mov    %rdi,%rbx
    2246:	4c 8d 74 16 ff       	lea    -0x1(%rsi,%rdx,1),%r14
    224b:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    2251:	4c 8d 67 10          	lea    0x10(%rdi),%r12
    2255:	eb 54                	jmp    22ab <rio_readlineb+0x7d>
    2257:	e8 b4 ef ff ff       	callq  1210 <__errno_location@plt>
    225c:	83 38 04             	cmpl   $0x4,(%rax)
    225f:	75 53                	jne    22b4 <rio_readlineb+0x86>
    2261:	ba 00 20 00 00       	mov    $0x2000,%edx
    2266:	4c 89 e6             	mov    %r12,%rsi
    2269:	8b 3b                	mov    (%rbx),%edi
    226b:	e8 10 f0 ff ff       	callq  1280 <read@plt>
    2270:	89 c2                	mov    %eax,%edx
    2272:	89 43 04             	mov    %eax,0x4(%rbx)
    2275:	85 c0                	test   %eax,%eax
    2277:	78 de                	js     2257 <rio_readlineb+0x29>
    2279:	85 c0                	test   %eax,%eax
    227b:	74 40                	je     22bd <rio_readlineb+0x8f>
    227d:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    2281:	48 8b 43 08          	mov    0x8(%rbx),%rax
    2285:	0f b6 08             	movzbl (%rax),%ecx
    2288:	48 83 c0 01          	add    $0x1,%rax
    228c:	48 89 43 08          	mov    %rax,0x8(%rbx)
    2290:	83 ea 01             	sub    $0x1,%edx
    2293:	89 53 04             	mov    %edx,0x4(%rbx)
    2296:	48 83 c5 01          	add    $0x1,%rbp
    229a:	88 4d ff             	mov    %cl,-0x1(%rbp)
    229d:	80 f9 0a             	cmp    $0xa,%cl
    22a0:	74 3c                	je     22de <rio_readlineb+0xb0>
    22a2:	41 83 c5 01          	add    $0x1,%r13d
    22a6:	4c 39 f5             	cmp    %r14,%rbp
    22a9:	74 30                	je     22db <rio_readlineb+0xad>
    22ab:	8b 53 04             	mov    0x4(%rbx),%edx
    22ae:	85 d2                	test   %edx,%edx
    22b0:	7e af                	jle    2261 <rio_readlineb+0x33>
    22b2:	eb cd                	jmp    2281 <rio_readlineb+0x53>
    22b4:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    22bb:	eb 05                	jmp    22c2 <rio_readlineb+0x94>
    22bd:	b8 00 00 00 00       	mov    $0x0,%eax
    22c2:	85 c0                	test   %eax,%eax
    22c4:	75 28                	jne    22ee <rio_readlineb+0xc0>
    22c6:	b8 00 00 00 00       	mov    $0x0,%eax
    22cb:	41 83 fd 01          	cmp    $0x1,%r13d
    22cf:	75 0d                	jne    22de <rio_readlineb+0xb0>
    22d1:	eb 12                	jmp    22e5 <rio_readlineb+0xb7>
    22d3:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    22d9:	eb 03                	jmp    22de <rio_readlineb+0xb0>
    22db:	4c 89 f5             	mov    %r14,%rbp
    22de:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
    22e2:	49 63 c5             	movslq %r13d,%rax
    22e5:	5b                   	pop    %rbx
    22e6:	5d                   	pop    %rbp
    22e7:	41 5c                	pop    %r12
    22e9:	41 5d                	pop    %r13
    22eb:	41 5e                	pop    %r14
    22ed:	c3                   	retq   
    22ee:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    22f5:	eb ee                	jmp    22e5 <rio_readlineb+0xb7>

00000000000022f7 <submitr>:
    22f7:	f3 0f 1e fa          	endbr64 
    22fb:	41 57                	push   %r15
    22fd:	41 56                	push   %r14
    22ff:	41 55                	push   %r13
    2301:	41 54                	push   %r12
    2303:	55                   	push   %rbp
    2304:	53                   	push   %rbx
    2305:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    230c:	ff 
    230d:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    2314:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    2319:	4c 39 dc             	cmp    %r11,%rsp
    231c:	75 ef                	jne    230d <submitr+0x16>
    231e:	48 83 ec 68          	sub    $0x68,%rsp
    2322:	49 89 fd             	mov    %rdi,%r13
    2325:	89 f5                	mov    %esi,%ebp
    2327:	48 89 14 24          	mov    %rdx,(%rsp)
    232b:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    2330:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    2335:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    233a:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
    2341:	00 
    2342:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
    2349:	00 
    234a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2351:	00 00 
    2353:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    235a:	00 
    235b:	31 c0                	xor    %eax,%eax
    235d:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    2364:	00 
    2365:	ba 00 00 00 00       	mov    $0x0,%edx
    236a:	be 01 00 00 00       	mov    $0x1,%esi
    236f:	bf 02 00 00 00       	mov    $0x2,%edi
    2374:	e8 17 f0 ff ff       	callq  1390 <socket@plt>
    2379:	85 c0                	test   %eax,%eax
    237b:	0f 88 17 01 00 00    	js     2498 <submitr+0x1a1>
    2381:	41 89 c4             	mov    %eax,%r12d
    2384:	4c 89 ef             	mov    %r13,%rdi
    2387:	e8 24 ef ff ff       	callq  12b0 <gethostbyname@plt>
    238c:	48 85 c0             	test   %rax,%rax
    238f:	0f 84 53 01 00 00    	je     24e8 <submitr+0x1f1>
    2395:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
    239a:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    23a1:	00 00 
    23a3:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    23aa:	00 00 
    23ac:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    23b3:	48 63 50 14          	movslq 0x14(%rax),%rdx
    23b7:	48 8b 40 18          	mov    0x18(%rax),%rax
    23bb:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    23c0:	b9 0c 00 00 00       	mov    $0xc,%ecx
    23c5:	48 8b 30             	mov    (%rax),%rsi
    23c8:	e8 f3 ee ff ff       	callq  12c0 <__memmove_chk@plt>
    23cd:	66 c1 c5 08          	rol    $0x8,%bp
    23d1:	66 89 6c 24 32       	mov    %bp,0x32(%rsp)
    23d6:	ba 10 00 00 00       	mov    $0x10,%edx
    23db:	4c 89 ee             	mov    %r13,%rsi
    23de:	44 89 e7             	mov    %r12d,%edi
    23e1:	e8 5a ef ff ff       	callq  1340 <connect@plt>
    23e6:	85 c0                	test   %eax,%eax
    23e8:	0f 88 65 01 00 00    	js     2553 <submitr+0x25c>
    23ee:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
    23f5:	b8 00 00 00 00       	mov    $0x0,%eax
    23fa:	4c 89 c9             	mov    %r9,%rcx
    23fd:	48 89 df             	mov    %rbx,%rdi
    2400:	f2 ae                	repnz scas %es:(%rdi),%al
    2402:	48 f7 d1             	not    %rcx
    2405:	48 89 ce             	mov    %rcx,%rsi
    2408:	4c 89 c9             	mov    %r9,%rcx
    240b:	48 8b 3c 24          	mov    (%rsp),%rdi
    240f:	f2 ae                	repnz scas %es:(%rdi),%al
    2411:	49 89 c8             	mov    %rcx,%r8
    2414:	4c 89 c9             	mov    %r9,%rcx
    2417:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    241c:	f2 ae                	repnz scas %es:(%rdi),%al
    241e:	48 89 ca             	mov    %rcx,%rdx
    2421:	48 f7 d2             	not    %rdx
    2424:	4c 89 c9             	mov    %r9,%rcx
    2427:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    242c:	f2 ae                	repnz scas %es:(%rdi),%al
    242e:	4c 29 c2             	sub    %r8,%rdx
    2431:	48 29 ca             	sub    %rcx,%rdx
    2434:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
    2439:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
    243e:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    2444:	0f 87 66 01 00 00    	ja     25b0 <submitr+0x2b9>
    244a:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
    2451:	00 
    2452:	b9 00 04 00 00       	mov    $0x400,%ecx
    2457:	b8 00 00 00 00       	mov    $0x0,%eax
    245c:	48 89 d7             	mov    %rdx,%rdi
    245f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    2462:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2469:	48 89 df             	mov    %rbx,%rdi
    246c:	f2 ae                	repnz scas %es:(%rdi),%al
    246e:	48 f7 d1             	not    %rcx
    2471:	48 8d 41 ff          	lea    -0x1(%rcx),%rax
    2475:	83 f9 01             	cmp    $0x1,%ecx
    2478:	0f 84 08 05 00 00    	je     2986 <submitr+0x68f>
    247e:	8d 40 ff             	lea    -0x1(%rax),%eax
    2481:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
    2486:	48 89 d5             	mov    %rdx,%rbp
    2489:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
    2490:	00 20 00 
    2493:	e9 a6 01 00 00       	jmpq   263e <submitr+0x347>
    2498:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    249f:	3a 20 43 
    24a2:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    24a9:	20 75 6e 
    24ac:	49 89 07             	mov    %rax,(%r15)
    24af:	49 89 57 08          	mov    %rdx,0x8(%r15)
    24b3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    24ba:	74 6f 20 
    24bd:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    24c4:	65 20 73 
    24c7:	49 89 47 10          	mov    %rax,0x10(%r15)
    24cb:	49 89 57 18          	mov    %rdx,0x18(%r15)
    24cf:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    24d6:	65 
    24d7:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    24de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24e3:	e9 16 03 00 00       	jmpq   27fe <submitr+0x507>
    24e8:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    24ef:	3a 20 44 
    24f2:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    24f9:	20 75 6e 
    24fc:	49 89 07             	mov    %rax,(%r15)
    24ff:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2503:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    250a:	74 6f 20 
    250d:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2514:	76 65 20 
    2517:	49 89 47 10          	mov    %rax,0x10(%r15)
    251b:	49 89 57 18          	mov    %rdx,0x18(%r15)
    251f:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2526:	72 20 61 
    2529:	49 89 47 20          	mov    %rax,0x20(%r15)
    252d:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    2534:	65 
    2535:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    253c:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    2541:	44 89 e7             	mov    %r12d,%edi
    2544:	e8 27 ed ff ff       	callq  1270 <close@plt>
    2549:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    254e:	e9 ab 02 00 00       	jmpq   27fe <submitr+0x507>
    2553:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    255a:	3a 20 55 
    255d:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    2564:	20 74 6f 
    2567:	49 89 07             	mov    %rax,(%r15)
    256a:	49 89 57 08          	mov    %rdx,0x8(%r15)
    256e:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    2575:	65 63 74 
    2578:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    257f:	68 65 20 
    2582:	49 89 47 10          	mov    %rax,0x10(%r15)
    2586:	49 89 57 18          	mov    %rdx,0x18(%r15)
    258a:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    2591:	76 
    2592:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    2599:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    259e:	44 89 e7             	mov    %r12d,%edi
    25a1:	e8 ca ec ff ff       	callq  1270 <close@plt>
    25a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    25ab:	e9 4e 02 00 00       	jmpq   27fe <submitr+0x507>
    25b0:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    25b7:	3a 20 52 
    25ba:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    25c1:	20 73 74 
    25c4:	49 89 07             	mov    %rax,(%r15)
    25c7:	49 89 57 08          	mov    %rdx,0x8(%r15)
    25cb:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    25d2:	74 6f 6f 
    25d5:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    25dc:	65 2e 20 
    25df:	49 89 47 10          	mov    %rax,0x10(%r15)
    25e3:	49 89 57 18          	mov    %rdx,0x18(%r15)
    25e7:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    25ee:	61 73 65 
    25f1:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    25f8:	49 54 52 
    25fb:	49 89 47 20          	mov    %rax,0x20(%r15)
    25ff:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2603:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    260a:	55 46 00 
    260d:	49 89 47 30          	mov    %rax,0x30(%r15)
    2611:	44 89 e7             	mov    %r12d,%edi
    2614:	e8 57 ec ff ff       	callq  1270 <close@plt>
    2619:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    261e:	e9 db 01 00 00       	jmpq   27fe <submitr+0x507>
    2623:	49 0f a3 c5          	bt     %rax,%r13
    2627:	73 21                	jae    264a <submitr+0x353>
    2629:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    262d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2631:	48 83 c3 01          	add    $0x1,%rbx
    2635:	4c 39 f3             	cmp    %r14,%rbx
    2638:	0f 84 48 03 00 00    	je     2986 <submitr+0x68f>
    263e:	44 0f b6 03          	movzbl (%rbx),%r8d
    2642:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
    2646:	3c 35                	cmp    $0x35,%al
    2648:	76 d9                	jbe    2623 <submitr+0x32c>
    264a:	44 89 c0             	mov    %r8d,%eax
    264d:	83 e0 df             	and    $0xffffffdf,%eax
    2650:	83 e8 41             	sub    $0x41,%eax
    2653:	3c 19                	cmp    $0x19,%al
    2655:	76 d2                	jbe    2629 <submitr+0x332>
    2657:	41 80 f8 20          	cmp    $0x20,%r8b
    265b:	74 63                	je     26c0 <submitr+0x3c9>
    265d:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    2661:	3c 5f                	cmp    $0x5f,%al
    2663:	76 0a                	jbe    266f <submitr+0x378>
    2665:	41 80 f8 09          	cmp    $0x9,%r8b
    2669:	0f 85 8a 02 00 00    	jne    28f9 <submitr+0x602>
    266f:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
    2676:	00 
    2677:	45 0f b6 c0          	movzbl %r8b,%r8d
    267b:	48 8d 0d f4 0f 00 00 	lea    0xff4(%rip),%rcx        # 3676 <array.3501+0x476>
    2682:	ba 08 00 00 00       	mov    $0x8,%edx
    2687:	be 01 00 00 00       	mov    $0x1,%esi
    268c:	b8 00 00 00 00       	mov    $0x0,%eax
    2691:	e8 ea ec ff ff       	callq  1380 <__sprintf_chk@plt>
    2696:	0f b6 84 24 50 80 00 	movzbl 0x8050(%rsp),%eax
    269d:	00 
    269e:	88 45 00             	mov    %al,0x0(%rbp)
    26a1:	0f b6 84 24 51 80 00 	movzbl 0x8051(%rsp),%eax
    26a8:	00 
    26a9:	88 45 01             	mov    %al,0x1(%rbp)
    26ac:	0f b6 84 24 52 80 00 	movzbl 0x8052(%rsp),%eax
    26b3:	00 
    26b4:	88 45 02             	mov    %al,0x2(%rbp)
    26b7:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    26bb:	e9 71 ff ff ff       	jmpq   2631 <submitr+0x33a>
    26c0:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    26c4:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    26c8:	e9 64 ff ff ff       	jmpq   2631 <submitr+0x33a>
    26cd:	48 01 c5             	add    %rax,%rbp
    26d0:	48 29 c3             	sub    %rax,%rbx
    26d3:	0f 84 25 03 00 00    	je     29fe <submitr+0x707>
    26d9:	48 89 da             	mov    %rbx,%rdx
    26dc:	48 89 ee             	mov    %rbp,%rsi
    26df:	44 89 e7             	mov    %r12d,%edi
    26e2:	e8 59 eb ff ff       	callq  1240 <write@plt>
    26e7:	48 85 c0             	test   %rax,%rax
    26ea:	7f e1                	jg     26cd <submitr+0x3d6>
    26ec:	e8 1f eb ff ff       	callq  1210 <__errno_location@plt>
    26f1:	83 38 04             	cmpl   $0x4,(%rax)
    26f4:	0f 85 a0 01 00 00    	jne    289a <submitr+0x5a3>
    26fa:	4c 89 e8             	mov    %r13,%rax
    26fd:	eb ce                	jmp    26cd <submitr+0x3d6>
    26ff:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2706:	3a 20 43 
    2709:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2710:	20 75 6e 
    2713:	49 89 07             	mov    %rax,(%r15)
    2716:	49 89 57 08          	mov    %rdx,0x8(%r15)
    271a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2721:	74 6f 20 
    2724:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    272b:	66 69 72 
    272e:	49 89 47 10          	mov    %rax,0x10(%r15)
    2732:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2736:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    273d:	61 64 65 
    2740:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    2747:	6d 20 73 
    274a:	49 89 47 20          	mov    %rax,0x20(%r15)
    274e:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2752:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    2759:	65 
    275a:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    2761:	44 89 e7             	mov    %r12d,%edi
    2764:	e8 07 eb ff ff       	callq  1270 <close@plt>
    2769:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    276e:	e9 8b 00 00 00       	jmpq   27fe <submitr+0x507>
    2773:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    277a:	00 
    277b:	48 8d 0d 46 0e 00 00 	lea    0xe46(%rip),%rcx        # 35c8 <array.3501+0x3c8>
    2782:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2789:	be 01 00 00 00       	mov    $0x1,%esi
    278e:	4c 89 ff             	mov    %r15,%rdi
    2791:	b8 00 00 00 00       	mov    $0x0,%eax
    2796:	e8 e5 eb ff ff       	callq  1380 <__sprintf_chk@plt>
    279b:	44 89 e7             	mov    %r12d,%edi
    279e:	e8 cd ea ff ff       	callq  1270 <close@plt>
    27a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    27a8:	eb 54                	jmp    27fe <submitr+0x507>
    27aa:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    27b1:	00 
    27b2:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    27b7:	ba 00 20 00 00       	mov    $0x2000,%edx
    27bc:	e8 6d fa ff ff       	callq  222e <rio_readlineb>
    27c1:	48 85 c0             	test   %rax,%rax
    27c4:	7e 61                	jle    2827 <submitr+0x530>
    27c6:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    27cd:	00 
    27ce:	4c 89 ff             	mov    %r15,%rdi
    27d1:	e8 4a ea ff ff       	callq  1220 <strcpy@plt>
    27d6:	44 89 e7             	mov    %r12d,%edi
    27d9:	e8 92 ea ff ff       	callq  1270 <close@plt>
    27de:	b9 03 00 00 00       	mov    $0x3,%ecx
    27e3:	48 8d 3d a7 0e 00 00 	lea    0xea7(%rip),%rdi        # 3691 <array.3501+0x491>
    27ea:	4c 89 fe             	mov    %r15,%rsi
    27ed:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    27ef:	0f 97 c0             	seta   %al
    27f2:	1c 00                	sbb    $0x0,%al
    27f4:	84 c0                	test   %al,%al
    27f6:	0f 95 c0             	setne  %al
    27f9:	0f b6 c0             	movzbl %al,%eax
    27fc:	f7 d8                	neg    %eax
    27fe:	48 8b 94 24 58 a0 00 	mov    0xa058(%rsp),%rdx
    2805:	00 
    2806:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    280d:	00 00 
    280f:	0f 85 0c 03 00 00    	jne    2b21 <submitr+0x82a>
    2815:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    281c:	5b                   	pop    %rbx
    281d:	5d                   	pop    %rbp
    281e:	41 5c                	pop    %r12
    2820:	41 5d                	pop    %r13
    2822:	41 5e                	pop    %r14
    2824:	41 5f                	pop    %r15
    2826:	c3                   	retq   
    2827:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    282e:	3a 20 43 
    2831:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2838:	20 75 6e 
    283b:	49 89 07             	mov    %rax,(%r15)
    283e:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2842:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2849:	74 6f 20 
    284c:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    2853:	73 74 61 
    2856:	49 89 47 10          	mov    %rax,0x10(%r15)
    285a:	49 89 57 18          	mov    %rdx,0x18(%r15)
    285e:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    2865:	65 73 73 
    2868:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    286f:	72 6f 6d 
    2872:	49 89 47 20          	mov    %rax,0x20(%r15)
    2876:	49 89 57 28          	mov    %rdx,0x28(%r15)
    287a:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    2881:	65 72 00 
    2884:	49 89 47 30          	mov    %rax,0x30(%r15)
    2888:	44 89 e7             	mov    %r12d,%edi
    288b:	e8 e0 e9 ff ff       	callq  1270 <close@plt>
    2890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2895:	e9 64 ff ff ff       	jmpq   27fe <submitr+0x507>
    289a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    28a1:	3a 20 43 
    28a4:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    28ab:	20 75 6e 
    28ae:	49 89 07             	mov    %rax,(%r15)
    28b1:	49 89 57 08          	mov    %rdx,0x8(%r15)
    28b5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    28bc:	74 6f 20 
    28bf:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    28c6:	20 74 6f 
    28c9:	49 89 47 10          	mov    %rax,0x10(%r15)
    28cd:	49 89 57 18          	mov    %rdx,0x18(%r15)
    28d1:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    28d8:	73 65 72 
    28db:	49 89 47 20          	mov    %rax,0x20(%r15)
    28df:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    28e6:	00 
    28e7:	44 89 e7             	mov    %r12d,%edi
    28ea:	e8 81 e9 ff ff       	callq  1270 <close@plt>
    28ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    28f4:	e9 05 ff ff ff       	jmpq   27fe <submitr+0x507>
    28f9:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2900:	3a 20 52 
    2903:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    290a:	20 73 74 
    290d:	49 89 07             	mov    %rax,(%r15)
    2910:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2914:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    291b:	63 6f 6e 
    291e:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    2925:	20 61 6e 
    2928:	49 89 47 10          	mov    %rax,0x10(%r15)
    292c:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2930:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2937:	67 61 6c 
    293a:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    2941:	6e 70 72 
    2944:	49 89 47 20          	mov    %rax,0x20(%r15)
    2948:	49 89 57 28          	mov    %rdx,0x28(%r15)
    294c:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    2953:	6c 65 20 
    2956:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    295d:	63 74 65 
    2960:	49 89 47 30          	mov    %rax,0x30(%r15)
    2964:	49 89 57 38          	mov    %rdx,0x38(%r15)
    2968:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    296f:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    2974:	44 89 e7             	mov    %r12d,%edi
    2977:	e8 f4 e8 ff ff       	callq  1270 <close@plt>
    297c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2981:	e9 78 fe ff ff       	jmpq   27fe <submitr+0x507>
    2986:	48 8d 9c 24 50 20 00 	lea    0x2050(%rsp),%rbx
    298d:	00 
    298e:	48 83 ec 08          	sub    $0x8,%rsp
    2992:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
    2999:	00 
    299a:	50                   	push   %rax
    299b:	ff 74 24 20          	pushq  0x20(%rsp)
    299f:	ff 74 24 30          	pushq  0x30(%rsp)
    29a3:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    29a8:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    29ad:	48 8d 0d 44 0c 00 00 	lea    0xc44(%rip),%rcx        # 35f8 <array.3501+0x3f8>
    29b4:	ba 00 20 00 00       	mov    $0x2000,%edx
    29b9:	be 01 00 00 00       	mov    $0x1,%esi
    29be:	48 89 df             	mov    %rbx,%rdi
    29c1:	b8 00 00 00 00       	mov    $0x0,%eax
    29c6:	e8 b5 e9 ff ff       	callq  1380 <__sprintf_chk@plt>
    29cb:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    29d2:	b8 00 00 00 00       	mov    $0x0,%eax
    29d7:	48 89 df             	mov    %rbx,%rdi
    29da:	f2 ae                	repnz scas %es:(%rdi),%al
    29dc:	48 f7 d1             	not    %rcx
    29df:	48 83 c4 20          	add    $0x20,%rsp
    29e3:	48 8d ac 24 50 20 00 	lea    0x2050(%rsp),%rbp
    29ea:	00 
    29eb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    29f1:	48 89 cb             	mov    %rcx,%rbx
    29f4:	48 83 eb 01          	sub    $0x1,%rbx
    29f8:	0f 85 db fc ff ff    	jne    26d9 <submitr+0x3e2>
    29fe:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
    2a03:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
    2a0a:	00 
    2a0b:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2a10:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
    2a15:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    2a1a:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2a21:	00 
    2a22:	ba 00 20 00 00       	mov    $0x2000,%edx
    2a27:	e8 02 f8 ff ff       	callq  222e <rio_readlineb>
    2a2c:	48 85 c0             	test   %rax,%rax
    2a2f:	0f 8e ca fc ff ff    	jle    26ff <submitr+0x408>
    2a35:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    2a3a:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    2a41:	00 
    2a42:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    2a49:	00 
    2a4a:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    2a51:	00 
    2a52:	48 8d 35 24 0c 00 00 	lea    0xc24(%rip),%rsi        # 367d <array.3501+0x47d>
    2a59:	b8 00 00 00 00       	mov    $0x0,%eax
    2a5e:	e8 8d e8 ff ff       	callq  12f0 <__isoc99_sscanf@plt>
    2a63:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    2a68:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    2a6f:	0f 85 fe fc ff ff    	jne    2773 <submitr+0x47c>
    2a75:	48 8d 1d 12 0c 00 00 	lea    0xc12(%rip),%rbx        # 368e <array.3501+0x48e>
    2a7c:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2a83:	00 
    2a84:	b9 03 00 00 00       	mov    $0x3,%ecx
    2a89:	48 89 df             	mov    %rbx,%rdi
    2a8c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2a8e:	0f 97 c0             	seta   %al
    2a91:	1c 00                	sbb    $0x0,%al
    2a93:	84 c0                	test   %al,%al
    2a95:	0f 84 0f fd ff ff    	je     27aa <submitr+0x4b3>
    2a9b:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2aa2:	00 
    2aa3:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2aa8:	ba 00 20 00 00       	mov    $0x2000,%edx
    2aad:	e8 7c f7 ff ff       	callq  222e <rio_readlineb>
    2ab2:	48 85 c0             	test   %rax,%rax
    2ab5:	7f c5                	jg     2a7c <submitr+0x785>
    2ab7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2abe:	3a 20 43 
    2ac1:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2ac8:	20 75 6e 
    2acb:	49 89 07             	mov    %rax,(%r15)
    2ace:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2ad2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2ad9:	74 6f 20 
    2adc:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2ae3:	68 65 61 
    2ae6:	49 89 47 10          	mov    %rax,0x10(%r15)
    2aea:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2aee:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    2af5:	66 72 6f 
    2af8:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    2aff:	76 65 72 
    2b02:	49 89 47 20          	mov    %rax,0x20(%r15)
    2b06:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2b0a:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    2b0f:	44 89 e7             	mov    %r12d,%edi
    2b12:	e8 59 e7 ff ff       	callq  1270 <close@plt>
    2b17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2b1c:	e9 dd fc ff ff       	jmpq   27fe <submitr+0x507>
    2b21:	e8 2a e7 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000002b26 <init_timeout>:
    2b26:	f3 0f 1e fa          	endbr64 
    2b2a:	85 ff                	test   %edi,%edi
    2b2c:	75 01                	jne    2b2f <init_timeout+0x9>
    2b2e:	c3                   	retq   
    2b2f:	53                   	push   %rbx
    2b30:	89 fb                	mov    %edi,%ebx
    2b32:	48 8d 35 bf f6 ff ff 	lea    -0x941(%rip),%rsi        # 21f8 <sigalrm_handler>
    2b39:	bf 0e 00 00 00       	mov    $0xe,%edi
    2b3e:	e8 5d e7 ff ff       	callq  12a0 <signal@plt>
    2b43:	85 db                	test   %ebx,%ebx
    2b45:	bf 00 00 00 00       	mov    $0x0,%edi
    2b4a:	0f 49 fb             	cmovns %ebx,%edi
    2b4d:	e8 0e e7 ff ff       	callq  1260 <alarm@plt>
    2b52:	5b                   	pop    %rbx
    2b53:	c3                   	retq   

0000000000002b54 <init_driver>:
    2b54:	f3 0f 1e fa          	endbr64 
    2b58:	41 54                	push   %r12
    2b5a:	55                   	push   %rbp
    2b5b:	53                   	push   %rbx
    2b5c:	48 83 ec 20          	sub    $0x20,%rsp
    2b60:	48 89 fd             	mov    %rdi,%rbp
    2b63:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2b6a:	00 00 
    2b6c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2b71:	31 c0                	xor    %eax,%eax
    2b73:	be 01 00 00 00       	mov    $0x1,%esi
    2b78:	bf 0d 00 00 00       	mov    $0xd,%edi
    2b7d:	e8 1e e7 ff ff       	callq  12a0 <signal@plt>
    2b82:	be 01 00 00 00       	mov    $0x1,%esi
    2b87:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2b8c:	e8 0f e7 ff ff       	callq  12a0 <signal@plt>
    2b91:	be 01 00 00 00       	mov    $0x1,%esi
    2b96:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2b9b:	e8 00 e7 ff ff       	callq  12a0 <signal@plt>
    2ba0:	ba 00 00 00 00       	mov    $0x0,%edx
    2ba5:	be 01 00 00 00       	mov    $0x1,%esi
    2baa:	bf 02 00 00 00       	mov    $0x2,%edi
    2baf:	e8 dc e7 ff ff       	callq  1390 <socket@plt>
    2bb4:	85 c0                	test   %eax,%eax
    2bb6:	0f 88 9c 00 00 00    	js     2c58 <init_driver+0x104>
    2bbc:	89 c3                	mov    %eax,%ebx
    2bbe:	48 8d 3d 32 09 00 00 	lea    0x932(%rip),%rdi        # 34f7 <array.3501+0x2f7>
    2bc5:	e8 e6 e6 ff ff       	callq  12b0 <gethostbyname@plt>
    2bca:	48 85 c0             	test   %rax,%rax
    2bcd:	0f 84 d1 00 00 00    	je     2ca4 <init_driver+0x150>
    2bd3:	49 89 e4             	mov    %rsp,%r12
    2bd6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2bdd:	00 
    2bde:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    2be5:	00 00 
    2be7:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    2bed:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2bf1:	48 8b 40 18          	mov    0x18(%rax),%rax
    2bf5:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    2bfa:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2bff:	48 8b 30             	mov    (%rax),%rsi
    2c02:	e8 b9 e6 ff ff       	callq  12c0 <__memmove_chk@plt>
    2c07:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
    2c0e:	ba 10 00 00 00       	mov    $0x10,%edx
    2c13:	4c 89 e6             	mov    %r12,%rsi
    2c16:	89 df                	mov    %ebx,%edi
    2c18:	e8 23 e7 ff ff       	callq  1340 <connect@plt>
    2c1d:	85 c0                	test   %eax,%eax
    2c1f:	0f 88 e7 00 00 00    	js     2d0c <init_driver+0x1b8>
    2c25:	89 df                	mov    %ebx,%edi
    2c27:	e8 44 e6 ff ff       	callq  1270 <close@plt>
    2c2c:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    2c32:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    2c36:	b8 00 00 00 00       	mov    $0x0,%eax
    2c3b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    2c40:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2c47:	00 00 
    2c49:	0f 85 f5 00 00 00    	jne    2d44 <init_driver+0x1f0>
    2c4f:	48 83 c4 20          	add    $0x20,%rsp
    2c53:	5b                   	pop    %rbx
    2c54:	5d                   	pop    %rbp
    2c55:	41 5c                	pop    %r12
    2c57:	c3                   	retq   
    2c58:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2c5f:	3a 20 43 
    2c62:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2c69:	20 75 6e 
    2c6c:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2c70:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2c74:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2c7b:	74 6f 20 
    2c7e:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2c85:	65 20 73 
    2c88:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2c8c:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2c90:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2c97:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2c9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ca2:	eb 97                	jmp    2c3b <init_driver+0xe7>
    2ca4:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2cab:	3a 20 44 
    2cae:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2cb5:	20 75 6e 
    2cb8:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2cbc:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2cc0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2cc7:	74 6f 20 
    2cca:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2cd1:	76 65 20 
    2cd4:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2cd8:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2cdc:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2ce3:	72 20 61 
    2ce6:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2cea:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    2cf1:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    2cf7:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    2cfb:	89 df                	mov    %ebx,%edi
    2cfd:	e8 6e e5 ff ff       	callq  1270 <close@plt>
    2d02:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2d07:	e9 2f ff ff ff       	jmpq   2c3b <init_driver+0xe7>
    2d0c:	4c 8d 05 e4 07 00 00 	lea    0x7e4(%rip),%r8        # 34f7 <array.3501+0x2f7>
    2d13:	48 8d 0d 36 09 00 00 	lea    0x936(%rip),%rcx        # 3650 <array.3501+0x450>
    2d1a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2d21:	be 01 00 00 00       	mov    $0x1,%esi
    2d26:	48 89 ef             	mov    %rbp,%rdi
    2d29:	b8 00 00 00 00       	mov    $0x0,%eax
    2d2e:	e8 4d e6 ff ff       	callq  1380 <__sprintf_chk@plt>
    2d33:	89 df                	mov    %ebx,%edi
    2d35:	e8 36 e5 ff ff       	callq  1270 <close@plt>
    2d3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2d3f:	e9 f7 fe ff ff       	jmpq   2c3b <init_driver+0xe7>
    2d44:	e8 07 e5 ff ff       	callq  1250 <__stack_chk_fail@plt>

0000000000002d49 <driver_post>:
    2d49:	f3 0f 1e fa          	endbr64 
    2d4d:	53                   	push   %rbx
    2d4e:	4c 89 c3             	mov    %r8,%rbx
    2d51:	85 c9                	test   %ecx,%ecx
    2d53:	75 17                	jne    2d6c <driver_post+0x23>
    2d55:	48 85 ff             	test   %rdi,%rdi
    2d58:	74 05                	je     2d5f <driver_post+0x16>
    2d5a:	80 3f 00             	cmpb   $0x0,(%rdi)
    2d5d:	75 33                	jne    2d92 <driver_post+0x49>
    2d5f:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2d64:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2d68:	89 c8                	mov    %ecx,%eax
    2d6a:	5b                   	pop    %rbx
    2d6b:	c3                   	retq   
    2d6c:	48 8d 35 21 09 00 00 	lea    0x921(%rip),%rsi        # 3694 <array.3501+0x494>
    2d73:	bf 01 00 00 00       	mov    $0x1,%edi
    2d78:	b8 00 00 00 00       	mov    $0x0,%eax
    2d7d:	e8 7e e5 ff ff       	callq  1300 <__printf_chk@plt>
    2d82:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    2d87:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    2d8b:	b8 00 00 00 00       	mov    $0x0,%eax
    2d90:	eb d8                	jmp    2d6a <driver_post+0x21>
    2d92:	41 50                	push   %r8
    2d94:	52                   	push   %rdx
    2d95:	4c 8d 0d 0f 09 00 00 	lea    0x90f(%rip),%r9        # 36ab <array.3501+0x4ab>
    2d9c:	49 89 f0             	mov    %rsi,%r8
    2d9f:	48 89 f9             	mov    %rdi,%rcx
    2da2:	48 8d 15 0c 09 00 00 	lea    0x90c(%rip),%rdx        # 36b5 <array.3501+0x4b5>
    2da9:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
    2dae:	48 8d 3d 42 07 00 00 	lea    0x742(%rip),%rdi        # 34f7 <array.3501+0x2f7>
    2db5:	e8 3d f5 ff ff       	callq  22f7 <submitr>
    2dba:	48 83 c4 10          	add    $0x10,%rsp
    2dbe:	eb aa                	jmp    2d6a <driver_post+0x21>

0000000000002dc0 <__libc_csu_init>:
    2dc0:	f3 0f 1e fa          	endbr64 
    2dc4:	41 57                	push   %r15
    2dc6:	4c 8d 3d 1b 2f 00 00 	lea    0x2f1b(%rip),%r15        # 5ce8 <__frame_dummy_init_array_entry>
    2dcd:	41 56                	push   %r14
    2dcf:	49 89 d6             	mov    %rdx,%r14
    2dd2:	41 55                	push   %r13
    2dd4:	49 89 f5             	mov    %rsi,%r13
    2dd7:	41 54                	push   %r12
    2dd9:	41 89 fc             	mov    %edi,%r12d
    2ddc:	55                   	push   %rbp
    2ddd:	48 8d 2d 0c 2f 00 00 	lea    0x2f0c(%rip),%rbp        # 5cf0 <__do_global_dtors_aux_fini_array_entry>
    2de4:	53                   	push   %rbx
    2de5:	4c 29 fd             	sub    %r15,%rbp
    2de8:	48 83 ec 08          	sub    $0x8,%rsp
    2dec:	e8 0f e2 ff ff       	callq  1000 <_init>
    2df1:	48 c1 fd 03          	sar    $0x3,%rbp
    2df5:	74 1f                	je     2e16 <__libc_csu_init+0x56>
    2df7:	31 db                	xor    %ebx,%ebx
    2df9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2e00:	4c 89 f2             	mov    %r14,%rdx
    2e03:	4c 89 ee             	mov    %r13,%rsi
    2e06:	44 89 e7             	mov    %r12d,%edi
    2e09:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    2e0d:	48 83 c3 01          	add    $0x1,%rbx
    2e11:	48 39 dd             	cmp    %rbx,%rbp
    2e14:	75 ea                	jne    2e00 <__libc_csu_init+0x40>
    2e16:	48 83 c4 08          	add    $0x8,%rsp
    2e1a:	5b                   	pop    %rbx
    2e1b:	5d                   	pop    %rbp
    2e1c:	41 5c                	pop    %r12
    2e1e:	41 5d                	pop    %r13
    2e20:	41 5e                	pop    %r14
    2e22:	41 5f                	pop    %r15
    2e24:	c3                   	retq   
    2e25:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    2e2c:	00 00 00 00 

0000000000002e30 <__libc_csu_fini>:
    2e30:	f3 0f 1e fa          	endbr64 
    2e34:	c3                   	retq   

Disassembly of section .fini:

0000000000002e38 <_fini>:
    2e38:	f3 0f 1e fa          	endbr64 
    2e3c:	48 83 ec 08          	sub    $0x8,%rsp
    2e40:	48 83 c4 08          	add    $0x8,%rsp
    2e44:	c3                   	retq   
