
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 7c 32 00 00       	call   1032a8 <memset>

    cons_init();                // init the console
  10002c:	e8 57 15 00 00       	call   101588 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 40 34 10 00 	movl   $0x103440,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 5c 34 10 00 	movl   $0x10345c,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 94 28 00 00       	call   1028ee <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 6c 16 00 00       	call   1016cb <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 e4 17 00 00       	call   101848 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 12 0d 00 00       	call   100d7b <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 cb 15 00 00       	call   101639 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 1b 0c 00 00       	call   100cad <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 24 ea 10 00       	mov    0x10ea24,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 61 34 10 00 	movl   $0x103461,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 24 ea 10 00       	mov    0x10ea24,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 6f 34 10 00 	movl   $0x10346f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 24 ea 10 00       	mov    0x10ea24,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 7d 34 10 00 	movl   $0x10347d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 24 ea 10 00       	mov    0x10ea24,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 8b 34 10 00 	movl   $0x10348b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 24 ea 10 00       	mov    0x10ea24,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 99 34 10 00 	movl   $0x103499,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 24 ea 10 00       	mov    0x10ea24,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 24 ea 10 00       	mov    %eax,0x10ea24
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 a8 34 10 00 	movl   $0x1034a8,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 c8 34 10 00 	movl   $0x1034c8,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 e7 34 10 00 	movl   $0x1034e7,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 e4 12 00 00       	call   1015b4 <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 b4 27 00 00       	call   102ac1 <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 6b 12 00 00       	call   1015b4 <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 38 12 00 00       	call   1015dd <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 ec 34 10 00    	movl   $0x1034ec,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 ec 34 10 00 	movl   $0x1034ec,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 6c 3d 10 00 	movl   $0x103d6c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 00 b5 10 00 	movl   $0x10b500,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 01 b5 10 00 	movl   $0x10b501,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 31 d5 10 00 	movl   $0x10d531,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 5a 2a 00 00       	call   10311c <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 f6 34 10 00 	movl   $0x1034f6,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 0f 35 10 00 	movl   $0x10350f,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 31 34 10 	movl   $0x103431,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 27 35 10 00 	movl   $0x103527,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 3f 35 10 00 	movl   $0x10353f,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 57 35 10 00 	movl   $0x103557,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 70 35 10 00 	movl   $0x103570,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 9a 35 10 00 	movl   $0x10359a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 b6 35 10 00 	movl   $0x1035b6,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 58             	sub    $0x58,%esp
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	struct eipdebuginfo info;
	uint32_t curr_arg, offset, ix, count, eip, ebp;
	uint8_t  flag = 1;
  100996:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
	eip = read_eip();
  10099a:	e8 e0 ff ff ff       	call   10097f <read_eip>
  10099f:	89 45 ec             	mov    %eax,-0x14(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  1009a2:	89 e8                	mov    %ebp,%eax
  1009a4:	89 45 d8             	mov    %eax,-0x28(%ebp)
    return ebp;
  1009a7:	8b 45 d8             	mov    -0x28(%ebp),%eax
	ebp = read_ebp();
  1009aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
	for(ix = 0; ix != STACKFRAME_DEPTH && flag;ix++){
  1009ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009b4:	e9 a7 00 00 00       	jmp    100a60 <print_stackframe+0xd0>
		cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
  1009b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009bc:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c7:	c7 04 24 c8 35 10 00 	movl   $0x1035c8,(%esp)
  1009ce:	e8 3f f9 ff ff       	call   100312 <cprintf>
		
		if(debuginfo_eip(eip, &info) != 0)
  1009d3:	8d 45 c0             	lea    -0x40(%ebp),%eax
  1009d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009dd:	89 04 24             	mov    %eax,(%esp)
  1009e0:	e8 24 fb ff ff       	call   100509 <debuginfo_eip>
  1009e5:	85 c0                	test   %eax,%eax
  1009e7:	74 04                	je     1009ed <print_stackframe+0x5d>
			 flag = 0;
  1009e9:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
		for(count = 0; count != info.eip_fn_narg; count++){
  1009ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1009f4:	eb 36                	jmp    100a2c <print_stackframe+0x9c>
			offset = 8 + 4 * count;
  1009f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009f9:	83 c0 02             	add    $0x2,%eax
  1009fc:	c1 e0 02             	shl    $0x2,%eax
  1009ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
			asm volatile("addl %1, %0":"+r"(offset): "r"(ebp)); 
  100a02:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100a05:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a08:	01 d0                	add    %edx,%eax
  100a0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
			asm volatile("movl (%1), %0" : "=r"(curr_arg): "r"(offset));
  100a0d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a10:	8b 00                	mov    (%eax),%eax
  100a12:	89 45 dc             	mov    %eax,-0x24(%ebp)
			cprintf(" 0x%08x", curr_arg);
  100a15:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a1c:	c7 04 24 df 35 10 00 	movl   $0x1035df,(%esp)
  100a23:	e8 ea f8 ff ff       	call   100312 <cprintf>
	for(ix = 0; ix != STACKFRAME_DEPTH && flag;ix++){
		cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
		
		if(debuginfo_eip(eip, &info) != 0)
			 flag = 0;
		for(count = 0; count != info.eip_fn_narg; count++){
  100a28:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  100a2c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100a2f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  100a32:	75 c2                	jne    1009f6 <print_stackframe+0x66>
			offset = 8 + 4 * count;
			asm volatile("addl %1, %0":"+r"(offset): "r"(ebp)); 
			asm volatile("movl (%1), %0" : "=r"(curr_arg): "r"(offset));
			cprintf(" 0x%08x", curr_arg);
		}
		cprintf("\n");
  100a34:	c7 04 24 e7 35 10 00 	movl   $0x1035e7,(%esp)
  100a3b:	e8 d2 f8 ff ff       	call   100312 <cprintf>
		
		print_debuginfo(eip);
  100a40:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a43:	89 04 24             	mov    %eax,(%esp)
  100a46:	e8 91 fe ff ff       	call   1008dc <print_debuginfo>
		
		asm volatile("movl 4(%1), %0":"=r"(eip):"r"(ebp));
  100a4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a4e:	8b 40 04             	mov    0x4(%eax),%eax
  100a51:	89 45 ec             	mov    %eax,-0x14(%ebp)
		asm volatile("movl (%1), %0":"=r"(ebp):"r"(ebp));
  100a54:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a57:	8b 00                	mov    (%eax),%eax
  100a59:	89 45 e8             	mov    %eax,-0x18(%ebp)
	struct eipdebuginfo info;
	uint32_t curr_arg, offset, ix, count, eip, ebp;
	uint8_t  flag = 1;
	eip = read_eip();
	ebp = read_ebp();
	for(ix = 0; ix != STACKFRAME_DEPTH && flag;ix++){
  100a5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100a60:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
  100a64:	74 0a                	je     100a70 <print_stackframe+0xe0>
  100a66:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
  100a6a:	0f 85 49 ff ff ff    	jne    1009b9 <print_stackframe+0x29>
		print_debuginfo(eip);
		
		asm volatile("movl 4(%1), %0":"=r"(eip):"r"(ebp));
		asm volatile("movl (%1), %0":"=r"(ebp):"r"(ebp));
	}	
}
  100a70:	c9                   	leave  
  100a71:	c3                   	ret    

00100a72 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a72:	55                   	push   %ebp
  100a73:	89 e5                	mov    %esp,%ebp
  100a75:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a7f:	eb 0c                	jmp    100a8d <parse+0x1b>
            *buf ++ = '\0';
  100a81:	8b 45 08             	mov    0x8(%ebp),%eax
  100a84:	8d 50 01             	lea    0x1(%eax),%edx
  100a87:	89 55 08             	mov    %edx,0x8(%ebp)
  100a8a:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  100a90:	0f b6 00             	movzbl (%eax),%eax
  100a93:	84 c0                	test   %al,%al
  100a95:	74 1d                	je     100ab4 <parse+0x42>
  100a97:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9a:	0f b6 00             	movzbl (%eax),%eax
  100a9d:	0f be c0             	movsbl %al,%eax
  100aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100aa4:	c7 04 24 6c 36 10 00 	movl   $0x10366c,(%esp)
  100aab:	e8 39 26 00 00       	call   1030e9 <strchr>
  100ab0:	85 c0                	test   %eax,%eax
  100ab2:	75 cd                	jne    100a81 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100ab4:	8b 45 08             	mov    0x8(%ebp),%eax
  100ab7:	0f b6 00             	movzbl (%eax),%eax
  100aba:	84 c0                	test   %al,%al
  100abc:	75 02                	jne    100ac0 <parse+0x4e>
            break;
  100abe:	eb 67                	jmp    100b27 <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ac0:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ac4:	75 14                	jne    100ada <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100ac6:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100acd:	00 
  100ace:	c7 04 24 71 36 10 00 	movl   $0x103671,(%esp)
  100ad5:	e8 38 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100add:	8d 50 01             	lea    0x1(%eax),%edx
  100ae0:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ae3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aea:	8b 45 0c             	mov    0xc(%ebp),%eax
  100aed:	01 c2                	add    %eax,%edx
  100aef:	8b 45 08             	mov    0x8(%ebp),%eax
  100af2:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100af4:	eb 04                	jmp    100afa <parse+0x88>
            buf ++;
  100af6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100afa:	8b 45 08             	mov    0x8(%ebp),%eax
  100afd:	0f b6 00             	movzbl (%eax),%eax
  100b00:	84 c0                	test   %al,%al
  100b02:	74 1d                	je     100b21 <parse+0xaf>
  100b04:	8b 45 08             	mov    0x8(%ebp),%eax
  100b07:	0f b6 00             	movzbl (%eax),%eax
  100b0a:	0f be c0             	movsbl %al,%eax
  100b0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b11:	c7 04 24 6c 36 10 00 	movl   $0x10366c,(%esp)
  100b18:	e8 cc 25 00 00       	call   1030e9 <strchr>
  100b1d:	85 c0                	test   %eax,%eax
  100b1f:	74 d5                	je     100af6 <parse+0x84>
            buf ++;
        }
    }
  100b21:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b22:	e9 66 ff ff ff       	jmp    100a8d <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b2a:	c9                   	leave  
  100b2b:	c3                   	ret    

00100b2c <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b2c:	55                   	push   %ebp
  100b2d:	89 e5                	mov    %esp,%ebp
  100b2f:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b32:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b35:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b39:	8b 45 08             	mov    0x8(%ebp),%eax
  100b3c:	89 04 24             	mov    %eax,(%esp)
  100b3f:	e8 2e ff ff ff       	call   100a72 <parse>
  100b44:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b4b:	75 0a                	jne    100b57 <runcmd+0x2b>
        return 0;
  100b4d:	b8 00 00 00 00       	mov    $0x0,%eax
  100b52:	e9 85 00 00 00       	jmp    100bdc <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b5e:	eb 5c                	jmp    100bbc <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b60:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b63:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b66:	89 d0                	mov    %edx,%eax
  100b68:	01 c0                	add    %eax,%eax
  100b6a:	01 d0                	add    %edx,%eax
  100b6c:	c1 e0 02             	shl    $0x2,%eax
  100b6f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b74:	8b 00                	mov    (%eax),%eax
  100b76:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b7a:	89 04 24             	mov    %eax,(%esp)
  100b7d:	e8 c8 24 00 00       	call   10304a <strcmp>
  100b82:	85 c0                	test   %eax,%eax
  100b84:	75 32                	jne    100bb8 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b86:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b89:	89 d0                	mov    %edx,%eax
  100b8b:	01 c0                	add    %eax,%eax
  100b8d:	01 d0                	add    %edx,%eax
  100b8f:	c1 e0 02             	shl    $0x2,%eax
  100b92:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b97:	8b 40 08             	mov    0x8(%eax),%eax
  100b9a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b9d:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100ba0:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ba3:	89 54 24 08          	mov    %edx,0x8(%esp)
  100ba7:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100baa:	83 c2 04             	add    $0x4,%edx
  100bad:	89 54 24 04          	mov    %edx,0x4(%esp)
  100bb1:	89 0c 24             	mov    %ecx,(%esp)
  100bb4:	ff d0                	call   *%eax
  100bb6:	eb 24                	jmp    100bdc <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bb8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100bbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bbf:	83 f8 02             	cmp    $0x2,%eax
  100bc2:	76 9c                	jbe    100b60 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100bc4:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100bc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bcb:	c7 04 24 8f 36 10 00 	movl   $0x10368f,(%esp)
  100bd2:	e8 3b f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bd7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bdc:	c9                   	leave  
  100bdd:	c3                   	ret    

00100bde <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bde:	55                   	push   %ebp
  100bdf:	89 e5                	mov    %esp,%ebp
  100be1:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100be4:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100beb:	e8 22 f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bf0:	c7 04 24 d0 36 10 00 	movl   $0x1036d0,(%esp)
  100bf7:	e8 16 f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100bfc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c00:	74 0b                	je     100c0d <kmonitor+0x2f>
        print_trapframe(tf);
  100c02:	8b 45 08             	mov    0x8(%ebp),%eax
  100c05:	89 04 24             	mov    %eax,(%esp)
  100c08:	e8 7c 0d 00 00       	call   101989 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c0d:	c7 04 24 f5 36 10 00 	movl   $0x1036f5,(%esp)
  100c14:	e8 f0 f5 ff ff       	call   100209 <readline>
  100c19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c20:	74 18                	je     100c3a <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100c22:	8b 45 08             	mov    0x8(%ebp),%eax
  100c25:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c2c:	89 04 24             	mov    %eax,(%esp)
  100c2f:	e8 f8 fe ff ff       	call   100b2c <runcmd>
  100c34:	85 c0                	test   %eax,%eax
  100c36:	79 02                	jns    100c3a <kmonitor+0x5c>
                break;
  100c38:	eb 02                	jmp    100c3c <kmonitor+0x5e>
            }
        }
    }
  100c3a:	eb d1                	jmp    100c0d <kmonitor+0x2f>
}
  100c3c:	c9                   	leave  
  100c3d:	c3                   	ret    

00100c3e <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c3e:	55                   	push   %ebp
  100c3f:	89 e5                	mov    %esp,%ebp
  100c41:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c4b:	eb 3f                	jmp    100c8c <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c4d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c50:	89 d0                	mov    %edx,%eax
  100c52:	01 c0                	add    %eax,%eax
  100c54:	01 d0                	add    %edx,%eax
  100c56:	c1 e0 02             	shl    $0x2,%eax
  100c59:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c5e:	8b 48 04             	mov    0x4(%eax),%ecx
  100c61:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c64:	89 d0                	mov    %edx,%eax
  100c66:	01 c0                	add    %eax,%eax
  100c68:	01 d0                	add    %edx,%eax
  100c6a:	c1 e0 02             	shl    $0x2,%eax
  100c6d:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c72:	8b 00                	mov    (%eax),%eax
  100c74:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c78:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c7c:	c7 04 24 f9 36 10 00 	movl   $0x1036f9,(%esp)
  100c83:	e8 8a f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c88:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c8f:	83 f8 02             	cmp    $0x2,%eax
  100c92:	76 b9                	jbe    100c4d <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c94:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c99:	c9                   	leave  
  100c9a:	c3                   	ret    

00100c9b <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c9b:	55                   	push   %ebp
  100c9c:	89 e5                	mov    %esp,%ebp
  100c9e:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100ca1:	e8 a0 fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100ca6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cab:	c9                   	leave  
  100cac:	c3                   	ret    

00100cad <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100cad:	55                   	push   %ebp
  100cae:	89 e5                	mov    %esp,%ebp
  100cb0:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100cb3:	e8 d8 fc ff ff       	call   100990 <print_stackframe>
    return 0;
  100cb8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cbd:	c9                   	leave  
  100cbe:	c3                   	ret    

00100cbf <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100cbf:	55                   	push   %ebp
  100cc0:	89 e5                	mov    %esp,%ebp
  100cc2:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100cc5:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100cca:	85 c0                	test   %eax,%eax
  100ccc:	74 02                	je     100cd0 <__panic+0x11>
        goto panic_dead;
  100cce:	eb 48                	jmp    100d18 <__panic+0x59>
    }
    is_panic = 1;
  100cd0:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cd7:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cda:	8d 45 14             	lea    0x14(%ebp),%eax
  100cdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100ce0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ce3:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cea:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cee:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  100cf5:	e8 18 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cfd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d01:	8b 45 10             	mov    0x10(%ebp),%eax
  100d04:	89 04 24             	mov    %eax,(%esp)
  100d07:	e8 d3 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d0c:	c7 04 24 1e 37 10 00 	movl   $0x10371e,(%esp)
  100d13:	e8 fa f5 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100d18:	e8 22 09 00 00       	call   10163f <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d1d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d24:	e8 b5 fe ff ff       	call   100bde <kmonitor>
    }
  100d29:	eb f2                	jmp    100d1d <__panic+0x5e>

00100d2b <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d2b:	55                   	push   %ebp
  100d2c:	89 e5                	mov    %esp,%ebp
  100d2e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d31:	8d 45 14             	lea    0x14(%ebp),%eax
  100d34:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d37:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d3a:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d3e:	8b 45 08             	mov    0x8(%ebp),%eax
  100d41:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d45:	c7 04 24 20 37 10 00 	movl   $0x103720,(%esp)
  100d4c:	e8 c1 f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d54:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d58:	8b 45 10             	mov    0x10(%ebp),%eax
  100d5b:	89 04 24             	mov    %eax,(%esp)
  100d5e:	e8 7c f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d63:	c7 04 24 1e 37 10 00 	movl   $0x10371e,(%esp)
  100d6a:	e8 a3 f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d6f:	c9                   	leave  
  100d70:	c3                   	ret    

00100d71 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d71:	55                   	push   %ebp
  100d72:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d74:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d79:	5d                   	pop    %ebp
  100d7a:	c3                   	ret    

00100d7b <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d7b:	55                   	push   %ebp
  100d7c:	89 e5                	mov    %esp,%ebp
  100d7e:	83 ec 28             	sub    $0x28,%esp
  100d81:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d87:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d8b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d8f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d93:	ee                   	out    %al,(%dx)
  100d94:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d9a:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d9e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100da2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100da6:	ee                   	out    %al,(%dx)
  100da7:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100dad:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100db1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100db5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100db9:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dba:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100dc1:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dc4:	c7 04 24 3e 37 10 00 	movl   $0x10373e,(%esp)
  100dcb:	e8 42 f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100dd0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dd7:	e8 c1 08 00 00       	call   10169d <pic_enable>
}
  100ddc:	c9                   	leave  
  100ddd:	c3                   	ret    

00100dde <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dde:	55                   	push   %ebp
  100ddf:	89 e5                	mov    %esp,%ebp
  100de1:	83 ec 10             	sub    $0x10,%esp
  100de4:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dea:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dee:	89 c2                	mov    %eax,%edx
  100df0:	ec                   	in     (%dx),%al
  100df1:	88 45 fd             	mov    %al,-0x3(%ebp)
  100df4:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dfa:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dfe:	89 c2                	mov    %eax,%edx
  100e00:	ec                   	in     (%dx),%al
  100e01:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e04:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e0a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e0e:	89 c2                	mov    %eax,%edx
  100e10:	ec                   	in     (%dx),%al
  100e11:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e14:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100e1a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e1e:	89 c2                	mov    %eax,%edx
  100e20:	ec                   	in     (%dx),%al
  100e21:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e24:	c9                   	leave  
  100e25:	c3                   	ret    

00100e26 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e26:	55                   	push   %ebp
  100e27:	89 e5                	mov    %esp,%ebp
  100e29:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e2c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e33:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e36:	0f b7 00             	movzwl (%eax),%eax
  100e39:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e40:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e45:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e48:	0f b7 00             	movzwl (%eax),%eax
  100e4b:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e4f:	74 12                	je     100e63 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e51:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e58:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e5f:	b4 03 
  100e61:	eb 13                	jmp    100e76 <cga_init+0x50>
    } else {
        *cp = was;
  100e63:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e66:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e6a:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e6d:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e74:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e76:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e7d:	0f b7 c0             	movzwl %ax,%eax
  100e80:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e84:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e88:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e8c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e90:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e91:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e98:	83 c0 01             	add    $0x1,%eax
  100e9b:	0f b7 c0             	movzwl %ax,%eax
  100e9e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ea2:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ea6:	89 c2                	mov    %eax,%edx
  100ea8:	ec                   	in     (%dx),%al
  100ea9:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100eac:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100eb0:	0f b6 c0             	movzbl %al,%eax
  100eb3:	c1 e0 08             	shl    $0x8,%eax
  100eb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100eb9:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec0:	0f b7 c0             	movzwl %ax,%eax
  100ec3:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100ec7:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ecb:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ecf:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ed3:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100ed4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100edb:	83 c0 01             	add    $0x1,%eax
  100ede:	0f b7 c0             	movzwl %ax,%eax
  100ee1:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee5:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ee9:	89 c2                	mov    %eax,%edx
  100eeb:	ec                   	in     (%dx),%al
  100eec:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100eef:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ef3:	0f b6 c0             	movzbl %al,%eax
  100ef6:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ef9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100efc:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100f01:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f04:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100f0a:	c9                   	leave  
  100f0b:	c3                   	ret    

00100f0c <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f0c:	55                   	push   %ebp
  100f0d:	89 e5                	mov    %esp,%ebp
  100f0f:	83 ec 48             	sub    $0x48,%esp
  100f12:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f18:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f1c:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f20:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f24:	ee                   	out    %al,(%dx)
  100f25:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f2b:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f2f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f33:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f37:	ee                   	out    %al,(%dx)
  100f38:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f3e:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f42:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f46:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f4a:	ee                   	out    %al,(%dx)
  100f4b:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f51:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f55:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f59:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f5d:	ee                   	out    %al,(%dx)
  100f5e:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f64:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f68:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f6c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f70:	ee                   	out    %al,(%dx)
  100f71:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f77:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f7b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f7f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f83:	ee                   	out    %al,(%dx)
  100f84:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f8a:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f8e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f92:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f96:	ee                   	out    %al,(%dx)
  100f97:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f9d:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100fa1:	89 c2                	mov    %eax,%edx
  100fa3:	ec                   	in     (%dx),%al
  100fa4:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100fa7:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fab:	3c ff                	cmp    $0xff,%al
  100fad:	0f 95 c0             	setne  %al
  100fb0:	0f b6 c0             	movzbl %al,%eax
  100fb3:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fb8:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fbe:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100fc2:	89 c2                	mov    %eax,%edx
  100fc4:	ec                   	in     (%dx),%al
  100fc5:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fc8:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fce:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fd2:	89 c2                	mov    %eax,%edx
  100fd4:	ec                   	in     (%dx),%al
  100fd5:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fd8:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fdd:	85 c0                	test   %eax,%eax
  100fdf:	74 0c                	je     100fed <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fe1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fe8:	e8 b0 06 00 00       	call   10169d <pic_enable>
    }
}
  100fed:	c9                   	leave  
  100fee:	c3                   	ret    

00100fef <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fef:	55                   	push   %ebp
  100ff0:	89 e5                	mov    %esp,%ebp
  100ff2:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100ffc:	eb 09                	jmp    101007 <lpt_putc_sub+0x18>
        delay();
  100ffe:	e8 db fd ff ff       	call   100dde <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101003:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101007:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10100d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101011:	89 c2                	mov    %eax,%edx
  101013:	ec                   	in     (%dx),%al
  101014:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101017:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10101b:	84 c0                	test   %al,%al
  10101d:	78 09                	js     101028 <lpt_putc_sub+0x39>
  10101f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101026:	7e d6                	jle    100ffe <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  101028:	8b 45 08             	mov    0x8(%ebp),%eax
  10102b:	0f b6 c0             	movzbl %al,%eax
  10102e:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101034:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101037:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10103b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10103f:	ee                   	out    %al,(%dx)
  101040:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101046:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10104a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10104e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101052:	ee                   	out    %al,(%dx)
  101053:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101059:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  10105d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101061:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101065:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101066:	c9                   	leave  
  101067:	c3                   	ret    

00101068 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
// lpt for Line Printer Terminal, is the original name of parallel port
static void
lpt_putc(int c) {
  101068:	55                   	push   %ebp
  101069:	89 e5                	mov    %esp,%ebp
  10106b:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10106e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101072:	74 0d                	je     101081 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101074:	8b 45 08             	mov    0x8(%ebp),%eax
  101077:	89 04 24             	mov    %eax,(%esp)
  10107a:	e8 70 ff ff ff       	call   100fef <lpt_putc_sub>
  10107f:	eb 24                	jmp    1010a5 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101081:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101088:	e8 62 ff ff ff       	call   100fef <lpt_putc_sub>
        lpt_putc_sub(' ');
  10108d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101094:	e8 56 ff ff ff       	call   100fef <lpt_putc_sub>
        lpt_putc_sub('\b');
  101099:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010a0:	e8 4a ff ff ff       	call   100fef <lpt_putc_sub>
    }
}
  1010a5:	c9                   	leave  
  1010a6:	c3                   	ret    

001010a7 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010a7:	55                   	push   %ebp
  1010a8:	89 e5                	mov    %esp,%ebp
  1010aa:	53                   	push   %ebx
  1010ab:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1010ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b1:	b0 00                	mov    $0x0,%al
  1010b3:	85 c0                	test   %eax,%eax
  1010b5:	75 07                	jne    1010be <cga_putc+0x17>
        c |= 0x0700;
  1010b7:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010be:	8b 45 08             	mov    0x8(%ebp),%eax
  1010c1:	0f b6 c0             	movzbl %al,%eax
  1010c4:	83 f8 0a             	cmp    $0xa,%eax
  1010c7:	74 4c                	je     101115 <cga_putc+0x6e>
  1010c9:	83 f8 0d             	cmp    $0xd,%eax
  1010cc:	74 57                	je     101125 <cga_putc+0x7e>
  1010ce:	83 f8 08             	cmp    $0x8,%eax
  1010d1:	0f 85 88 00 00 00    	jne    10115f <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010d7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010de:	66 85 c0             	test   %ax,%ax
  1010e1:	74 30                	je     101113 <cga_putc+0x6c>
            crt_pos --;
  1010e3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ea:	83 e8 01             	sub    $0x1,%eax
  1010ed:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010f3:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010f8:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010ff:	0f b7 d2             	movzwl %dx,%edx
  101102:	01 d2                	add    %edx,%edx
  101104:	01 c2                	add    %eax,%edx
  101106:	8b 45 08             	mov    0x8(%ebp),%eax
  101109:	b0 00                	mov    $0x0,%al
  10110b:	83 c8 20             	or     $0x20,%eax
  10110e:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101111:	eb 72                	jmp    101185 <cga_putc+0xde>
  101113:	eb 70                	jmp    101185 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  101115:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10111c:	83 c0 50             	add    $0x50,%eax
  10111f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101125:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10112c:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101133:	0f b7 c1             	movzwl %cx,%eax
  101136:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10113c:	c1 e8 10             	shr    $0x10,%eax
  10113f:	89 c2                	mov    %eax,%edx
  101141:	66 c1 ea 06          	shr    $0x6,%dx
  101145:	89 d0                	mov    %edx,%eax
  101147:	c1 e0 02             	shl    $0x2,%eax
  10114a:	01 d0                	add    %edx,%eax
  10114c:	c1 e0 04             	shl    $0x4,%eax
  10114f:	29 c1                	sub    %eax,%ecx
  101151:	89 ca                	mov    %ecx,%edx
  101153:	89 d8                	mov    %ebx,%eax
  101155:	29 d0                	sub    %edx,%eax
  101157:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10115d:	eb 26                	jmp    101185 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10115f:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101165:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10116c:	8d 50 01             	lea    0x1(%eax),%edx
  10116f:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101176:	0f b7 c0             	movzwl %ax,%eax
  101179:	01 c0                	add    %eax,%eax
  10117b:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10117e:	8b 45 08             	mov    0x8(%ebp),%eax
  101181:	66 89 02             	mov    %ax,(%edx)
        break;
  101184:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101185:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10118c:	66 3d cf 07          	cmp    $0x7cf,%ax
  101190:	76 5b                	jbe    1011ed <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101192:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101197:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10119d:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a2:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011a9:	00 
  1011aa:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011ae:	89 04 24             	mov    %eax,(%esp)
  1011b1:	e8 31 21 00 00       	call   1032e7 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011b6:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011bd:	eb 15                	jmp    1011d4 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011bf:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011c7:	01 d2                	add    %edx,%edx
  1011c9:	01 d0                	add    %edx,%eax
  1011cb:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011d4:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011db:	7e e2                	jle    1011bf <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011dd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011e4:	83 e8 50             	sub    $0x50,%eax
  1011e7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011ed:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011f4:	0f b7 c0             	movzwl %ax,%eax
  1011f7:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011fb:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011ff:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101203:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101207:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101208:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10120f:	66 c1 e8 08          	shr    $0x8,%ax
  101213:	0f b6 c0             	movzbl %al,%eax
  101216:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10121d:	83 c2 01             	add    $0x1,%edx
  101220:	0f b7 d2             	movzwl %dx,%edx
  101223:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101227:	88 45 ed             	mov    %al,-0x13(%ebp)
  10122a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10122e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101232:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101233:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10123a:	0f b7 c0             	movzwl %ax,%eax
  10123d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101241:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101245:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101249:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10124d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10124e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101255:	0f b6 c0             	movzbl %al,%eax
  101258:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10125f:	83 c2 01             	add    $0x1,%edx
  101262:	0f b7 d2             	movzwl %dx,%edx
  101265:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101269:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10126c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101270:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101274:	ee                   	out    %al,(%dx)
}
  101275:	83 c4 34             	add    $0x34,%esp
  101278:	5b                   	pop    %ebx
  101279:	5d                   	pop    %ebp
  10127a:	c3                   	ret    

0010127b <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10127b:	55                   	push   %ebp
  10127c:	89 e5                	mov    %esp,%ebp
  10127e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101281:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101288:	eb 09                	jmp    101293 <serial_putc_sub+0x18>
        delay();
  10128a:	e8 4f fb ff ff       	call   100dde <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10128f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101293:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101299:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10129d:	89 c2                	mov    %eax,%edx
  10129f:	ec                   	in     (%dx),%al
  1012a0:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012a3:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012a7:	0f b6 c0             	movzbl %al,%eax
  1012aa:	83 e0 20             	and    $0x20,%eax
  1012ad:	85 c0                	test   %eax,%eax
  1012af:	75 09                	jne    1012ba <serial_putc_sub+0x3f>
  1012b1:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012b8:	7e d0                	jle    10128a <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1012bd:	0f b6 c0             	movzbl %al,%eax
  1012c0:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012c6:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012c9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012cd:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012d1:	ee                   	out    %al,(%dx)
}
  1012d2:	c9                   	leave  
  1012d3:	c3                   	ret    

001012d4 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012d4:	55                   	push   %ebp
  1012d5:	89 e5                	mov    %esp,%ebp
  1012d7:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012da:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012de:	74 0d                	je     1012ed <serial_putc+0x19>
        serial_putc_sub(c);
  1012e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e3:	89 04 24             	mov    %eax,(%esp)
  1012e6:	e8 90 ff ff ff       	call   10127b <serial_putc_sub>
  1012eb:	eb 24                	jmp    101311 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012ed:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f4:	e8 82 ff ff ff       	call   10127b <serial_putc_sub>
        serial_putc_sub(' ');
  1012f9:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101300:	e8 76 ff ff ff       	call   10127b <serial_putc_sub>
        serial_putc_sub('\b');
  101305:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10130c:	e8 6a ff ff ff       	call   10127b <serial_putc_sub>
    }
}
  101311:	c9                   	leave  
  101312:	c3                   	ret    

00101313 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101313:	55                   	push   %ebp
  101314:	89 e5                	mov    %esp,%ebp
  101316:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101319:	eb 33                	jmp    10134e <cons_intr+0x3b>
        if (c != 0) {
  10131b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10131f:	74 2d                	je     10134e <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101321:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101326:	8d 50 01             	lea    0x1(%eax),%edx
  101329:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10132f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101332:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101338:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10133d:	3d 00 02 00 00       	cmp    $0x200,%eax
  101342:	75 0a                	jne    10134e <cons_intr+0x3b>
                cons.wpos = 0;
  101344:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10134b:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10134e:	8b 45 08             	mov    0x8(%ebp),%eax
  101351:	ff d0                	call   *%eax
  101353:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101356:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10135a:	75 bf                	jne    10131b <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10135c:	c9                   	leave  
  10135d:	c3                   	ret    

0010135e <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10135e:	55                   	push   %ebp
  10135f:	89 e5                	mov    %esp,%ebp
  101361:	83 ec 10             	sub    $0x10,%esp
  101364:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10136a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10136e:	89 c2                	mov    %eax,%edx
  101370:	ec                   	in     (%dx),%al
  101371:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101374:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101378:	0f b6 c0             	movzbl %al,%eax
  10137b:	83 e0 01             	and    $0x1,%eax
  10137e:	85 c0                	test   %eax,%eax
  101380:	75 07                	jne    101389 <serial_proc_data+0x2b>
        return -1;
  101382:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101387:	eb 2a                	jmp    1013b3 <serial_proc_data+0x55>
  101389:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10138f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101393:	89 c2                	mov    %eax,%edx
  101395:	ec                   	in     (%dx),%al
  101396:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101399:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10139d:	0f b6 c0             	movzbl %al,%eax
  1013a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013a3:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013a7:	75 07                	jne    1013b0 <serial_proc_data+0x52>
        c = '\b';
  1013a9:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013b3:	c9                   	leave  
  1013b4:	c3                   	ret    

001013b5 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013b5:	55                   	push   %ebp
  1013b6:	89 e5                	mov    %esp,%ebp
  1013b8:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013bb:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013c0:	85 c0                	test   %eax,%eax
  1013c2:	74 0c                	je     1013d0 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013c4:	c7 04 24 5e 13 10 00 	movl   $0x10135e,(%esp)
  1013cb:	e8 43 ff ff ff       	call   101313 <cons_intr>
    }
}
  1013d0:	c9                   	leave  
  1013d1:	c3                   	ret    

001013d2 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013d2:	55                   	push   %ebp
  1013d3:	89 e5                	mov    %esp,%ebp
  1013d5:	83 ec 38             	sub    $0x38,%esp
  1013d8:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013de:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013e2:	89 c2                	mov    %eax,%edx
  1013e4:	ec                   	in     (%dx),%al
  1013e5:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013e8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013ec:	0f b6 c0             	movzbl %al,%eax
  1013ef:	83 e0 01             	and    $0x1,%eax
  1013f2:	85 c0                	test   %eax,%eax
  1013f4:	75 0a                	jne    101400 <kbd_proc_data+0x2e>
        return -1;
  1013f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013fb:	e9 59 01 00 00       	jmp    101559 <kbd_proc_data+0x187>
  101400:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101406:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10140a:	89 c2                	mov    %eax,%edx
  10140c:	ec                   	in     (%dx),%al
  10140d:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101410:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101414:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101417:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10141b:	75 17                	jne    101434 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  10141d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101422:	83 c8 40             	or     $0x40,%eax
  101425:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10142a:	b8 00 00 00 00       	mov    $0x0,%eax
  10142f:	e9 25 01 00 00       	jmp    101559 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101434:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101438:	84 c0                	test   %al,%al
  10143a:	79 47                	jns    101483 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10143c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101441:	83 e0 40             	and    $0x40,%eax
  101444:	85 c0                	test   %eax,%eax
  101446:	75 09                	jne    101451 <kbd_proc_data+0x7f>
  101448:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10144c:	83 e0 7f             	and    $0x7f,%eax
  10144f:	eb 04                	jmp    101455 <kbd_proc_data+0x83>
  101451:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101455:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101458:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145c:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101463:	83 c8 40             	or     $0x40,%eax
  101466:	0f b6 c0             	movzbl %al,%eax
  101469:	f7 d0                	not    %eax
  10146b:	89 c2                	mov    %eax,%edx
  10146d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101472:	21 d0                	and    %edx,%eax
  101474:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101479:	b8 00 00 00 00       	mov    $0x0,%eax
  10147e:	e9 d6 00 00 00       	jmp    101559 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101483:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101488:	83 e0 40             	and    $0x40,%eax
  10148b:	85 c0                	test   %eax,%eax
  10148d:	74 11                	je     1014a0 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10148f:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101493:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101498:	83 e0 bf             	and    $0xffffffbf,%eax
  10149b:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1014a0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a4:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014ab:	0f b6 d0             	movzbl %al,%edx
  1014ae:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b3:	09 d0                	or     %edx,%eax
  1014b5:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014be:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014c5:	0f b6 d0             	movzbl %al,%edx
  1014c8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014cd:	31 d0                	xor    %edx,%eax
  1014cf:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014d4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d9:	83 e0 03             	and    $0x3,%eax
  1014dc:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014e3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e7:	01 d0                	add    %edx,%eax
  1014e9:	0f b6 00             	movzbl (%eax),%eax
  1014ec:	0f b6 c0             	movzbl %al,%eax
  1014ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014f2:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014f7:	83 e0 08             	and    $0x8,%eax
  1014fa:	85 c0                	test   %eax,%eax
  1014fc:	74 22                	je     101520 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014fe:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101502:	7e 0c                	jle    101510 <kbd_proc_data+0x13e>
  101504:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101508:	7f 06                	jg     101510 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  10150a:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  10150e:	eb 10                	jmp    101520 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  101510:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101514:	7e 0a                	jle    101520 <kbd_proc_data+0x14e>
  101516:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10151a:	7f 04                	jg     101520 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  10151c:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101520:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101525:	f7 d0                	not    %eax
  101527:	83 e0 06             	and    $0x6,%eax
  10152a:	85 c0                	test   %eax,%eax
  10152c:	75 28                	jne    101556 <kbd_proc_data+0x184>
  10152e:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101535:	75 1f                	jne    101556 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  101537:	c7 04 24 59 37 10 00 	movl   $0x103759,(%esp)
  10153e:	e8 cf ed ff ff       	call   100312 <cprintf>
  101543:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101549:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10154d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101551:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101555:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101556:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101559:	c9                   	leave  
  10155a:	c3                   	ret    

0010155b <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10155b:	55                   	push   %ebp
  10155c:	89 e5                	mov    %esp,%ebp
  10155e:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101561:	c7 04 24 d2 13 10 00 	movl   $0x1013d2,(%esp)
  101568:	e8 a6 fd ff ff       	call   101313 <cons_intr>
}
  10156d:	c9                   	leave  
  10156e:	c3                   	ret    

0010156f <kbd_init>:

static void
kbd_init(void) {
  10156f:	55                   	push   %ebp
  101570:	89 e5                	mov    %esp,%ebp
  101572:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101575:	e8 e1 ff ff ff       	call   10155b <kbd_intr>
    pic_enable(IRQ_KBD);
  10157a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101581:	e8 17 01 00 00       	call   10169d <pic_enable>
}
  101586:	c9                   	leave  
  101587:	c3                   	ret    

00101588 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101588:	55                   	push   %ebp
  101589:	89 e5                	mov    %esp,%ebp
  10158b:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10158e:	e8 93 f8 ff ff       	call   100e26 <cga_init>
    serial_init();
  101593:	e8 74 f9 ff ff       	call   100f0c <serial_init>
    kbd_init();
  101598:	e8 d2 ff ff ff       	call   10156f <kbd_init>
    if (!serial_exists) {
  10159d:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1015a2:	85 c0                	test   %eax,%eax
  1015a4:	75 0c                	jne    1015b2 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015a6:	c7 04 24 65 37 10 00 	movl   $0x103765,(%esp)
  1015ad:	e8 60 ed ff ff       	call   100312 <cprintf>
    }
}
  1015b2:	c9                   	leave  
  1015b3:	c3                   	ret    

001015b4 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015b4:	55                   	push   %ebp
  1015b5:	89 e5                	mov    %esp,%ebp
  1015b7:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1015bd:	89 04 24             	mov    %eax,(%esp)
  1015c0:	e8 a3 fa ff ff       	call   101068 <lpt_putc>
    cga_putc(c);
  1015c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c8:	89 04 24             	mov    %eax,(%esp)
  1015cb:	e8 d7 fa ff ff       	call   1010a7 <cga_putc>
    serial_putc(c);
  1015d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d3:	89 04 24             	mov    %eax,(%esp)
  1015d6:	e8 f9 fc ff ff       	call   1012d4 <serial_putc>
}
  1015db:	c9                   	leave  
  1015dc:	c3                   	ret    

001015dd <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015dd:	55                   	push   %ebp
  1015de:	89 e5                	mov    %esp,%ebp
  1015e0:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015e3:	e8 cd fd ff ff       	call   1013b5 <serial_intr>
    kbd_intr();
  1015e8:	e8 6e ff ff ff       	call   10155b <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015ed:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015f3:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015f8:	39 c2                	cmp    %eax,%edx
  1015fa:	74 36                	je     101632 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015fc:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101601:	8d 50 01             	lea    0x1(%eax),%edx
  101604:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  10160a:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101611:	0f b6 c0             	movzbl %al,%eax
  101614:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101617:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10161c:	3d 00 02 00 00       	cmp    $0x200,%eax
  101621:	75 0a                	jne    10162d <cons_getc+0x50>
            cons.rpos = 0;
  101623:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10162a:	00 00 00 
        }
        return c;
  10162d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101630:	eb 05                	jmp    101637 <cons_getc+0x5a>
    }
    return 0;
  101632:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101637:	c9                   	leave  
  101638:	c3                   	ret    

00101639 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101639:	55                   	push   %ebp
  10163a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {// Set Interrupt
    asm volatile ("sti");
  10163c:	fb                   	sti    
    sti();
}
  10163d:	5d                   	pop    %ebp
  10163e:	c3                   	ret    

0010163f <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10163f:	55                   	push   %ebp
  101640:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {// Clear Interrupt
    asm volatile ("cli");
  101642:	fa                   	cli    
    cli();
}
  101643:	5d                   	pop    %ebp
  101644:	c3                   	ret    

00101645 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101645:	55                   	push   %ebp
  101646:	89 e5                	mov    %esp,%ebp
  101648:	83 ec 14             	sub    $0x14,%esp
  10164b:	8b 45 08             	mov    0x8(%ebp),%eax
  10164e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101652:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101656:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10165c:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101661:	85 c0                	test   %eax,%eax
  101663:	74 36                	je     10169b <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101665:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101669:	0f b6 c0             	movzbl %al,%eax
  10166c:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101672:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101675:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101679:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10167d:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10167e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101682:	66 c1 e8 08          	shr    $0x8,%ax
  101686:	0f b6 c0             	movzbl %al,%eax
  101689:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10168f:	88 45 f9             	mov    %al,-0x7(%ebp)
  101692:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101696:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10169a:	ee                   	out    %al,(%dx)
    }
}
  10169b:	c9                   	leave  
  10169c:	c3                   	ret    

0010169d <pic_enable>:

void
pic_enable(unsigned int irq) {
  10169d:	55                   	push   %ebp
  10169e:	89 e5                	mov    %esp,%ebp
  1016a0:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a6:	ba 01 00 00 00       	mov    $0x1,%edx
  1016ab:	89 c1                	mov    %eax,%ecx
  1016ad:	d3 e2                	shl    %cl,%edx
  1016af:	89 d0                	mov    %edx,%eax
  1016b1:	f7 d0                	not    %eax
  1016b3:	89 c2                	mov    %eax,%edx
  1016b5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016bc:	21 d0                	and    %edx,%eax
  1016be:	0f b7 c0             	movzwl %ax,%eax
  1016c1:	89 04 24             	mov    %eax,(%esp)
  1016c4:	e8 7c ff ff ff       	call   101645 <pic_setmask>
}
  1016c9:	c9                   	leave  
  1016ca:	c3                   	ret    

001016cb <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016cb:	55                   	push   %ebp
  1016cc:	89 e5                	mov    %esp,%ebp
  1016ce:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016d1:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016d8:	00 00 00 
  1016db:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016e1:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016e5:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016e9:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016ed:	ee                   	out    %al,(%dx)
  1016ee:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016f4:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016f8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016fc:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101700:	ee                   	out    %al,(%dx)
  101701:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101707:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  10170b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10170f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101713:	ee                   	out    %al,(%dx)
  101714:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  10171a:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  10171e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101722:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101726:	ee                   	out    %al,(%dx)
  101727:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10172d:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101731:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101735:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101739:	ee                   	out    %al,(%dx)
  10173a:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101740:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101744:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101748:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10174c:	ee                   	out    %al,(%dx)
  10174d:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101753:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  101757:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10175b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10175f:	ee                   	out    %al,(%dx)
  101760:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101766:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10176a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10176e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101772:	ee                   	out    %al,(%dx)
  101773:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101779:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  10177d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101781:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101785:	ee                   	out    %al,(%dx)
  101786:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10178c:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101790:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101794:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101798:	ee                   	out    %al,(%dx)
  101799:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  10179f:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  1017a3:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017a7:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017ab:	ee                   	out    %al,(%dx)
  1017ac:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017b2:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  1017b6:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017ba:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017be:	ee                   	out    %al,(%dx)
  1017bf:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017c5:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017c9:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017cd:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017d1:	ee                   	out    %al,(%dx)
  1017d2:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017d8:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017dc:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017e0:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017e4:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017e5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ec:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017f0:	74 12                	je     101804 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017f2:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017f9:	0f b7 c0             	movzwl %ax,%eax
  1017fc:	89 04 24             	mov    %eax,(%esp)
  1017ff:	e8 41 fe ff ff       	call   101645 <pic_setmask>
    }
}
  101804:	c9                   	leave  
  101805:	c3                   	ret    

00101806 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101806:	55                   	push   %ebp
  101807:	89 e5                	mov    %esp,%ebp
  101809:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10180c:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101813:	00 
  101814:	c7 04 24 a0 37 10 00 	movl   $0x1037a0,(%esp)
  10181b:	e8 f2 ea ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101820:	c7 04 24 aa 37 10 00 	movl   $0x1037aa,(%esp)
  101827:	e8 e6 ea ff ff       	call   100312 <cprintf>
    panic("EOT: kernel seems ok.");
  10182c:	c7 44 24 08 b8 37 10 	movl   $0x1037b8,0x8(%esp)
  101833:	00 
  101834:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  10183b:	00 
  10183c:	c7 04 24 ce 37 10 00 	movl   $0x1037ce,(%esp)
  101843:	e8 77 f4 ff ff       	call   100cbf <__panic>

00101848 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101848:	55                   	push   %ebp
  101849:	89 e5                	mov    %esp,%ebp
  10184b:	83 ec 10             	sub    $0x10,%esp
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	
	uint16_t cs;
	asm volatile("movw %%cs, %0":"=r"(cs));
  10184e:	66 8c c8             	mov    %cs,%ax
  101851:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
	uint32_t ix;
	for(ix = 0; ix < 256; ++ix)
  101855:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10185c:	e9 c5 00 00 00       	jmp    101926 <idt_init+0xde>
		SETGATE(idt[ix], 0, cs, __vectors[ix], 0);
  101861:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101864:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10186b:	89 c2                	mov    %eax,%edx
  10186d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101870:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101877:	00 
  101878:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10187f:	66 89 14 c5 a2 f0 10 	mov    %dx,0x10f0a2(,%eax,8)
  101886:	00 
  101887:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188a:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101891:	00 
  101892:	83 e2 e0             	and    $0xffffffe0,%edx
  101895:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10189c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189f:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018a6:	00 
  1018a7:	83 e2 1f             	and    $0x1f,%edx
  1018aa:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1018b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b4:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018bb:	00 
  1018bc:	83 e2 f0             	and    $0xfffffff0,%edx
  1018bf:	83 ca 0e             	or     $0xe,%edx
  1018c2:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cc:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018d3:	00 
  1018d4:	83 e2 ef             	and    $0xffffffef,%edx
  1018d7:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018de:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e1:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018e8:	00 
  1018e9:	83 e2 9f             	and    $0xffffff9f,%edx
  1018ec:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f6:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018fd:	00 
  1018fe:	83 ca 80             	or     $0xffffff80,%edx
  101901:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101908:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10190b:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101912:	c1 e8 10             	shr    $0x10,%eax
  101915:	89 c2                	mov    %eax,%edx
  101917:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10191a:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101921:	00 
	extern uintptr_t __vectors[];
	
	uint16_t cs;
	asm volatile("movw %%cs, %0":"=r"(cs));
	uint32_t ix;
	for(ix = 0; ix < 256; ++ix)
  101922:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101926:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10192d:	0f 86 2e ff ff ff    	jbe    101861 <idt_init+0x19>
  101933:	c7 45 f4 60 e5 10 00 	movl   $0x10e560,-0xc(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {// Load Interrupt Descriptor Talbe
    asm volatile ("lidt (%0)" :: "r" (pd));
  10193a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10193d:	0f 01 18             	lidtl  (%eax)
		SETGATE(idt[ix], 0, cs, __vectors[ix], 0);
	
	lidt(&idt_pd);
}
  101940:	c9                   	leave  
  101941:	c3                   	ret    

00101942 <trapname>:

static const char *
trapname(int trapno) {
  101942:	55                   	push   %ebp
  101943:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101945:	8b 45 08             	mov    0x8(%ebp),%eax
  101948:	83 f8 13             	cmp    $0x13,%eax
  10194b:	77 0c                	ja     101959 <trapname+0x17>
        return excnames[trapno];
  10194d:	8b 45 08             	mov    0x8(%ebp),%eax
  101950:	8b 04 85 20 3b 10 00 	mov    0x103b20(,%eax,4),%eax
  101957:	eb 18                	jmp    101971 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101959:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10195d:	7e 0d                	jle    10196c <trapname+0x2a>
  10195f:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101963:	7f 07                	jg     10196c <trapname+0x2a>
        return "Hardware Interrupt";
  101965:	b8 df 37 10 00       	mov    $0x1037df,%eax
  10196a:	eb 05                	jmp    101971 <trapname+0x2f>
    }
    return "(unknown trap)";
  10196c:	b8 f2 37 10 00       	mov    $0x1037f2,%eax
}
  101971:	5d                   	pop    %ebp
  101972:	c3                   	ret    

00101973 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101973:	55                   	push   %ebp
  101974:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101976:	8b 45 08             	mov    0x8(%ebp),%eax
  101979:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10197d:	66 83 f8 08          	cmp    $0x8,%ax
  101981:	0f 94 c0             	sete   %al
  101984:	0f b6 c0             	movzbl %al,%eax
}
  101987:	5d                   	pop    %ebp
  101988:	c3                   	ret    

00101989 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101989:	55                   	push   %ebp
  10198a:	89 e5                	mov    %esp,%ebp
  10198c:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  10198f:	8b 45 08             	mov    0x8(%ebp),%eax
  101992:	89 44 24 04          	mov    %eax,0x4(%esp)
  101996:	c7 04 24 33 38 10 00 	movl   $0x103833,(%esp)
  10199d:	e8 70 e9 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  1019a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a5:	89 04 24             	mov    %eax,(%esp)
  1019a8:	e8 a1 01 00 00       	call   101b4e <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b0:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019b4:	0f b7 c0             	movzwl %ax,%eax
  1019b7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019bb:	c7 04 24 44 38 10 00 	movl   $0x103844,(%esp)
  1019c2:	e8 4b e9 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ca:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019ce:	0f b7 c0             	movzwl %ax,%eax
  1019d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019d5:	c7 04 24 57 38 10 00 	movl   $0x103857,(%esp)
  1019dc:	e8 31 e9 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1019e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e4:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1019e8:	0f b7 c0             	movzwl %ax,%eax
  1019eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ef:	c7 04 24 6a 38 10 00 	movl   $0x10386a,(%esp)
  1019f6:	e8 17 e9 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1019fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019fe:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a02:	0f b7 c0             	movzwl %ax,%eax
  101a05:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a09:	c7 04 24 7d 38 10 00 	movl   $0x10387d,(%esp)
  101a10:	e8 fd e8 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a15:	8b 45 08             	mov    0x8(%ebp),%eax
  101a18:	8b 40 30             	mov    0x30(%eax),%eax
  101a1b:	89 04 24             	mov    %eax,(%esp)
  101a1e:	e8 1f ff ff ff       	call   101942 <trapname>
  101a23:	8b 55 08             	mov    0x8(%ebp),%edx
  101a26:	8b 52 30             	mov    0x30(%edx),%edx
  101a29:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a2d:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a31:	c7 04 24 90 38 10 00 	movl   $0x103890,(%esp)
  101a38:	e8 d5 e8 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a40:	8b 40 34             	mov    0x34(%eax),%eax
  101a43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a47:	c7 04 24 a2 38 10 00 	movl   $0x1038a2,(%esp)
  101a4e:	e8 bf e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a53:	8b 45 08             	mov    0x8(%ebp),%eax
  101a56:	8b 40 38             	mov    0x38(%eax),%eax
  101a59:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a5d:	c7 04 24 b1 38 10 00 	movl   $0x1038b1,(%esp)
  101a64:	e8 a9 e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a69:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a70:	0f b7 c0             	movzwl %ax,%eax
  101a73:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a77:	c7 04 24 c0 38 10 00 	movl   $0x1038c0,(%esp)
  101a7e:	e8 8f e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a83:	8b 45 08             	mov    0x8(%ebp),%eax
  101a86:	8b 40 40             	mov    0x40(%eax),%eax
  101a89:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a8d:	c7 04 24 d3 38 10 00 	movl   $0x1038d3,(%esp)
  101a94:	e8 79 e8 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101aa0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101aa7:	eb 3e                	jmp    101ae7 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101aa9:	8b 45 08             	mov    0x8(%ebp),%eax
  101aac:	8b 50 40             	mov    0x40(%eax),%edx
  101aaf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ab2:	21 d0                	and    %edx,%eax
  101ab4:	85 c0                	test   %eax,%eax
  101ab6:	74 28                	je     101ae0 <print_trapframe+0x157>
  101ab8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101abb:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101ac2:	85 c0                	test   %eax,%eax
  101ac4:	74 1a                	je     101ae0 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101ac6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ac9:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101ad0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad4:	c7 04 24 e2 38 10 00 	movl   $0x1038e2,(%esp)
  101adb:	e8 32 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ae0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101ae4:	d1 65 f0             	shll   -0x10(%ebp)
  101ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101aea:	83 f8 17             	cmp    $0x17,%eax
  101aed:	76 ba                	jbe    101aa9 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101aef:	8b 45 08             	mov    0x8(%ebp),%eax
  101af2:	8b 40 40             	mov    0x40(%eax),%eax
  101af5:	25 00 30 00 00       	and    $0x3000,%eax
  101afa:	c1 e8 0c             	shr    $0xc,%eax
  101afd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b01:	c7 04 24 e6 38 10 00 	movl   $0x1038e6,(%esp)
  101b08:	e8 05 e8 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	89 04 24             	mov    %eax,(%esp)
  101b13:	e8 5b fe ff ff       	call   101973 <trap_in_kernel>
  101b18:	85 c0                	test   %eax,%eax
  101b1a:	75 30                	jne    101b4c <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1f:	8b 40 44             	mov    0x44(%eax),%eax
  101b22:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b26:	c7 04 24 ef 38 10 00 	movl   $0x1038ef,(%esp)
  101b2d:	e8 e0 e7 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b32:	8b 45 08             	mov    0x8(%ebp),%eax
  101b35:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b39:	0f b7 c0             	movzwl %ax,%eax
  101b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b40:	c7 04 24 fe 38 10 00 	movl   $0x1038fe,(%esp)
  101b47:	e8 c6 e7 ff ff       	call   100312 <cprintf>
    }
}
  101b4c:	c9                   	leave  
  101b4d:	c3                   	ret    

00101b4e <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b4e:	55                   	push   %ebp
  101b4f:	89 e5                	mov    %esp,%ebp
  101b51:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b54:	8b 45 08             	mov    0x8(%ebp),%eax
  101b57:	8b 00                	mov    (%eax),%eax
  101b59:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5d:	c7 04 24 11 39 10 00 	movl   $0x103911,(%esp)
  101b64:	e8 a9 e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b69:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6c:	8b 40 04             	mov    0x4(%eax),%eax
  101b6f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b73:	c7 04 24 20 39 10 00 	movl   $0x103920,(%esp)
  101b7a:	e8 93 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b7f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b82:	8b 40 08             	mov    0x8(%eax),%eax
  101b85:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b89:	c7 04 24 2f 39 10 00 	movl   $0x10392f,(%esp)
  101b90:	e8 7d e7 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b95:	8b 45 08             	mov    0x8(%ebp),%eax
  101b98:	8b 40 0c             	mov    0xc(%eax),%eax
  101b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9f:	c7 04 24 3e 39 10 00 	movl   $0x10393e,(%esp)
  101ba6:	e8 67 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bab:	8b 45 08             	mov    0x8(%ebp),%eax
  101bae:	8b 40 10             	mov    0x10(%eax),%eax
  101bb1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb5:	c7 04 24 4d 39 10 00 	movl   $0x10394d,(%esp)
  101bbc:	e8 51 e7 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101bc1:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc4:	8b 40 14             	mov    0x14(%eax),%eax
  101bc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcb:	c7 04 24 5c 39 10 00 	movl   $0x10395c,(%esp)
  101bd2:	e8 3b e7 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bda:	8b 40 18             	mov    0x18(%eax),%eax
  101bdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be1:	c7 04 24 6b 39 10 00 	movl   $0x10396b,(%esp)
  101be8:	e8 25 e7 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101bed:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf0:	8b 40 1c             	mov    0x1c(%eax),%eax
  101bf3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf7:	c7 04 24 7a 39 10 00 	movl   $0x10397a,(%esp)
  101bfe:	e8 0f e7 ff ff       	call   100312 <cprintf>
}
  101c03:	c9                   	leave  
  101c04:	c3                   	ret    

00101c05 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
extern int ticks_count;
static void
trap_dispatch(struct trapframe *tf) {
  101c05:	55                   	push   %ebp
  101c06:	89 e5                	mov    %esp,%ebp
  101c08:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c0b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0e:	8b 40 30             	mov    0x30(%eax),%eax
  101c11:	83 f8 2f             	cmp    $0x2f,%eax
  101c14:	77 1d                	ja     101c33 <trap_dispatch+0x2e>
  101c16:	83 f8 2e             	cmp    $0x2e,%eax
  101c19:	0f 83 f2 00 00 00    	jae    101d11 <trap_dispatch+0x10c>
  101c1f:	83 f8 21             	cmp    $0x21,%eax
  101c22:	74 73                	je     101c97 <trap_dispatch+0x92>
  101c24:	83 f8 24             	cmp    $0x24,%eax
  101c27:	74 48                	je     101c71 <trap_dispatch+0x6c>
  101c29:	83 f8 20             	cmp    $0x20,%eax
  101c2c:	74 13                	je     101c41 <trap_dispatch+0x3c>
  101c2e:	e9 a6 00 00 00       	jmp    101cd9 <trap_dispatch+0xd4>
  101c33:	83 e8 78             	sub    $0x78,%eax
  101c36:	83 f8 01             	cmp    $0x1,%eax
  101c39:	0f 87 9a 00 00 00    	ja     101cd9 <trap_dispatch+0xd4>
  101c3f:	eb 7c                	jmp    101cbd <trap_dispatch+0xb8>
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
		
		if(++ticks_count == TICK_NUM){
  101c41:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  101c46:	83 c0 01             	add    $0x1,%eax
  101c49:	a3 20 ea 10 00       	mov    %eax,0x10ea20
  101c4e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  101c53:	83 f8 64             	cmp    $0x64,%eax
  101c56:	75 14                	jne    101c6c <trap_dispatch+0x67>
			ticks_count = 0;
  101c58:	c7 05 20 ea 10 00 00 	movl   $0x0,0x10ea20
  101c5f:	00 00 00 
			print_ticks();
  101c62:	e8 9f fb ff ff       	call   101806 <print_ticks>
		}
        break;
  101c67:	e9 a6 00 00 00       	jmp    101d12 <trap_dispatch+0x10d>
  101c6c:	e9 a1 00 00 00       	jmp    101d12 <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c71:	e8 67 f9 ff ff       	call   1015dd <cons_getc>
  101c76:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c79:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c7d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c81:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c85:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c89:	c7 04 24 89 39 10 00 	movl   $0x103989,(%esp)
  101c90:	e8 7d e6 ff ff       	call   100312 <cprintf>
        break;
  101c95:	eb 7b                	jmp    101d12 <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c97:	e8 41 f9 ff ff       	call   1015dd <cons_getc>
  101c9c:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c9f:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ca3:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ca7:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cab:	89 44 24 04          	mov    %eax,0x4(%esp)
  101caf:	c7 04 24 9b 39 10 00 	movl   $0x10399b,(%esp)
  101cb6:	e8 57 e6 ff ff       	call   100312 <cprintf>
        break;
  101cbb:	eb 55                	jmp    101d12 <trap_dispatch+0x10d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101cbd:	c7 44 24 08 aa 39 10 	movl   $0x1039aa,0x8(%esp)
  101cc4:	00 
  101cc5:	c7 44 24 04 b1 00 00 	movl   $0xb1,0x4(%esp)
  101ccc:	00 
  101ccd:	c7 04 24 ce 37 10 00 	movl   $0x1037ce,(%esp)
  101cd4:	e8 e6 ef ff ff       	call   100cbf <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101cd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101cdc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ce0:	0f b7 c0             	movzwl %ax,%eax
  101ce3:	83 e0 03             	and    $0x3,%eax
  101ce6:	85 c0                	test   %eax,%eax
  101ce8:	75 28                	jne    101d12 <trap_dispatch+0x10d>
            print_trapframe(tf);
  101cea:	8b 45 08             	mov    0x8(%ebp),%eax
  101ced:	89 04 24             	mov    %eax,(%esp)
  101cf0:	e8 94 fc ff ff       	call   101989 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101cf5:	c7 44 24 08 ba 39 10 	movl   $0x1039ba,0x8(%esp)
  101cfc:	00 
  101cfd:	c7 44 24 04 bb 00 00 	movl   $0xbb,0x4(%esp)
  101d04:	00 
  101d05:	c7 04 24 ce 37 10 00 	movl   $0x1037ce,(%esp)
  101d0c:	e8 ae ef ff ff       	call   100cbf <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101d11:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101d12:	c9                   	leave  
  101d13:	c3                   	ret    

00101d14 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d14:	55                   	push   %ebp
  101d15:	89 e5                	mov    %esp,%ebp
  101d17:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d1d:	89 04 24             	mov    %eax,(%esp)
  101d20:	e8 e0 fe ff ff       	call   101c05 <trap_dispatch>
}
  101d25:	c9                   	leave  
  101d26:	c3                   	ret    

00101d27 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101d27:	1e                   	push   %ds
    pushl %es
  101d28:	06                   	push   %es
    pushl %fs
  101d29:	0f a0                	push   %fs
    pushl %gs
  101d2b:	0f a8                	push   %gs
    pushal
  101d2d:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101d2e:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101d33:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101d35:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101d37:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101d38:	e8 d7 ff ff ff       	call   101d14 <trap>

    # pop the pushed stack pointer
    popl %esp
  101d3d:	5c                   	pop    %esp

00101d3e <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101d3e:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101d3f:	0f a9                	pop    %gs
    popl %fs
  101d41:	0f a1                	pop    %fs
    popl %es
  101d43:	07                   	pop    %es
    popl %ds
  101d44:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101d45:	83 c4 08             	add    $0x8,%esp
    iret
  101d48:	cf                   	iret   

00101d49 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d49:	6a 00                	push   $0x0
  pushl $0
  101d4b:	6a 00                	push   $0x0
  jmp __alltraps
  101d4d:	e9 d5 ff ff ff       	jmp    101d27 <__alltraps>

00101d52 <vector1>:
.globl vector1
vector1:
  pushl $0
  101d52:	6a 00                	push   $0x0
  pushl $1
  101d54:	6a 01                	push   $0x1
  jmp __alltraps
  101d56:	e9 cc ff ff ff       	jmp    101d27 <__alltraps>

00101d5b <vector2>:
.globl vector2
vector2:
  pushl $0
  101d5b:	6a 00                	push   $0x0
  pushl $2
  101d5d:	6a 02                	push   $0x2
  jmp __alltraps
  101d5f:	e9 c3 ff ff ff       	jmp    101d27 <__alltraps>

00101d64 <vector3>:
.globl vector3
vector3:
  pushl $0
  101d64:	6a 00                	push   $0x0
  pushl $3
  101d66:	6a 03                	push   $0x3
  jmp __alltraps
  101d68:	e9 ba ff ff ff       	jmp    101d27 <__alltraps>

00101d6d <vector4>:
.globl vector4
vector4:
  pushl $0
  101d6d:	6a 00                	push   $0x0
  pushl $4
  101d6f:	6a 04                	push   $0x4
  jmp __alltraps
  101d71:	e9 b1 ff ff ff       	jmp    101d27 <__alltraps>

00101d76 <vector5>:
.globl vector5
vector5:
  pushl $0
  101d76:	6a 00                	push   $0x0
  pushl $5
  101d78:	6a 05                	push   $0x5
  jmp __alltraps
  101d7a:	e9 a8 ff ff ff       	jmp    101d27 <__alltraps>

00101d7f <vector6>:
.globl vector6
vector6:
  pushl $0
  101d7f:	6a 00                	push   $0x0
  pushl $6
  101d81:	6a 06                	push   $0x6
  jmp __alltraps
  101d83:	e9 9f ff ff ff       	jmp    101d27 <__alltraps>

00101d88 <vector7>:
.globl vector7
vector7:
  pushl $0
  101d88:	6a 00                	push   $0x0
  pushl $7
  101d8a:	6a 07                	push   $0x7
  jmp __alltraps
  101d8c:	e9 96 ff ff ff       	jmp    101d27 <__alltraps>

00101d91 <vector8>:
.globl vector8
vector8:
  pushl $8
  101d91:	6a 08                	push   $0x8
  jmp __alltraps
  101d93:	e9 8f ff ff ff       	jmp    101d27 <__alltraps>

00101d98 <vector9>:
.globl vector9
vector9:
  pushl $9
  101d98:	6a 09                	push   $0x9
  jmp __alltraps
  101d9a:	e9 88 ff ff ff       	jmp    101d27 <__alltraps>

00101d9f <vector10>:
.globl vector10
vector10:
  pushl $10
  101d9f:	6a 0a                	push   $0xa
  jmp __alltraps
  101da1:	e9 81 ff ff ff       	jmp    101d27 <__alltraps>

00101da6 <vector11>:
.globl vector11
vector11:
  pushl $11
  101da6:	6a 0b                	push   $0xb
  jmp __alltraps
  101da8:	e9 7a ff ff ff       	jmp    101d27 <__alltraps>

00101dad <vector12>:
.globl vector12
vector12:
  pushl $12
  101dad:	6a 0c                	push   $0xc
  jmp __alltraps
  101daf:	e9 73 ff ff ff       	jmp    101d27 <__alltraps>

00101db4 <vector13>:
.globl vector13
vector13:
  pushl $13
  101db4:	6a 0d                	push   $0xd
  jmp __alltraps
  101db6:	e9 6c ff ff ff       	jmp    101d27 <__alltraps>

00101dbb <vector14>:
.globl vector14
vector14:
  pushl $14
  101dbb:	6a 0e                	push   $0xe
  jmp __alltraps
  101dbd:	e9 65 ff ff ff       	jmp    101d27 <__alltraps>

00101dc2 <vector15>:
.globl vector15
vector15:
  pushl $0
  101dc2:	6a 00                	push   $0x0
  pushl $15
  101dc4:	6a 0f                	push   $0xf
  jmp __alltraps
  101dc6:	e9 5c ff ff ff       	jmp    101d27 <__alltraps>

00101dcb <vector16>:
.globl vector16
vector16:
  pushl $0
  101dcb:	6a 00                	push   $0x0
  pushl $16
  101dcd:	6a 10                	push   $0x10
  jmp __alltraps
  101dcf:	e9 53 ff ff ff       	jmp    101d27 <__alltraps>

00101dd4 <vector17>:
.globl vector17
vector17:
  pushl $17
  101dd4:	6a 11                	push   $0x11
  jmp __alltraps
  101dd6:	e9 4c ff ff ff       	jmp    101d27 <__alltraps>

00101ddb <vector18>:
.globl vector18
vector18:
  pushl $0
  101ddb:	6a 00                	push   $0x0
  pushl $18
  101ddd:	6a 12                	push   $0x12
  jmp __alltraps
  101ddf:	e9 43 ff ff ff       	jmp    101d27 <__alltraps>

00101de4 <vector19>:
.globl vector19
vector19:
  pushl $0
  101de4:	6a 00                	push   $0x0
  pushl $19
  101de6:	6a 13                	push   $0x13
  jmp __alltraps
  101de8:	e9 3a ff ff ff       	jmp    101d27 <__alltraps>

00101ded <vector20>:
.globl vector20
vector20:
  pushl $0
  101ded:	6a 00                	push   $0x0
  pushl $20
  101def:	6a 14                	push   $0x14
  jmp __alltraps
  101df1:	e9 31 ff ff ff       	jmp    101d27 <__alltraps>

00101df6 <vector21>:
.globl vector21
vector21:
  pushl $0
  101df6:	6a 00                	push   $0x0
  pushl $21
  101df8:	6a 15                	push   $0x15
  jmp __alltraps
  101dfa:	e9 28 ff ff ff       	jmp    101d27 <__alltraps>

00101dff <vector22>:
.globl vector22
vector22:
  pushl $0
  101dff:	6a 00                	push   $0x0
  pushl $22
  101e01:	6a 16                	push   $0x16
  jmp __alltraps
  101e03:	e9 1f ff ff ff       	jmp    101d27 <__alltraps>

00101e08 <vector23>:
.globl vector23
vector23:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $23
  101e0a:	6a 17                	push   $0x17
  jmp __alltraps
  101e0c:	e9 16 ff ff ff       	jmp    101d27 <__alltraps>

00101e11 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e11:	6a 00                	push   $0x0
  pushl $24
  101e13:	6a 18                	push   $0x18
  jmp __alltraps
  101e15:	e9 0d ff ff ff       	jmp    101d27 <__alltraps>

00101e1a <vector25>:
.globl vector25
vector25:
  pushl $0
  101e1a:	6a 00                	push   $0x0
  pushl $25
  101e1c:	6a 19                	push   $0x19
  jmp __alltraps
  101e1e:	e9 04 ff ff ff       	jmp    101d27 <__alltraps>

00101e23 <vector26>:
.globl vector26
vector26:
  pushl $0
  101e23:	6a 00                	push   $0x0
  pushl $26
  101e25:	6a 1a                	push   $0x1a
  jmp __alltraps
  101e27:	e9 fb fe ff ff       	jmp    101d27 <__alltraps>

00101e2c <vector27>:
.globl vector27
vector27:
  pushl $0
  101e2c:	6a 00                	push   $0x0
  pushl $27
  101e2e:	6a 1b                	push   $0x1b
  jmp __alltraps
  101e30:	e9 f2 fe ff ff       	jmp    101d27 <__alltraps>

00101e35 <vector28>:
.globl vector28
vector28:
  pushl $0
  101e35:	6a 00                	push   $0x0
  pushl $28
  101e37:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e39:	e9 e9 fe ff ff       	jmp    101d27 <__alltraps>

00101e3e <vector29>:
.globl vector29
vector29:
  pushl $0
  101e3e:	6a 00                	push   $0x0
  pushl $29
  101e40:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e42:	e9 e0 fe ff ff       	jmp    101d27 <__alltraps>

00101e47 <vector30>:
.globl vector30
vector30:
  pushl $0
  101e47:	6a 00                	push   $0x0
  pushl $30
  101e49:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e4b:	e9 d7 fe ff ff       	jmp    101d27 <__alltraps>

00101e50 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e50:	6a 00                	push   $0x0
  pushl $31
  101e52:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e54:	e9 ce fe ff ff       	jmp    101d27 <__alltraps>

00101e59 <vector32>:
.globl vector32
vector32:
  pushl $0
  101e59:	6a 00                	push   $0x0
  pushl $32
  101e5b:	6a 20                	push   $0x20
  jmp __alltraps
  101e5d:	e9 c5 fe ff ff       	jmp    101d27 <__alltraps>

00101e62 <vector33>:
.globl vector33
vector33:
  pushl $0
  101e62:	6a 00                	push   $0x0
  pushl $33
  101e64:	6a 21                	push   $0x21
  jmp __alltraps
  101e66:	e9 bc fe ff ff       	jmp    101d27 <__alltraps>

00101e6b <vector34>:
.globl vector34
vector34:
  pushl $0
  101e6b:	6a 00                	push   $0x0
  pushl $34
  101e6d:	6a 22                	push   $0x22
  jmp __alltraps
  101e6f:	e9 b3 fe ff ff       	jmp    101d27 <__alltraps>

00101e74 <vector35>:
.globl vector35
vector35:
  pushl $0
  101e74:	6a 00                	push   $0x0
  pushl $35
  101e76:	6a 23                	push   $0x23
  jmp __alltraps
  101e78:	e9 aa fe ff ff       	jmp    101d27 <__alltraps>

00101e7d <vector36>:
.globl vector36
vector36:
  pushl $0
  101e7d:	6a 00                	push   $0x0
  pushl $36
  101e7f:	6a 24                	push   $0x24
  jmp __alltraps
  101e81:	e9 a1 fe ff ff       	jmp    101d27 <__alltraps>

00101e86 <vector37>:
.globl vector37
vector37:
  pushl $0
  101e86:	6a 00                	push   $0x0
  pushl $37
  101e88:	6a 25                	push   $0x25
  jmp __alltraps
  101e8a:	e9 98 fe ff ff       	jmp    101d27 <__alltraps>

00101e8f <vector38>:
.globl vector38
vector38:
  pushl $0
  101e8f:	6a 00                	push   $0x0
  pushl $38
  101e91:	6a 26                	push   $0x26
  jmp __alltraps
  101e93:	e9 8f fe ff ff       	jmp    101d27 <__alltraps>

00101e98 <vector39>:
.globl vector39
vector39:
  pushl $0
  101e98:	6a 00                	push   $0x0
  pushl $39
  101e9a:	6a 27                	push   $0x27
  jmp __alltraps
  101e9c:	e9 86 fe ff ff       	jmp    101d27 <__alltraps>

00101ea1 <vector40>:
.globl vector40
vector40:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $40
  101ea3:	6a 28                	push   $0x28
  jmp __alltraps
  101ea5:	e9 7d fe ff ff       	jmp    101d27 <__alltraps>

00101eaa <vector41>:
.globl vector41
vector41:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $41
  101eac:	6a 29                	push   $0x29
  jmp __alltraps
  101eae:	e9 74 fe ff ff       	jmp    101d27 <__alltraps>

00101eb3 <vector42>:
.globl vector42
vector42:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $42
  101eb5:	6a 2a                	push   $0x2a
  jmp __alltraps
  101eb7:	e9 6b fe ff ff       	jmp    101d27 <__alltraps>

00101ebc <vector43>:
.globl vector43
vector43:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $43
  101ebe:	6a 2b                	push   $0x2b
  jmp __alltraps
  101ec0:	e9 62 fe ff ff       	jmp    101d27 <__alltraps>

00101ec5 <vector44>:
.globl vector44
vector44:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $44
  101ec7:	6a 2c                	push   $0x2c
  jmp __alltraps
  101ec9:	e9 59 fe ff ff       	jmp    101d27 <__alltraps>

00101ece <vector45>:
.globl vector45
vector45:
  pushl $0
  101ece:	6a 00                	push   $0x0
  pushl $45
  101ed0:	6a 2d                	push   $0x2d
  jmp __alltraps
  101ed2:	e9 50 fe ff ff       	jmp    101d27 <__alltraps>

00101ed7 <vector46>:
.globl vector46
vector46:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $46
  101ed9:	6a 2e                	push   $0x2e
  jmp __alltraps
  101edb:	e9 47 fe ff ff       	jmp    101d27 <__alltraps>

00101ee0 <vector47>:
.globl vector47
vector47:
  pushl $0
  101ee0:	6a 00                	push   $0x0
  pushl $47
  101ee2:	6a 2f                	push   $0x2f
  jmp __alltraps
  101ee4:	e9 3e fe ff ff       	jmp    101d27 <__alltraps>

00101ee9 <vector48>:
.globl vector48
vector48:
  pushl $0
  101ee9:	6a 00                	push   $0x0
  pushl $48
  101eeb:	6a 30                	push   $0x30
  jmp __alltraps
  101eed:	e9 35 fe ff ff       	jmp    101d27 <__alltraps>

00101ef2 <vector49>:
.globl vector49
vector49:
  pushl $0
  101ef2:	6a 00                	push   $0x0
  pushl $49
  101ef4:	6a 31                	push   $0x31
  jmp __alltraps
  101ef6:	e9 2c fe ff ff       	jmp    101d27 <__alltraps>

00101efb <vector50>:
.globl vector50
vector50:
  pushl $0
  101efb:	6a 00                	push   $0x0
  pushl $50
  101efd:	6a 32                	push   $0x32
  jmp __alltraps
  101eff:	e9 23 fe ff ff       	jmp    101d27 <__alltraps>

00101f04 <vector51>:
.globl vector51
vector51:
  pushl $0
  101f04:	6a 00                	push   $0x0
  pushl $51
  101f06:	6a 33                	push   $0x33
  jmp __alltraps
  101f08:	e9 1a fe ff ff       	jmp    101d27 <__alltraps>

00101f0d <vector52>:
.globl vector52
vector52:
  pushl $0
  101f0d:	6a 00                	push   $0x0
  pushl $52
  101f0f:	6a 34                	push   $0x34
  jmp __alltraps
  101f11:	e9 11 fe ff ff       	jmp    101d27 <__alltraps>

00101f16 <vector53>:
.globl vector53
vector53:
  pushl $0
  101f16:	6a 00                	push   $0x0
  pushl $53
  101f18:	6a 35                	push   $0x35
  jmp __alltraps
  101f1a:	e9 08 fe ff ff       	jmp    101d27 <__alltraps>

00101f1f <vector54>:
.globl vector54
vector54:
  pushl $0
  101f1f:	6a 00                	push   $0x0
  pushl $54
  101f21:	6a 36                	push   $0x36
  jmp __alltraps
  101f23:	e9 ff fd ff ff       	jmp    101d27 <__alltraps>

00101f28 <vector55>:
.globl vector55
vector55:
  pushl $0
  101f28:	6a 00                	push   $0x0
  pushl $55
  101f2a:	6a 37                	push   $0x37
  jmp __alltraps
  101f2c:	e9 f6 fd ff ff       	jmp    101d27 <__alltraps>

00101f31 <vector56>:
.globl vector56
vector56:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $56
  101f33:	6a 38                	push   $0x38
  jmp __alltraps
  101f35:	e9 ed fd ff ff       	jmp    101d27 <__alltraps>

00101f3a <vector57>:
.globl vector57
vector57:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $57
  101f3c:	6a 39                	push   $0x39
  jmp __alltraps
  101f3e:	e9 e4 fd ff ff       	jmp    101d27 <__alltraps>

00101f43 <vector58>:
.globl vector58
vector58:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $58
  101f45:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f47:	e9 db fd ff ff       	jmp    101d27 <__alltraps>

00101f4c <vector59>:
.globl vector59
vector59:
  pushl $0
  101f4c:	6a 00                	push   $0x0
  pushl $59
  101f4e:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f50:	e9 d2 fd ff ff       	jmp    101d27 <__alltraps>

00101f55 <vector60>:
.globl vector60
vector60:
  pushl $0
  101f55:	6a 00                	push   $0x0
  pushl $60
  101f57:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f59:	e9 c9 fd ff ff       	jmp    101d27 <__alltraps>

00101f5e <vector61>:
.globl vector61
vector61:
  pushl $0
  101f5e:	6a 00                	push   $0x0
  pushl $61
  101f60:	6a 3d                	push   $0x3d
  jmp __alltraps
  101f62:	e9 c0 fd ff ff       	jmp    101d27 <__alltraps>

00101f67 <vector62>:
.globl vector62
vector62:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $62
  101f69:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f6b:	e9 b7 fd ff ff       	jmp    101d27 <__alltraps>

00101f70 <vector63>:
.globl vector63
vector63:
  pushl $0
  101f70:	6a 00                	push   $0x0
  pushl $63
  101f72:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f74:	e9 ae fd ff ff       	jmp    101d27 <__alltraps>

00101f79 <vector64>:
.globl vector64
vector64:
  pushl $0
  101f79:	6a 00                	push   $0x0
  pushl $64
  101f7b:	6a 40                	push   $0x40
  jmp __alltraps
  101f7d:	e9 a5 fd ff ff       	jmp    101d27 <__alltraps>

00101f82 <vector65>:
.globl vector65
vector65:
  pushl $0
  101f82:	6a 00                	push   $0x0
  pushl $65
  101f84:	6a 41                	push   $0x41
  jmp __alltraps
  101f86:	e9 9c fd ff ff       	jmp    101d27 <__alltraps>

00101f8b <vector66>:
.globl vector66
vector66:
  pushl $0
  101f8b:	6a 00                	push   $0x0
  pushl $66
  101f8d:	6a 42                	push   $0x42
  jmp __alltraps
  101f8f:	e9 93 fd ff ff       	jmp    101d27 <__alltraps>

00101f94 <vector67>:
.globl vector67
vector67:
  pushl $0
  101f94:	6a 00                	push   $0x0
  pushl $67
  101f96:	6a 43                	push   $0x43
  jmp __alltraps
  101f98:	e9 8a fd ff ff       	jmp    101d27 <__alltraps>

00101f9d <vector68>:
.globl vector68
vector68:
  pushl $0
  101f9d:	6a 00                	push   $0x0
  pushl $68
  101f9f:	6a 44                	push   $0x44
  jmp __alltraps
  101fa1:	e9 81 fd ff ff       	jmp    101d27 <__alltraps>

00101fa6 <vector69>:
.globl vector69
vector69:
  pushl $0
  101fa6:	6a 00                	push   $0x0
  pushl $69
  101fa8:	6a 45                	push   $0x45
  jmp __alltraps
  101faa:	e9 78 fd ff ff       	jmp    101d27 <__alltraps>

00101faf <vector70>:
.globl vector70
vector70:
  pushl $0
  101faf:	6a 00                	push   $0x0
  pushl $70
  101fb1:	6a 46                	push   $0x46
  jmp __alltraps
  101fb3:	e9 6f fd ff ff       	jmp    101d27 <__alltraps>

00101fb8 <vector71>:
.globl vector71
vector71:
  pushl $0
  101fb8:	6a 00                	push   $0x0
  pushl $71
  101fba:	6a 47                	push   $0x47
  jmp __alltraps
  101fbc:	e9 66 fd ff ff       	jmp    101d27 <__alltraps>

00101fc1 <vector72>:
.globl vector72
vector72:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $72
  101fc3:	6a 48                	push   $0x48
  jmp __alltraps
  101fc5:	e9 5d fd ff ff       	jmp    101d27 <__alltraps>

00101fca <vector73>:
.globl vector73
vector73:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $73
  101fcc:	6a 49                	push   $0x49
  jmp __alltraps
  101fce:	e9 54 fd ff ff       	jmp    101d27 <__alltraps>

00101fd3 <vector74>:
.globl vector74
vector74:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $74
  101fd5:	6a 4a                	push   $0x4a
  jmp __alltraps
  101fd7:	e9 4b fd ff ff       	jmp    101d27 <__alltraps>

00101fdc <vector75>:
.globl vector75
vector75:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $75
  101fde:	6a 4b                	push   $0x4b
  jmp __alltraps
  101fe0:	e9 42 fd ff ff       	jmp    101d27 <__alltraps>

00101fe5 <vector76>:
.globl vector76
vector76:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $76
  101fe7:	6a 4c                	push   $0x4c
  jmp __alltraps
  101fe9:	e9 39 fd ff ff       	jmp    101d27 <__alltraps>

00101fee <vector77>:
.globl vector77
vector77:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $77
  101ff0:	6a 4d                	push   $0x4d
  jmp __alltraps
  101ff2:	e9 30 fd ff ff       	jmp    101d27 <__alltraps>

00101ff7 <vector78>:
.globl vector78
vector78:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $78
  101ff9:	6a 4e                	push   $0x4e
  jmp __alltraps
  101ffb:	e9 27 fd ff ff       	jmp    101d27 <__alltraps>

00102000 <vector79>:
.globl vector79
vector79:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $79
  102002:	6a 4f                	push   $0x4f
  jmp __alltraps
  102004:	e9 1e fd ff ff       	jmp    101d27 <__alltraps>

00102009 <vector80>:
.globl vector80
vector80:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $80
  10200b:	6a 50                	push   $0x50
  jmp __alltraps
  10200d:	e9 15 fd ff ff       	jmp    101d27 <__alltraps>

00102012 <vector81>:
.globl vector81
vector81:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $81
  102014:	6a 51                	push   $0x51
  jmp __alltraps
  102016:	e9 0c fd ff ff       	jmp    101d27 <__alltraps>

0010201b <vector82>:
.globl vector82
vector82:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $82
  10201d:	6a 52                	push   $0x52
  jmp __alltraps
  10201f:	e9 03 fd ff ff       	jmp    101d27 <__alltraps>

00102024 <vector83>:
.globl vector83
vector83:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $83
  102026:	6a 53                	push   $0x53
  jmp __alltraps
  102028:	e9 fa fc ff ff       	jmp    101d27 <__alltraps>

0010202d <vector84>:
.globl vector84
vector84:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $84
  10202f:	6a 54                	push   $0x54
  jmp __alltraps
  102031:	e9 f1 fc ff ff       	jmp    101d27 <__alltraps>

00102036 <vector85>:
.globl vector85
vector85:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $85
  102038:	6a 55                	push   $0x55
  jmp __alltraps
  10203a:	e9 e8 fc ff ff       	jmp    101d27 <__alltraps>

0010203f <vector86>:
.globl vector86
vector86:
  pushl $0
  10203f:	6a 00                	push   $0x0
  pushl $86
  102041:	6a 56                	push   $0x56
  jmp __alltraps
  102043:	e9 df fc ff ff       	jmp    101d27 <__alltraps>

00102048 <vector87>:
.globl vector87
vector87:
  pushl $0
  102048:	6a 00                	push   $0x0
  pushl $87
  10204a:	6a 57                	push   $0x57
  jmp __alltraps
  10204c:	e9 d6 fc ff ff       	jmp    101d27 <__alltraps>

00102051 <vector88>:
.globl vector88
vector88:
  pushl $0
  102051:	6a 00                	push   $0x0
  pushl $88
  102053:	6a 58                	push   $0x58
  jmp __alltraps
  102055:	e9 cd fc ff ff       	jmp    101d27 <__alltraps>

0010205a <vector89>:
.globl vector89
vector89:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $89
  10205c:	6a 59                	push   $0x59
  jmp __alltraps
  10205e:	e9 c4 fc ff ff       	jmp    101d27 <__alltraps>

00102063 <vector90>:
.globl vector90
vector90:
  pushl $0
  102063:	6a 00                	push   $0x0
  pushl $90
  102065:	6a 5a                	push   $0x5a
  jmp __alltraps
  102067:	e9 bb fc ff ff       	jmp    101d27 <__alltraps>

0010206c <vector91>:
.globl vector91
vector91:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $91
  10206e:	6a 5b                	push   $0x5b
  jmp __alltraps
  102070:	e9 b2 fc ff ff       	jmp    101d27 <__alltraps>

00102075 <vector92>:
.globl vector92
vector92:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $92
  102077:	6a 5c                	push   $0x5c
  jmp __alltraps
  102079:	e9 a9 fc ff ff       	jmp    101d27 <__alltraps>

0010207e <vector93>:
.globl vector93
vector93:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $93
  102080:	6a 5d                	push   $0x5d
  jmp __alltraps
  102082:	e9 a0 fc ff ff       	jmp    101d27 <__alltraps>

00102087 <vector94>:
.globl vector94
vector94:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $94
  102089:	6a 5e                	push   $0x5e
  jmp __alltraps
  10208b:	e9 97 fc ff ff       	jmp    101d27 <__alltraps>

00102090 <vector95>:
.globl vector95
vector95:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $95
  102092:	6a 5f                	push   $0x5f
  jmp __alltraps
  102094:	e9 8e fc ff ff       	jmp    101d27 <__alltraps>

00102099 <vector96>:
.globl vector96
vector96:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $96
  10209b:	6a 60                	push   $0x60
  jmp __alltraps
  10209d:	e9 85 fc ff ff       	jmp    101d27 <__alltraps>

001020a2 <vector97>:
.globl vector97
vector97:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $97
  1020a4:	6a 61                	push   $0x61
  jmp __alltraps
  1020a6:	e9 7c fc ff ff       	jmp    101d27 <__alltraps>

001020ab <vector98>:
.globl vector98
vector98:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $98
  1020ad:	6a 62                	push   $0x62
  jmp __alltraps
  1020af:	e9 73 fc ff ff       	jmp    101d27 <__alltraps>

001020b4 <vector99>:
.globl vector99
vector99:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $99
  1020b6:	6a 63                	push   $0x63
  jmp __alltraps
  1020b8:	e9 6a fc ff ff       	jmp    101d27 <__alltraps>

001020bd <vector100>:
.globl vector100
vector100:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $100
  1020bf:	6a 64                	push   $0x64
  jmp __alltraps
  1020c1:	e9 61 fc ff ff       	jmp    101d27 <__alltraps>

001020c6 <vector101>:
.globl vector101
vector101:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $101
  1020c8:	6a 65                	push   $0x65
  jmp __alltraps
  1020ca:	e9 58 fc ff ff       	jmp    101d27 <__alltraps>

001020cf <vector102>:
.globl vector102
vector102:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $102
  1020d1:	6a 66                	push   $0x66
  jmp __alltraps
  1020d3:	e9 4f fc ff ff       	jmp    101d27 <__alltraps>

001020d8 <vector103>:
.globl vector103
vector103:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $103
  1020da:	6a 67                	push   $0x67
  jmp __alltraps
  1020dc:	e9 46 fc ff ff       	jmp    101d27 <__alltraps>

001020e1 <vector104>:
.globl vector104
vector104:
  pushl $0
  1020e1:	6a 00                	push   $0x0
  pushl $104
  1020e3:	6a 68                	push   $0x68
  jmp __alltraps
  1020e5:	e9 3d fc ff ff       	jmp    101d27 <__alltraps>

001020ea <vector105>:
.globl vector105
vector105:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $105
  1020ec:	6a 69                	push   $0x69
  jmp __alltraps
  1020ee:	e9 34 fc ff ff       	jmp    101d27 <__alltraps>

001020f3 <vector106>:
.globl vector106
vector106:
  pushl $0
  1020f3:	6a 00                	push   $0x0
  pushl $106
  1020f5:	6a 6a                	push   $0x6a
  jmp __alltraps
  1020f7:	e9 2b fc ff ff       	jmp    101d27 <__alltraps>

001020fc <vector107>:
.globl vector107
vector107:
  pushl $0
  1020fc:	6a 00                	push   $0x0
  pushl $107
  1020fe:	6a 6b                	push   $0x6b
  jmp __alltraps
  102100:	e9 22 fc ff ff       	jmp    101d27 <__alltraps>

00102105 <vector108>:
.globl vector108
vector108:
  pushl $0
  102105:	6a 00                	push   $0x0
  pushl $108
  102107:	6a 6c                	push   $0x6c
  jmp __alltraps
  102109:	e9 19 fc ff ff       	jmp    101d27 <__alltraps>

0010210e <vector109>:
.globl vector109
vector109:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $109
  102110:	6a 6d                	push   $0x6d
  jmp __alltraps
  102112:	e9 10 fc ff ff       	jmp    101d27 <__alltraps>

00102117 <vector110>:
.globl vector110
vector110:
  pushl $0
  102117:	6a 00                	push   $0x0
  pushl $110
  102119:	6a 6e                	push   $0x6e
  jmp __alltraps
  10211b:	e9 07 fc ff ff       	jmp    101d27 <__alltraps>

00102120 <vector111>:
.globl vector111
vector111:
  pushl $0
  102120:	6a 00                	push   $0x0
  pushl $111
  102122:	6a 6f                	push   $0x6f
  jmp __alltraps
  102124:	e9 fe fb ff ff       	jmp    101d27 <__alltraps>

00102129 <vector112>:
.globl vector112
vector112:
  pushl $0
  102129:	6a 00                	push   $0x0
  pushl $112
  10212b:	6a 70                	push   $0x70
  jmp __alltraps
  10212d:	e9 f5 fb ff ff       	jmp    101d27 <__alltraps>

00102132 <vector113>:
.globl vector113
vector113:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $113
  102134:	6a 71                	push   $0x71
  jmp __alltraps
  102136:	e9 ec fb ff ff       	jmp    101d27 <__alltraps>

0010213b <vector114>:
.globl vector114
vector114:
  pushl $0
  10213b:	6a 00                	push   $0x0
  pushl $114
  10213d:	6a 72                	push   $0x72
  jmp __alltraps
  10213f:	e9 e3 fb ff ff       	jmp    101d27 <__alltraps>

00102144 <vector115>:
.globl vector115
vector115:
  pushl $0
  102144:	6a 00                	push   $0x0
  pushl $115
  102146:	6a 73                	push   $0x73
  jmp __alltraps
  102148:	e9 da fb ff ff       	jmp    101d27 <__alltraps>

0010214d <vector116>:
.globl vector116
vector116:
  pushl $0
  10214d:	6a 00                	push   $0x0
  pushl $116
  10214f:	6a 74                	push   $0x74
  jmp __alltraps
  102151:	e9 d1 fb ff ff       	jmp    101d27 <__alltraps>

00102156 <vector117>:
.globl vector117
vector117:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $117
  102158:	6a 75                	push   $0x75
  jmp __alltraps
  10215a:	e9 c8 fb ff ff       	jmp    101d27 <__alltraps>

0010215f <vector118>:
.globl vector118
vector118:
  pushl $0
  10215f:	6a 00                	push   $0x0
  pushl $118
  102161:	6a 76                	push   $0x76
  jmp __alltraps
  102163:	e9 bf fb ff ff       	jmp    101d27 <__alltraps>

00102168 <vector119>:
.globl vector119
vector119:
  pushl $0
  102168:	6a 00                	push   $0x0
  pushl $119
  10216a:	6a 77                	push   $0x77
  jmp __alltraps
  10216c:	e9 b6 fb ff ff       	jmp    101d27 <__alltraps>

00102171 <vector120>:
.globl vector120
vector120:
  pushl $0
  102171:	6a 00                	push   $0x0
  pushl $120
  102173:	6a 78                	push   $0x78
  jmp __alltraps
  102175:	e9 ad fb ff ff       	jmp    101d27 <__alltraps>

0010217a <vector121>:
.globl vector121
vector121:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $121
  10217c:	6a 79                	push   $0x79
  jmp __alltraps
  10217e:	e9 a4 fb ff ff       	jmp    101d27 <__alltraps>

00102183 <vector122>:
.globl vector122
vector122:
  pushl $0
  102183:	6a 00                	push   $0x0
  pushl $122
  102185:	6a 7a                	push   $0x7a
  jmp __alltraps
  102187:	e9 9b fb ff ff       	jmp    101d27 <__alltraps>

0010218c <vector123>:
.globl vector123
vector123:
  pushl $0
  10218c:	6a 00                	push   $0x0
  pushl $123
  10218e:	6a 7b                	push   $0x7b
  jmp __alltraps
  102190:	e9 92 fb ff ff       	jmp    101d27 <__alltraps>

00102195 <vector124>:
.globl vector124
vector124:
  pushl $0
  102195:	6a 00                	push   $0x0
  pushl $124
  102197:	6a 7c                	push   $0x7c
  jmp __alltraps
  102199:	e9 89 fb ff ff       	jmp    101d27 <__alltraps>

0010219e <vector125>:
.globl vector125
vector125:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $125
  1021a0:	6a 7d                	push   $0x7d
  jmp __alltraps
  1021a2:	e9 80 fb ff ff       	jmp    101d27 <__alltraps>

001021a7 <vector126>:
.globl vector126
vector126:
  pushl $0
  1021a7:	6a 00                	push   $0x0
  pushl $126
  1021a9:	6a 7e                	push   $0x7e
  jmp __alltraps
  1021ab:	e9 77 fb ff ff       	jmp    101d27 <__alltraps>

001021b0 <vector127>:
.globl vector127
vector127:
  pushl $0
  1021b0:	6a 00                	push   $0x0
  pushl $127
  1021b2:	6a 7f                	push   $0x7f
  jmp __alltraps
  1021b4:	e9 6e fb ff ff       	jmp    101d27 <__alltraps>

001021b9 <vector128>:
.globl vector128
vector128:
  pushl $0
  1021b9:	6a 00                	push   $0x0
  pushl $128
  1021bb:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1021c0:	e9 62 fb ff ff       	jmp    101d27 <__alltraps>

001021c5 <vector129>:
.globl vector129
vector129:
  pushl $0
  1021c5:	6a 00                	push   $0x0
  pushl $129
  1021c7:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1021cc:	e9 56 fb ff ff       	jmp    101d27 <__alltraps>

001021d1 <vector130>:
.globl vector130
vector130:
  pushl $0
  1021d1:	6a 00                	push   $0x0
  pushl $130
  1021d3:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1021d8:	e9 4a fb ff ff       	jmp    101d27 <__alltraps>

001021dd <vector131>:
.globl vector131
vector131:
  pushl $0
  1021dd:	6a 00                	push   $0x0
  pushl $131
  1021df:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1021e4:	e9 3e fb ff ff       	jmp    101d27 <__alltraps>

001021e9 <vector132>:
.globl vector132
vector132:
  pushl $0
  1021e9:	6a 00                	push   $0x0
  pushl $132
  1021eb:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1021f0:	e9 32 fb ff ff       	jmp    101d27 <__alltraps>

001021f5 <vector133>:
.globl vector133
vector133:
  pushl $0
  1021f5:	6a 00                	push   $0x0
  pushl $133
  1021f7:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1021fc:	e9 26 fb ff ff       	jmp    101d27 <__alltraps>

00102201 <vector134>:
.globl vector134
vector134:
  pushl $0
  102201:	6a 00                	push   $0x0
  pushl $134
  102203:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102208:	e9 1a fb ff ff       	jmp    101d27 <__alltraps>

0010220d <vector135>:
.globl vector135
vector135:
  pushl $0
  10220d:	6a 00                	push   $0x0
  pushl $135
  10220f:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102214:	e9 0e fb ff ff       	jmp    101d27 <__alltraps>

00102219 <vector136>:
.globl vector136
vector136:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $136
  10221b:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102220:	e9 02 fb ff ff       	jmp    101d27 <__alltraps>

00102225 <vector137>:
.globl vector137
vector137:
  pushl $0
  102225:	6a 00                	push   $0x0
  pushl $137
  102227:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10222c:	e9 f6 fa ff ff       	jmp    101d27 <__alltraps>

00102231 <vector138>:
.globl vector138
vector138:
  pushl $0
  102231:	6a 00                	push   $0x0
  pushl $138
  102233:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102238:	e9 ea fa ff ff       	jmp    101d27 <__alltraps>

0010223d <vector139>:
.globl vector139
vector139:
  pushl $0
  10223d:	6a 00                	push   $0x0
  pushl $139
  10223f:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102244:	e9 de fa ff ff       	jmp    101d27 <__alltraps>

00102249 <vector140>:
.globl vector140
vector140:
  pushl $0
  102249:	6a 00                	push   $0x0
  pushl $140
  10224b:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102250:	e9 d2 fa ff ff       	jmp    101d27 <__alltraps>

00102255 <vector141>:
.globl vector141
vector141:
  pushl $0
  102255:	6a 00                	push   $0x0
  pushl $141
  102257:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10225c:	e9 c6 fa ff ff       	jmp    101d27 <__alltraps>

00102261 <vector142>:
.globl vector142
vector142:
  pushl $0
  102261:	6a 00                	push   $0x0
  pushl $142
  102263:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102268:	e9 ba fa ff ff       	jmp    101d27 <__alltraps>

0010226d <vector143>:
.globl vector143
vector143:
  pushl $0
  10226d:	6a 00                	push   $0x0
  pushl $143
  10226f:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102274:	e9 ae fa ff ff       	jmp    101d27 <__alltraps>

00102279 <vector144>:
.globl vector144
vector144:
  pushl $0
  102279:	6a 00                	push   $0x0
  pushl $144
  10227b:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102280:	e9 a2 fa ff ff       	jmp    101d27 <__alltraps>

00102285 <vector145>:
.globl vector145
vector145:
  pushl $0
  102285:	6a 00                	push   $0x0
  pushl $145
  102287:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10228c:	e9 96 fa ff ff       	jmp    101d27 <__alltraps>

00102291 <vector146>:
.globl vector146
vector146:
  pushl $0
  102291:	6a 00                	push   $0x0
  pushl $146
  102293:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102298:	e9 8a fa ff ff       	jmp    101d27 <__alltraps>

0010229d <vector147>:
.globl vector147
vector147:
  pushl $0
  10229d:	6a 00                	push   $0x0
  pushl $147
  10229f:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1022a4:	e9 7e fa ff ff       	jmp    101d27 <__alltraps>

001022a9 <vector148>:
.globl vector148
vector148:
  pushl $0
  1022a9:	6a 00                	push   $0x0
  pushl $148
  1022ab:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1022b0:	e9 72 fa ff ff       	jmp    101d27 <__alltraps>

001022b5 <vector149>:
.globl vector149
vector149:
  pushl $0
  1022b5:	6a 00                	push   $0x0
  pushl $149
  1022b7:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1022bc:	e9 66 fa ff ff       	jmp    101d27 <__alltraps>

001022c1 <vector150>:
.globl vector150
vector150:
  pushl $0
  1022c1:	6a 00                	push   $0x0
  pushl $150
  1022c3:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1022c8:	e9 5a fa ff ff       	jmp    101d27 <__alltraps>

001022cd <vector151>:
.globl vector151
vector151:
  pushl $0
  1022cd:	6a 00                	push   $0x0
  pushl $151
  1022cf:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1022d4:	e9 4e fa ff ff       	jmp    101d27 <__alltraps>

001022d9 <vector152>:
.globl vector152
vector152:
  pushl $0
  1022d9:	6a 00                	push   $0x0
  pushl $152
  1022db:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1022e0:	e9 42 fa ff ff       	jmp    101d27 <__alltraps>

001022e5 <vector153>:
.globl vector153
vector153:
  pushl $0
  1022e5:	6a 00                	push   $0x0
  pushl $153
  1022e7:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1022ec:	e9 36 fa ff ff       	jmp    101d27 <__alltraps>

001022f1 <vector154>:
.globl vector154
vector154:
  pushl $0
  1022f1:	6a 00                	push   $0x0
  pushl $154
  1022f3:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1022f8:	e9 2a fa ff ff       	jmp    101d27 <__alltraps>

001022fd <vector155>:
.globl vector155
vector155:
  pushl $0
  1022fd:	6a 00                	push   $0x0
  pushl $155
  1022ff:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102304:	e9 1e fa ff ff       	jmp    101d27 <__alltraps>

00102309 <vector156>:
.globl vector156
vector156:
  pushl $0
  102309:	6a 00                	push   $0x0
  pushl $156
  10230b:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102310:	e9 12 fa ff ff       	jmp    101d27 <__alltraps>

00102315 <vector157>:
.globl vector157
vector157:
  pushl $0
  102315:	6a 00                	push   $0x0
  pushl $157
  102317:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10231c:	e9 06 fa ff ff       	jmp    101d27 <__alltraps>

00102321 <vector158>:
.globl vector158
vector158:
  pushl $0
  102321:	6a 00                	push   $0x0
  pushl $158
  102323:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102328:	e9 fa f9 ff ff       	jmp    101d27 <__alltraps>

0010232d <vector159>:
.globl vector159
vector159:
  pushl $0
  10232d:	6a 00                	push   $0x0
  pushl $159
  10232f:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102334:	e9 ee f9 ff ff       	jmp    101d27 <__alltraps>

00102339 <vector160>:
.globl vector160
vector160:
  pushl $0
  102339:	6a 00                	push   $0x0
  pushl $160
  10233b:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102340:	e9 e2 f9 ff ff       	jmp    101d27 <__alltraps>

00102345 <vector161>:
.globl vector161
vector161:
  pushl $0
  102345:	6a 00                	push   $0x0
  pushl $161
  102347:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10234c:	e9 d6 f9 ff ff       	jmp    101d27 <__alltraps>

00102351 <vector162>:
.globl vector162
vector162:
  pushl $0
  102351:	6a 00                	push   $0x0
  pushl $162
  102353:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102358:	e9 ca f9 ff ff       	jmp    101d27 <__alltraps>

0010235d <vector163>:
.globl vector163
vector163:
  pushl $0
  10235d:	6a 00                	push   $0x0
  pushl $163
  10235f:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102364:	e9 be f9 ff ff       	jmp    101d27 <__alltraps>

00102369 <vector164>:
.globl vector164
vector164:
  pushl $0
  102369:	6a 00                	push   $0x0
  pushl $164
  10236b:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102370:	e9 b2 f9 ff ff       	jmp    101d27 <__alltraps>

00102375 <vector165>:
.globl vector165
vector165:
  pushl $0
  102375:	6a 00                	push   $0x0
  pushl $165
  102377:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10237c:	e9 a6 f9 ff ff       	jmp    101d27 <__alltraps>

00102381 <vector166>:
.globl vector166
vector166:
  pushl $0
  102381:	6a 00                	push   $0x0
  pushl $166
  102383:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102388:	e9 9a f9 ff ff       	jmp    101d27 <__alltraps>

0010238d <vector167>:
.globl vector167
vector167:
  pushl $0
  10238d:	6a 00                	push   $0x0
  pushl $167
  10238f:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102394:	e9 8e f9 ff ff       	jmp    101d27 <__alltraps>

00102399 <vector168>:
.globl vector168
vector168:
  pushl $0
  102399:	6a 00                	push   $0x0
  pushl $168
  10239b:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1023a0:	e9 82 f9 ff ff       	jmp    101d27 <__alltraps>

001023a5 <vector169>:
.globl vector169
vector169:
  pushl $0
  1023a5:	6a 00                	push   $0x0
  pushl $169
  1023a7:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1023ac:	e9 76 f9 ff ff       	jmp    101d27 <__alltraps>

001023b1 <vector170>:
.globl vector170
vector170:
  pushl $0
  1023b1:	6a 00                	push   $0x0
  pushl $170
  1023b3:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1023b8:	e9 6a f9 ff ff       	jmp    101d27 <__alltraps>

001023bd <vector171>:
.globl vector171
vector171:
  pushl $0
  1023bd:	6a 00                	push   $0x0
  pushl $171
  1023bf:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1023c4:	e9 5e f9 ff ff       	jmp    101d27 <__alltraps>

001023c9 <vector172>:
.globl vector172
vector172:
  pushl $0
  1023c9:	6a 00                	push   $0x0
  pushl $172
  1023cb:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1023d0:	e9 52 f9 ff ff       	jmp    101d27 <__alltraps>

001023d5 <vector173>:
.globl vector173
vector173:
  pushl $0
  1023d5:	6a 00                	push   $0x0
  pushl $173
  1023d7:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1023dc:	e9 46 f9 ff ff       	jmp    101d27 <__alltraps>

001023e1 <vector174>:
.globl vector174
vector174:
  pushl $0
  1023e1:	6a 00                	push   $0x0
  pushl $174
  1023e3:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1023e8:	e9 3a f9 ff ff       	jmp    101d27 <__alltraps>

001023ed <vector175>:
.globl vector175
vector175:
  pushl $0
  1023ed:	6a 00                	push   $0x0
  pushl $175
  1023ef:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1023f4:	e9 2e f9 ff ff       	jmp    101d27 <__alltraps>

001023f9 <vector176>:
.globl vector176
vector176:
  pushl $0
  1023f9:	6a 00                	push   $0x0
  pushl $176
  1023fb:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102400:	e9 22 f9 ff ff       	jmp    101d27 <__alltraps>

00102405 <vector177>:
.globl vector177
vector177:
  pushl $0
  102405:	6a 00                	push   $0x0
  pushl $177
  102407:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10240c:	e9 16 f9 ff ff       	jmp    101d27 <__alltraps>

00102411 <vector178>:
.globl vector178
vector178:
  pushl $0
  102411:	6a 00                	push   $0x0
  pushl $178
  102413:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102418:	e9 0a f9 ff ff       	jmp    101d27 <__alltraps>

0010241d <vector179>:
.globl vector179
vector179:
  pushl $0
  10241d:	6a 00                	push   $0x0
  pushl $179
  10241f:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102424:	e9 fe f8 ff ff       	jmp    101d27 <__alltraps>

00102429 <vector180>:
.globl vector180
vector180:
  pushl $0
  102429:	6a 00                	push   $0x0
  pushl $180
  10242b:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102430:	e9 f2 f8 ff ff       	jmp    101d27 <__alltraps>

00102435 <vector181>:
.globl vector181
vector181:
  pushl $0
  102435:	6a 00                	push   $0x0
  pushl $181
  102437:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10243c:	e9 e6 f8 ff ff       	jmp    101d27 <__alltraps>

00102441 <vector182>:
.globl vector182
vector182:
  pushl $0
  102441:	6a 00                	push   $0x0
  pushl $182
  102443:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102448:	e9 da f8 ff ff       	jmp    101d27 <__alltraps>

0010244d <vector183>:
.globl vector183
vector183:
  pushl $0
  10244d:	6a 00                	push   $0x0
  pushl $183
  10244f:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102454:	e9 ce f8 ff ff       	jmp    101d27 <__alltraps>

00102459 <vector184>:
.globl vector184
vector184:
  pushl $0
  102459:	6a 00                	push   $0x0
  pushl $184
  10245b:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102460:	e9 c2 f8 ff ff       	jmp    101d27 <__alltraps>

00102465 <vector185>:
.globl vector185
vector185:
  pushl $0
  102465:	6a 00                	push   $0x0
  pushl $185
  102467:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10246c:	e9 b6 f8 ff ff       	jmp    101d27 <__alltraps>

00102471 <vector186>:
.globl vector186
vector186:
  pushl $0
  102471:	6a 00                	push   $0x0
  pushl $186
  102473:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102478:	e9 aa f8 ff ff       	jmp    101d27 <__alltraps>

0010247d <vector187>:
.globl vector187
vector187:
  pushl $0
  10247d:	6a 00                	push   $0x0
  pushl $187
  10247f:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102484:	e9 9e f8 ff ff       	jmp    101d27 <__alltraps>

00102489 <vector188>:
.globl vector188
vector188:
  pushl $0
  102489:	6a 00                	push   $0x0
  pushl $188
  10248b:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102490:	e9 92 f8 ff ff       	jmp    101d27 <__alltraps>

00102495 <vector189>:
.globl vector189
vector189:
  pushl $0
  102495:	6a 00                	push   $0x0
  pushl $189
  102497:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10249c:	e9 86 f8 ff ff       	jmp    101d27 <__alltraps>

001024a1 <vector190>:
.globl vector190
vector190:
  pushl $0
  1024a1:	6a 00                	push   $0x0
  pushl $190
  1024a3:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1024a8:	e9 7a f8 ff ff       	jmp    101d27 <__alltraps>

001024ad <vector191>:
.globl vector191
vector191:
  pushl $0
  1024ad:	6a 00                	push   $0x0
  pushl $191
  1024af:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1024b4:	e9 6e f8 ff ff       	jmp    101d27 <__alltraps>

001024b9 <vector192>:
.globl vector192
vector192:
  pushl $0
  1024b9:	6a 00                	push   $0x0
  pushl $192
  1024bb:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1024c0:	e9 62 f8 ff ff       	jmp    101d27 <__alltraps>

001024c5 <vector193>:
.globl vector193
vector193:
  pushl $0
  1024c5:	6a 00                	push   $0x0
  pushl $193
  1024c7:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1024cc:	e9 56 f8 ff ff       	jmp    101d27 <__alltraps>

001024d1 <vector194>:
.globl vector194
vector194:
  pushl $0
  1024d1:	6a 00                	push   $0x0
  pushl $194
  1024d3:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1024d8:	e9 4a f8 ff ff       	jmp    101d27 <__alltraps>

001024dd <vector195>:
.globl vector195
vector195:
  pushl $0
  1024dd:	6a 00                	push   $0x0
  pushl $195
  1024df:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1024e4:	e9 3e f8 ff ff       	jmp    101d27 <__alltraps>

001024e9 <vector196>:
.globl vector196
vector196:
  pushl $0
  1024e9:	6a 00                	push   $0x0
  pushl $196
  1024eb:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1024f0:	e9 32 f8 ff ff       	jmp    101d27 <__alltraps>

001024f5 <vector197>:
.globl vector197
vector197:
  pushl $0
  1024f5:	6a 00                	push   $0x0
  pushl $197
  1024f7:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1024fc:	e9 26 f8 ff ff       	jmp    101d27 <__alltraps>

00102501 <vector198>:
.globl vector198
vector198:
  pushl $0
  102501:	6a 00                	push   $0x0
  pushl $198
  102503:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102508:	e9 1a f8 ff ff       	jmp    101d27 <__alltraps>

0010250d <vector199>:
.globl vector199
vector199:
  pushl $0
  10250d:	6a 00                	push   $0x0
  pushl $199
  10250f:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102514:	e9 0e f8 ff ff       	jmp    101d27 <__alltraps>

00102519 <vector200>:
.globl vector200
vector200:
  pushl $0
  102519:	6a 00                	push   $0x0
  pushl $200
  10251b:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102520:	e9 02 f8 ff ff       	jmp    101d27 <__alltraps>

00102525 <vector201>:
.globl vector201
vector201:
  pushl $0
  102525:	6a 00                	push   $0x0
  pushl $201
  102527:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10252c:	e9 f6 f7 ff ff       	jmp    101d27 <__alltraps>

00102531 <vector202>:
.globl vector202
vector202:
  pushl $0
  102531:	6a 00                	push   $0x0
  pushl $202
  102533:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102538:	e9 ea f7 ff ff       	jmp    101d27 <__alltraps>

0010253d <vector203>:
.globl vector203
vector203:
  pushl $0
  10253d:	6a 00                	push   $0x0
  pushl $203
  10253f:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102544:	e9 de f7 ff ff       	jmp    101d27 <__alltraps>

00102549 <vector204>:
.globl vector204
vector204:
  pushl $0
  102549:	6a 00                	push   $0x0
  pushl $204
  10254b:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102550:	e9 d2 f7 ff ff       	jmp    101d27 <__alltraps>

00102555 <vector205>:
.globl vector205
vector205:
  pushl $0
  102555:	6a 00                	push   $0x0
  pushl $205
  102557:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10255c:	e9 c6 f7 ff ff       	jmp    101d27 <__alltraps>

00102561 <vector206>:
.globl vector206
vector206:
  pushl $0
  102561:	6a 00                	push   $0x0
  pushl $206
  102563:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102568:	e9 ba f7 ff ff       	jmp    101d27 <__alltraps>

0010256d <vector207>:
.globl vector207
vector207:
  pushl $0
  10256d:	6a 00                	push   $0x0
  pushl $207
  10256f:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102574:	e9 ae f7 ff ff       	jmp    101d27 <__alltraps>

00102579 <vector208>:
.globl vector208
vector208:
  pushl $0
  102579:	6a 00                	push   $0x0
  pushl $208
  10257b:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102580:	e9 a2 f7 ff ff       	jmp    101d27 <__alltraps>

00102585 <vector209>:
.globl vector209
vector209:
  pushl $0
  102585:	6a 00                	push   $0x0
  pushl $209
  102587:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10258c:	e9 96 f7 ff ff       	jmp    101d27 <__alltraps>

00102591 <vector210>:
.globl vector210
vector210:
  pushl $0
  102591:	6a 00                	push   $0x0
  pushl $210
  102593:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102598:	e9 8a f7 ff ff       	jmp    101d27 <__alltraps>

0010259d <vector211>:
.globl vector211
vector211:
  pushl $0
  10259d:	6a 00                	push   $0x0
  pushl $211
  10259f:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1025a4:	e9 7e f7 ff ff       	jmp    101d27 <__alltraps>

001025a9 <vector212>:
.globl vector212
vector212:
  pushl $0
  1025a9:	6a 00                	push   $0x0
  pushl $212
  1025ab:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1025b0:	e9 72 f7 ff ff       	jmp    101d27 <__alltraps>

001025b5 <vector213>:
.globl vector213
vector213:
  pushl $0
  1025b5:	6a 00                	push   $0x0
  pushl $213
  1025b7:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1025bc:	e9 66 f7 ff ff       	jmp    101d27 <__alltraps>

001025c1 <vector214>:
.globl vector214
vector214:
  pushl $0
  1025c1:	6a 00                	push   $0x0
  pushl $214
  1025c3:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1025c8:	e9 5a f7 ff ff       	jmp    101d27 <__alltraps>

001025cd <vector215>:
.globl vector215
vector215:
  pushl $0
  1025cd:	6a 00                	push   $0x0
  pushl $215
  1025cf:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1025d4:	e9 4e f7 ff ff       	jmp    101d27 <__alltraps>

001025d9 <vector216>:
.globl vector216
vector216:
  pushl $0
  1025d9:	6a 00                	push   $0x0
  pushl $216
  1025db:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1025e0:	e9 42 f7 ff ff       	jmp    101d27 <__alltraps>

001025e5 <vector217>:
.globl vector217
vector217:
  pushl $0
  1025e5:	6a 00                	push   $0x0
  pushl $217
  1025e7:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1025ec:	e9 36 f7 ff ff       	jmp    101d27 <__alltraps>

001025f1 <vector218>:
.globl vector218
vector218:
  pushl $0
  1025f1:	6a 00                	push   $0x0
  pushl $218
  1025f3:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1025f8:	e9 2a f7 ff ff       	jmp    101d27 <__alltraps>

001025fd <vector219>:
.globl vector219
vector219:
  pushl $0
  1025fd:	6a 00                	push   $0x0
  pushl $219
  1025ff:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102604:	e9 1e f7 ff ff       	jmp    101d27 <__alltraps>

00102609 <vector220>:
.globl vector220
vector220:
  pushl $0
  102609:	6a 00                	push   $0x0
  pushl $220
  10260b:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102610:	e9 12 f7 ff ff       	jmp    101d27 <__alltraps>

00102615 <vector221>:
.globl vector221
vector221:
  pushl $0
  102615:	6a 00                	push   $0x0
  pushl $221
  102617:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10261c:	e9 06 f7 ff ff       	jmp    101d27 <__alltraps>

00102621 <vector222>:
.globl vector222
vector222:
  pushl $0
  102621:	6a 00                	push   $0x0
  pushl $222
  102623:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102628:	e9 fa f6 ff ff       	jmp    101d27 <__alltraps>

0010262d <vector223>:
.globl vector223
vector223:
  pushl $0
  10262d:	6a 00                	push   $0x0
  pushl $223
  10262f:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102634:	e9 ee f6 ff ff       	jmp    101d27 <__alltraps>

00102639 <vector224>:
.globl vector224
vector224:
  pushl $0
  102639:	6a 00                	push   $0x0
  pushl $224
  10263b:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102640:	e9 e2 f6 ff ff       	jmp    101d27 <__alltraps>

00102645 <vector225>:
.globl vector225
vector225:
  pushl $0
  102645:	6a 00                	push   $0x0
  pushl $225
  102647:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10264c:	e9 d6 f6 ff ff       	jmp    101d27 <__alltraps>

00102651 <vector226>:
.globl vector226
vector226:
  pushl $0
  102651:	6a 00                	push   $0x0
  pushl $226
  102653:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102658:	e9 ca f6 ff ff       	jmp    101d27 <__alltraps>

0010265d <vector227>:
.globl vector227
vector227:
  pushl $0
  10265d:	6a 00                	push   $0x0
  pushl $227
  10265f:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102664:	e9 be f6 ff ff       	jmp    101d27 <__alltraps>

00102669 <vector228>:
.globl vector228
vector228:
  pushl $0
  102669:	6a 00                	push   $0x0
  pushl $228
  10266b:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102670:	e9 b2 f6 ff ff       	jmp    101d27 <__alltraps>

00102675 <vector229>:
.globl vector229
vector229:
  pushl $0
  102675:	6a 00                	push   $0x0
  pushl $229
  102677:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10267c:	e9 a6 f6 ff ff       	jmp    101d27 <__alltraps>

00102681 <vector230>:
.globl vector230
vector230:
  pushl $0
  102681:	6a 00                	push   $0x0
  pushl $230
  102683:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102688:	e9 9a f6 ff ff       	jmp    101d27 <__alltraps>

0010268d <vector231>:
.globl vector231
vector231:
  pushl $0
  10268d:	6a 00                	push   $0x0
  pushl $231
  10268f:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102694:	e9 8e f6 ff ff       	jmp    101d27 <__alltraps>

00102699 <vector232>:
.globl vector232
vector232:
  pushl $0
  102699:	6a 00                	push   $0x0
  pushl $232
  10269b:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1026a0:	e9 82 f6 ff ff       	jmp    101d27 <__alltraps>

001026a5 <vector233>:
.globl vector233
vector233:
  pushl $0
  1026a5:	6a 00                	push   $0x0
  pushl $233
  1026a7:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1026ac:	e9 76 f6 ff ff       	jmp    101d27 <__alltraps>

001026b1 <vector234>:
.globl vector234
vector234:
  pushl $0
  1026b1:	6a 00                	push   $0x0
  pushl $234
  1026b3:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1026b8:	e9 6a f6 ff ff       	jmp    101d27 <__alltraps>

001026bd <vector235>:
.globl vector235
vector235:
  pushl $0
  1026bd:	6a 00                	push   $0x0
  pushl $235
  1026bf:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1026c4:	e9 5e f6 ff ff       	jmp    101d27 <__alltraps>

001026c9 <vector236>:
.globl vector236
vector236:
  pushl $0
  1026c9:	6a 00                	push   $0x0
  pushl $236
  1026cb:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1026d0:	e9 52 f6 ff ff       	jmp    101d27 <__alltraps>

001026d5 <vector237>:
.globl vector237
vector237:
  pushl $0
  1026d5:	6a 00                	push   $0x0
  pushl $237
  1026d7:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1026dc:	e9 46 f6 ff ff       	jmp    101d27 <__alltraps>

001026e1 <vector238>:
.globl vector238
vector238:
  pushl $0
  1026e1:	6a 00                	push   $0x0
  pushl $238
  1026e3:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1026e8:	e9 3a f6 ff ff       	jmp    101d27 <__alltraps>

001026ed <vector239>:
.globl vector239
vector239:
  pushl $0
  1026ed:	6a 00                	push   $0x0
  pushl $239
  1026ef:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1026f4:	e9 2e f6 ff ff       	jmp    101d27 <__alltraps>

001026f9 <vector240>:
.globl vector240
vector240:
  pushl $0
  1026f9:	6a 00                	push   $0x0
  pushl $240
  1026fb:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102700:	e9 22 f6 ff ff       	jmp    101d27 <__alltraps>

00102705 <vector241>:
.globl vector241
vector241:
  pushl $0
  102705:	6a 00                	push   $0x0
  pushl $241
  102707:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10270c:	e9 16 f6 ff ff       	jmp    101d27 <__alltraps>

00102711 <vector242>:
.globl vector242
vector242:
  pushl $0
  102711:	6a 00                	push   $0x0
  pushl $242
  102713:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102718:	e9 0a f6 ff ff       	jmp    101d27 <__alltraps>

0010271d <vector243>:
.globl vector243
vector243:
  pushl $0
  10271d:	6a 00                	push   $0x0
  pushl $243
  10271f:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102724:	e9 fe f5 ff ff       	jmp    101d27 <__alltraps>

00102729 <vector244>:
.globl vector244
vector244:
  pushl $0
  102729:	6a 00                	push   $0x0
  pushl $244
  10272b:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102730:	e9 f2 f5 ff ff       	jmp    101d27 <__alltraps>

00102735 <vector245>:
.globl vector245
vector245:
  pushl $0
  102735:	6a 00                	push   $0x0
  pushl $245
  102737:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10273c:	e9 e6 f5 ff ff       	jmp    101d27 <__alltraps>

00102741 <vector246>:
.globl vector246
vector246:
  pushl $0
  102741:	6a 00                	push   $0x0
  pushl $246
  102743:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102748:	e9 da f5 ff ff       	jmp    101d27 <__alltraps>

0010274d <vector247>:
.globl vector247
vector247:
  pushl $0
  10274d:	6a 00                	push   $0x0
  pushl $247
  10274f:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102754:	e9 ce f5 ff ff       	jmp    101d27 <__alltraps>

00102759 <vector248>:
.globl vector248
vector248:
  pushl $0
  102759:	6a 00                	push   $0x0
  pushl $248
  10275b:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102760:	e9 c2 f5 ff ff       	jmp    101d27 <__alltraps>

00102765 <vector249>:
.globl vector249
vector249:
  pushl $0
  102765:	6a 00                	push   $0x0
  pushl $249
  102767:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10276c:	e9 b6 f5 ff ff       	jmp    101d27 <__alltraps>

00102771 <vector250>:
.globl vector250
vector250:
  pushl $0
  102771:	6a 00                	push   $0x0
  pushl $250
  102773:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102778:	e9 aa f5 ff ff       	jmp    101d27 <__alltraps>

0010277d <vector251>:
.globl vector251
vector251:
  pushl $0
  10277d:	6a 00                	push   $0x0
  pushl $251
  10277f:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102784:	e9 9e f5 ff ff       	jmp    101d27 <__alltraps>

00102789 <vector252>:
.globl vector252
vector252:
  pushl $0
  102789:	6a 00                	push   $0x0
  pushl $252
  10278b:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102790:	e9 92 f5 ff ff       	jmp    101d27 <__alltraps>

00102795 <vector253>:
.globl vector253
vector253:
  pushl $0
  102795:	6a 00                	push   $0x0
  pushl $253
  102797:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10279c:	e9 86 f5 ff ff       	jmp    101d27 <__alltraps>

001027a1 <vector254>:
.globl vector254
vector254:
  pushl $0
  1027a1:	6a 00                	push   $0x0
  pushl $254
  1027a3:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1027a8:	e9 7a f5 ff ff       	jmp    101d27 <__alltraps>

001027ad <vector255>:
.globl vector255
vector255:
  pushl $0
  1027ad:	6a 00                	push   $0x0
  pushl $255
  1027af:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1027b4:	e9 6e f5 ff ff       	jmp    101d27 <__alltraps>

001027b9 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1027b9:	55                   	push   %ebp
  1027ba:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1027bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1027bf:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1027c2:	b8 23 00 00 00       	mov    $0x23,%eax
  1027c7:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1027c9:	b8 23 00 00 00       	mov    $0x23,%eax
  1027ce:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1027d0:	b8 10 00 00 00       	mov    $0x10,%eax
  1027d5:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1027d7:	b8 10 00 00 00       	mov    $0x10,%eax
  1027dc:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1027de:	b8 10 00 00 00       	mov    $0x10,%eax
  1027e3:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1027e5:	ea ec 27 10 00 08 00 	ljmp   $0x8,$0x1027ec
}
  1027ec:	5d                   	pop    %ebp
  1027ed:	c3                   	ret    

001027ee <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1027ee:	55                   	push   %ebp
  1027ef:	89 e5                	mov    %esp,%ebp
  1027f1:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027f4:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1027f9:	05 00 04 00 00       	add    $0x400,%eax
  1027fe:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102803:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  10280a:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10280c:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102813:	68 00 
  102815:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10281a:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102820:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102825:	c1 e8 10             	shr    $0x10,%eax
  102828:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  10282d:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102834:	83 e0 f0             	and    $0xfffffff0,%eax
  102837:	83 c8 09             	or     $0x9,%eax
  10283a:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10283f:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102846:	83 c8 10             	or     $0x10,%eax
  102849:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10284e:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102855:	83 e0 9f             	and    $0xffffff9f,%eax
  102858:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10285d:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102864:	83 c8 80             	or     $0xffffff80,%eax
  102867:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10286c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102873:	83 e0 f0             	and    $0xfffffff0,%eax
  102876:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10287b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102882:	83 e0 ef             	and    $0xffffffef,%eax
  102885:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10288a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102891:	83 e0 df             	and    $0xffffffdf,%eax
  102894:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102899:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028a0:	83 c8 40             	or     $0x40,%eax
  1028a3:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028a8:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028af:	83 e0 7f             	and    $0x7f,%eax
  1028b2:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028b7:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028bc:	c1 e8 18             	shr    $0x18,%eax
  1028bf:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  1028c4:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028cb:	83 e0 ef             	and    $0xffffffef,%eax
  1028ce:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1028d3:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  1028da:	e8 da fe ff ff       	call   1027b9 <lgdt>
  1028df:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {// Load Task Register
    asm volatile ("ltr %0" :: "r" (sel));
  1028e5:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1028e9:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  1028ec:	c9                   	leave  
  1028ed:	c3                   	ret    

001028ee <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1028ee:	55                   	push   %ebp
  1028ef:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1028f1:	e8 f8 fe ff ff       	call   1027ee <gdt_init>
}
  1028f6:	5d                   	pop    %ebp
  1028f7:	c3                   	ret    

001028f8 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1028f8:	55                   	push   %ebp
  1028f9:	89 e5                	mov    %esp,%ebp
  1028fb:	83 ec 58             	sub    $0x58,%esp
  1028fe:	8b 45 10             	mov    0x10(%ebp),%eax
  102901:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102904:	8b 45 14             	mov    0x14(%ebp),%eax
  102907:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  10290a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10290d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102910:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102913:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102916:	8b 45 18             	mov    0x18(%ebp),%eax
  102919:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10291c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10291f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102922:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102925:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102928:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10292b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10292e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102932:	74 1c                	je     102950 <printnum+0x58>
  102934:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102937:	ba 00 00 00 00       	mov    $0x0,%edx
  10293c:	f7 75 e4             	divl   -0x1c(%ebp)
  10293f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102942:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102945:	ba 00 00 00 00       	mov    $0x0,%edx
  10294a:	f7 75 e4             	divl   -0x1c(%ebp)
  10294d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102950:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102953:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102956:	f7 75 e4             	divl   -0x1c(%ebp)
  102959:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10295c:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10295f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102962:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102965:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102968:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10296b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10296e:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102971:	8b 45 18             	mov    0x18(%ebp),%eax
  102974:	ba 00 00 00 00       	mov    $0x0,%edx
  102979:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10297c:	77 56                	ja     1029d4 <printnum+0xdc>
  10297e:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102981:	72 05                	jb     102988 <printnum+0x90>
  102983:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102986:	77 4c                	ja     1029d4 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102988:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10298b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10298e:	8b 45 20             	mov    0x20(%ebp),%eax
  102991:	89 44 24 18          	mov    %eax,0x18(%esp)
  102995:	89 54 24 14          	mov    %edx,0x14(%esp)
  102999:	8b 45 18             	mov    0x18(%ebp),%eax
  10299c:	89 44 24 10          	mov    %eax,0x10(%esp)
  1029a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1029a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1029a6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1029aa:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1029ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029b1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b8:	89 04 24             	mov    %eax,(%esp)
  1029bb:	e8 38 ff ff ff       	call   1028f8 <printnum>
  1029c0:	eb 1c                	jmp    1029de <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1029c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029c5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029c9:	8b 45 20             	mov    0x20(%ebp),%eax
  1029cc:	89 04 24             	mov    %eax,(%esp)
  1029cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d2:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  1029d4:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  1029d8:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1029dc:	7f e4                	jg     1029c2 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1029de:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1029e1:	05 f0 3b 10 00       	add    $0x103bf0,%eax
  1029e6:	0f b6 00             	movzbl (%eax),%eax
  1029e9:	0f be c0             	movsbl %al,%eax
  1029ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029ef:	89 54 24 04          	mov    %edx,0x4(%esp)
  1029f3:	89 04 24             	mov    %eax,(%esp)
  1029f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f9:	ff d0                	call   *%eax
}
  1029fb:	c9                   	leave  
  1029fc:	c3                   	ret    

001029fd <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1029fd:	55                   	push   %ebp
  1029fe:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a00:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a04:	7e 14                	jle    102a1a <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102a06:	8b 45 08             	mov    0x8(%ebp),%eax
  102a09:	8b 00                	mov    (%eax),%eax
  102a0b:	8d 48 08             	lea    0x8(%eax),%ecx
  102a0e:	8b 55 08             	mov    0x8(%ebp),%edx
  102a11:	89 0a                	mov    %ecx,(%edx)
  102a13:	8b 50 04             	mov    0x4(%eax),%edx
  102a16:	8b 00                	mov    (%eax),%eax
  102a18:	eb 30                	jmp    102a4a <getuint+0x4d>
    }
    else if (lflag) {
  102a1a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a1e:	74 16                	je     102a36 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102a20:	8b 45 08             	mov    0x8(%ebp),%eax
  102a23:	8b 00                	mov    (%eax),%eax
  102a25:	8d 48 04             	lea    0x4(%eax),%ecx
  102a28:	8b 55 08             	mov    0x8(%ebp),%edx
  102a2b:	89 0a                	mov    %ecx,(%edx)
  102a2d:	8b 00                	mov    (%eax),%eax
  102a2f:	ba 00 00 00 00       	mov    $0x0,%edx
  102a34:	eb 14                	jmp    102a4a <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102a36:	8b 45 08             	mov    0x8(%ebp),%eax
  102a39:	8b 00                	mov    (%eax),%eax
  102a3b:	8d 48 04             	lea    0x4(%eax),%ecx
  102a3e:	8b 55 08             	mov    0x8(%ebp),%edx
  102a41:	89 0a                	mov    %ecx,(%edx)
  102a43:	8b 00                	mov    (%eax),%eax
  102a45:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a4a:	5d                   	pop    %ebp
  102a4b:	c3                   	ret    

00102a4c <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a4c:	55                   	push   %ebp
  102a4d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a4f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a53:	7e 14                	jle    102a69 <getint+0x1d>
        return va_arg(*ap, long long);
  102a55:	8b 45 08             	mov    0x8(%ebp),%eax
  102a58:	8b 00                	mov    (%eax),%eax
  102a5a:	8d 48 08             	lea    0x8(%eax),%ecx
  102a5d:	8b 55 08             	mov    0x8(%ebp),%edx
  102a60:	89 0a                	mov    %ecx,(%edx)
  102a62:	8b 50 04             	mov    0x4(%eax),%edx
  102a65:	8b 00                	mov    (%eax),%eax
  102a67:	eb 28                	jmp    102a91 <getint+0x45>
    }
    else if (lflag) {
  102a69:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a6d:	74 12                	je     102a81 <getint+0x35>
        return va_arg(*ap, long);
  102a6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a72:	8b 00                	mov    (%eax),%eax
  102a74:	8d 48 04             	lea    0x4(%eax),%ecx
  102a77:	8b 55 08             	mov    0x8(%ebp),%edx
  102a7a:	89 0a                	mov    %ecx,(%edx)
  102a7c:	8b 00                	mov    (%eax),%eax
  102a7e:	99                   	cltd   
  102a7f:	eb 10                	jmp    102a91 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102a81:	8b 45 08             	mov    0x8(%ebp),%eax
  102a84:	8b 00                	mov    (%eax),%eax
  102a86:	8d 48 04             	lea    0x4(%eax),%ecx
  102a89:	8b 55 08             	mov    0x8(%ebp),%edx
  102a8c:	89 0a                	mov    %ecx,(%edx)
  102a8e:	8b 00                	mov    (%eax),%eax
  102a90:	99                   	cltd   
    }
}
  102a91:	5d                   	pop    %ebp
  102a92:	c3                   	ret    

00102a93 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102a93:	55                   	push   %ebp
  102a94:	89 e5                	mov    %esp,%ebp
  102a96:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102a99:	8d 45 14             	lea    0x14(%ebp),%eax
  102a9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102a9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aa2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102aa6:	8b 45 10             	mov    0x10(%ebp),%eax
  102aa9:	89 44 24 08          	mov    %eax,0x8(%esp)
  102aad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ab0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ab4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab7:	89 04 24             	mov    %eax,(%esp)
  102aba:	e8 02 00 00 00       	call   102ac1 <vprintfmt>
    va_end(ap);
}
  102abf:	c9                   	leave  
  102ac0:	c3                   	ret    

00102ac1 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102ac1:	55                   	push   %ebp
  102ac2:	89 e5                	mov    %esp,%ebp
  102ac4:	56                   	push   %esi
  102ac5:	53                   	push   %ebx
  102ac6:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ac9:	eb 18                	jmp    102ae3 <vprintfmt+0x22>
            if (ch == '\0') {
  102acb:	85 db                	test   %ebx,%ebx
  102acd:	75 05                	jne    102ad4 <vprintfmt+0x13>
                return;
  102acf:	e9 d1 03 00 00       	jmp    102ea5 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102ad4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102adb:	89 1c 24             	mov    %ebx,(%esp)
  102ade:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae1:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ae3:	8b 45 10             	mov    0x10(%ebp),%eax
  102ae6:	8d 50 01             	lea    0x1(%eax),%edx
  102ae9:	89 55 10             	mov    %edx,0x10(%ebp)
  102aec:	0f b6 00             	movzbl (%eax),%eax
  102aef:	0f b6 d8             	movzbl %al,%ebx
  102af2:	83 fb 25             	cmp    $0x25,%ebx
  102af5:	75 d4                	jne    102acb <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102af7:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102afb:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102b02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b05:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102b08:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102b0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b12:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102b15:	8b 45 10             	mov    0x10(%ebp),%eax
  102b18:	8d 50 01             	lea    0x1(%eax),%edx
  102b1b:	89 55 10             	mov    %edx,0x10(%ebp)
  102b1e:	0f b6 00             	movzbl (%eax),%eax
  102b21:	0f b6 d8             	movzbl %al,%ebx
  102b24:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102b27:	83 f8 55             	cmp    $0x55,%eax
  102b2a:	0f 87 44 03 00 00    	ja     102e74 <vprintfmt+0x3b3>
  102b30:	8b 04 85 14 3c 10 00 	mov    0x103c14(,%eax,4),%eax
  102b37:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102b39:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102b3d:	eb d6                	jmp    102b15 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b3f:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b43:	eb d0                	jmp    102b15 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b45:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b4c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b4f:	89 d0                	mov    %edx,%eax
  102b51:	c1 e0 02             	shl    $0x2,%eax
  102b54:	01 d0                	add    %edx,%eax
  102b56:	01 c0                	add    %eax,%eax
  102b58:	01 d8                	add    %ebx,%eax
  102b5a:	83 e8 30             	sub    $0x30,%eax
  102b5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102b60:	8b 45 10             	mov    0x10(%ebp),%eax
  102b63:	0f b6 00             	movzbl (%eax),%eax
  102b66:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102b69:	83 fb 2f             	cmp    $0x2f,%ebx
  102b6c:	7e 0b                	jle    102b79 <vprintfmt+0xb8>
  102b6e:	83 fb 39             	cmp    $0x39,%ebx
  102b71:	7f 06                	jg     102b79 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b73:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102b77:	eb d3                	jmp    102b4c <vprintfmt+0x8b>
            goto process_precision;
  102b79:	eb 33                	jmp    102bae <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102b7b:	8b 45 14             	mov    0x14(%ebp),%eax
  102b7e:	8d 50 04             	lea    0x4(%eax),%edx
  102b81:	89 55 14             	mov    %edx,0x14(%ebp)
  102b84:	8b 00                	mov    (%eax),%eax
  102b86:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102b89:	eb 23                	jmp    102bae <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102b8b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b8f:	79 0c                	jns    102b9d <vprintfmt+0xdc>
                width = 0;
  102b91:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102b98:	e9 78 ff ff ff       	jmp    102b15 <vprintfmt+0x54>
  102b9d:	e9 73 ff ff ff       	jmp    102b15 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102ba2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102ba9:	e9 67 ff ff ff       	jmp    102b15 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102bae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bb2:	79 12                	jns    102bc6 <vprintfmt+0x105>
                width = precision, precision = -1;
  102bb4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102bb7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102bba:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102bc1:	e9 4f ff ff ff       	jmp    102b15 <vprintfmt+0x54>
  102bc6:	e9 4a ff ff ff       	jmp    102b15 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102bcb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102bcf:	e9 41 ff ff ff       	jmp    102b15 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102bd4:	8b 45 14             	mov    0x14(%ebp),%eax
  102bd7:	8d 50 04             	lea    0x4(%eax),%edx
  102bda:	89 55 14             	mov    %edx,0x14(%ebp)
  102bdd:	8b 00                	mov    (%eax),%eax
  102bdf:	8b 55 0c             	mov    0xc(%ebp),%edx
  102be2:	89 54 24 04          	mov    %edx,0x4(%esp)
  102be6:	89 04 24             	mov    %eax,(%esp)
  102be9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bec:	ff d0                	call   *%eax
            break;
  102bee:	e9 ac 02 00 00       	jmp    102e9f <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102bf3:	8b 45 14             	mov    0x14(%ebp),%eax
  102bf6:	8d 50 04             	lea    0x4(%eax),%edx
  102bf9:	89 55 14             	mov    %edx,0x14(%ebp)
  102bfc:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102bfe:	85 db                	test   %ebx,%ebx
  102c00:	79 02                	jns    102c04 <vprintfmt+0x143>
                err = -err;
  102c02:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102c04:	83 fb 06             	cmp    $0x6,%ebx
  102c07:	7f 0b                	jg     102c14 <vprintfmt+0x153>
  102c09:	8b 34 9d d4 3b 10 00 	mov    0x103bd4(,%ebx,4),%esi
  102c10:	85 f6                	test   %esi,%esi
  102c12:	75 23                	jne    102c37 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102c14:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102c18:	c7 44 24 08 01 3c 10 	movl   $0x103c01,0x8(%esp)
  102c1f:	00 
  102c20:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c23:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c27:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2a:	89 04 24             	mov    %eax,(%esp)
  102c2d:	e8 61 fe ff ff       	call   102a93 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102c32:	e9 68 02 00 00       	jmp    102e9f <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102c37:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102c3b:	c7 44 24 08 0a 3c 10 	movl   $0x103c0a,0x8(%esp)
  102c42:	00 
  102c43:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c46:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4d:	89 04 24             	mov    %eax,(%esp)
  102c50:	e8 3e fe ff ff       	call   102a93 <printfmt>
            }
            break;
  102c55:	e9 45 02 00 00       	jmp    102e9f <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102c5a:	8b 45 14             	mov    0x14(%ebp),%eax
  102c5d:	8d 50 04             	lea    0x4(%eax),%edx
  102c60:	89 55 14             	mov    %edx,0x14(%ebp)
  102c63:	8b 30                	mov    (%eax),%esi
  102c65:	85 f6                	test   %esi,%esi
  102c67:	75 05                	jne    102c6e <vprintfmt+0x1ad>
                p = "(null)";
  102c69:	be 0d 3c 10 00       	mov    $0x103c0d,%esi
            }
            if (width > 0 && padc != '-') {
  102c6e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c72:	7e 3e                	jle    102cb2 <vprintfmt+0x1f1>
  102c74:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102c78:	74 38                	je     102cb2 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c7a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102c7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c80:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c84:	89 34 24             	mov    %esi,(%esp)
  102c87:	e8 15 03 00 00       	call   102fa1 <strnlen>
  102c8c:	29 c3                	sub    %eax,%ebx
  102c8e:	89 d8                	mov    %ebx,%eax
  102c90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c93:	eb 17                	jmp    102cac <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102c95:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102c99:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c9c:	89 54 24 04          	mov    %edx,0x4(%esp)
  102ca0:	89 04 24             	mov    %eax,(%esp)
  102ca3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca6:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102ca8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cb0:	7f e3                	jg     102c95 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102cb2:	eb 38                	jmp    102cec <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102cb4:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102cb8:	74 1f                	je     102cd9 <vprintfmt+0x218>
  102cba:	83 fb 1f             	cmp    $0x1f,%ebx
  102cbd:	7e 05                	jle    102cc4 <vprintfmt+0x203>
  102cbf:	83 fb 7e             	cmp    $0x7e,%ebx
  102cc2:	7e 15                	jle    102cd9 <vprintfmt+0x218>
                    putch('?', putdat);
  102cc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ccb:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102cd2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd5:	ff d0                	call   *%eax
  102cd7:	eb 0f                	jmp    102ce8 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102cd9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cdc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ce0:	89 1c 24             	mov    %ebx,(%esp)
  102ce3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce6:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ce8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cec:	89 f0                	mov    %esi,%eax
  102cee:	8d 70 01             	lea    0x1(%eax),%esi
  102cf1:	0f b6 00             	movzbl (%eax),%eax
  102cf4:	0f be d8             	movsbl %al,%ebx
  102cf7:	85 db                	test   %ebx,%ebx
  102cf9:	74 10                	je     102d0b <vprintfmt+0x24a>
  102cfb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102cff:	78 b3                	js     102cb4 <vprintfmt+0x1f3>
  102d01:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102d05:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d09:	79 a9                	jns    102cb4 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d0b:	eb 17                	jmp    102d24 <vprintfmt+0x263>
                putch(' ', putdat);
  102d0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d10:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d14:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1e:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d20:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d24:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d28:	7f e3                	jg     102d0d <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102d2a:	e9 70 01 00 00       	jmp    102e9f <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102d2f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d32:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d36:	8d 45 14             	lea    0x14(%ebp),%eax
  102d39:	89 04 24             	mov    %eax,(%esp)
  102d3c:	e8 0b fd ff ff       	call   102a4c <getint>
  102d41:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d44:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d4d:	85 d2                	test   %edx,%edx
  102d4f:	79 26                	jns    102d77 <vprintfmt+0x2b6>
                putch('-', putdat);
  102d51:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d54:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d58:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102d5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d62:	ff d0                	call   *%eax
                num = -(long long)num;
  102d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d67:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d6a:	f7 d8                	neg    %eax
  102d6c:	83 d2 00             	adc    $0x0,%edx
  102d6f:	f7 da                	neg    %edx
  102d71:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d74:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102d77:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d7e:	e9 a8 00 00 00       	jmp    102e2b <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102d83:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d86:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d8a:	8d 45 14             	lea    0x14(%ebp),%eax
  102d8d:	89 04 24             	mov    %eax,(%esp)
  102d90:	e8 68 fc ff ff       	call   1029fd <getuint>
  102d95:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d98:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102d9b:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102da2:	e9 84 00 00 00       	jmp    102e2b <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102da7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102daa:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dae:	8d 45 14             	lea    0x14(%ebp),%eax
  102db1:	89 04 24             	mov    %eax,(%esp)
  102db4:	e8 44 fc ff ff       	call   1029fd <getuint>
  102db9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dbc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102dbf:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102dc6:	eb 63                	jmp    102e2b <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102dc8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dcb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dcf:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102dd6:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd9:	ff d0                	call   *%eax
            putch('x', putdat);
  102ddb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dde:	89 44 24 04          	mov    %eax,0x4(%esp)
  102de2:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102de9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dec:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102dee:	8b 45 14             	mov    0x14(%ebp),%eax
  102df1:	8d 50 04             	lea    0x4(%eax),%edx
  102df4:	89 55 14             	mov    %edx,0x14(%ebp)
  102df7:	8b 00                	mov    (%eax),%eax
  102df9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dfc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102e03:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102e0a:	eb 1f                	jmp    102e2b <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102e0c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e0f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e13:	8d 45 14             	lea    0x14(%ebp),%eax
  102e16:	89 04 24             	mov    %eax,(%esp)
  102e19:	e8 df fb ff ff       	call   1029fd <getuint>
  102e1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e21:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102e24:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102e2b:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102e2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e32:	89 54 24 18          	mov    %edx,0x18(%esp)
  102e36:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102e39:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e3d:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e47:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e4b:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e52:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e56:	8b 45 08             	mov    0x8(%ebp),%eax
  102e59:	89 04 24             	mov    %eax,(%esp)
  102e5c:	e8 97 fa ff ff       	call   1028f8 <printnum>
            break;
  102e61:	eb 3c                	jmp    102e9f <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102e63:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e66:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e6a:	89 1c 24             	mov    %ebx,(%esp)
  102e6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e70:	ff d0                	call   *%eax
            break;
  102e72:	eb 2b                	jmp    102e9f <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102e74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e7b:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102e82:	8b 45 08             	mov    0x8(%ebp),%eax
  102e85:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102e87:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e8b:	eb 04                	jmp    102e91 <vprintfmt+0x3d0>
  102e8d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e91:	8b 45 10             	mov    0x10(%ebp),%eax
  102e94:	83 e8 01             	sub    $0x1,%eax
  102e97:	0f b6 00             	movzbl (%eax),%eax
  102e9a:	3c 25                	cmp    $0x25,%al
  102e9c:	75 ef                	jne    102e8d <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102e9e:	90                   	nop
        }
    }
  102e9f:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ea0:	e9 3e fc ff ff       	jmp    102ae3 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102ea5:	83 c4 40             	add    $0x40,%esp
  102ea8:	5b                   	pop    %ebx
  102ea9:	5e                   	pop    %esi
  102eaa:	5d                   	pop    %ebp
  102eab:	c3                   	ret    

00102eac <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102eac:	55                   	push   %ebp
  102ead:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102eaf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb2:	8b 40 08             	mov    0x8(%eax),%eax
  102eb5:	8d 50 01             	lea    0x1(%eax),%edx
  102eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebb:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102ebe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec1:	8b 10                	mov    (%eax),%edx
  102ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec6:	8b 40 04             	mov    0x4(%eax),%eax
  102ec9:	39 c2                	cmp    %eax,%edx
  102ecb:	73 12                	jae    102edf <sprintputch+0x33>
        *b->buf ++ = ch;
  102ecd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed0:	8b 00                	mov    (%eax),%eax
  102ed2:	8d 48 01             	lea    0x1(%eax),%ecx
  102ed5:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ed8:	89 0a                	mov    %ecx,(%edx)
  102eda:	8b 55 08             	mov    0x8(%ebp),%edx
  102edd:	88 10                	mov    %dl,(%eax)
    }
}
  102edf:	5d                   	pop    %ebp
  102ee0:	c3                   	ret    

00102ee1 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102ee1:	55                   	push   %ebp
  102ee2:	89 e5                	mov    %esp,%ebp
  102ee4:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102ee7:	8d 45 14             	lea    0x14(%ebp),%eax
  102eea:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102eed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ef0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102ef4:	8b 45 10             	mov    0x10(%ebp),%eax
  102ef7:	89 44 24 08          	mov    %eax,0x8(%esp)
  102efb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102efe:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f02:	8b 45 08             	mov    0x8(%ebp),%eax
  102f05:	89 04 24             	mov    %eax,(%esp)
  102f08:	e8 08 00 00 00       	call   102f15 <vsnprintf>
  102f0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102f10:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f13:	c9                   	leave  
  102f14:	c3                   	ret    

00102f15 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102f15:	55                   	push   %ebp
  102f16:	89 e5                	mov    %esp,%ebp
  102f18:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102f1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f24:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f27:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2a:	01 d0                	add    %edx,%eax
  102f2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f2f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102f36:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f3a:	74 0a                	je     102f46 <vsnprintf+0x31>
  102f3c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f42:	39 c2                	cmp    %eax,%edx
  102f44:	76 07                	jbe    102f4d <vsnprintf+0x38>
        return -E_INVAL;
  102f46:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f4b:	eb 2a                	jmp    102f77 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f4d:	8b 45 14             	mov    0x14(%ebp),%eax
  102f50:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f54:	8b 45 10             	mov    0x10(%ebp),%eax
  102f57:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f5b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102f5e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f62:	c7 04 24 ac 2e 10 00 	movl   $0x102eac,(%esp)
  102f69:	e8 53 fb ff ff       	call   102ac1 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102f6e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f71:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102f74:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f77:	c9                   	leave  
  102f78:	c3                   	ret    

00102f79 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102f79:	55                   	push   %ebp
  102f7a:	89 e5                	mov    %esp,%ebp
  102f7c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f7f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102f86:	eb 04                	jmp    102f8c <strlen+0x13>
        cnt ++;
  102f88:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102f8c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8f:	8d 50 01             	lea    0x1(%eax),%edx
  102f92:	89 55 08             	mov    %edx,0x8(%ebp)
  102f95:	0f b6 00             	movzbl (%eax),%eax
  102f98:	84 c0                	test   %al,%al
  102f9a:	75 ec                	jne    102f88 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102f9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f9f:	c9                   	leave  
  102fa0:	c3                   	ret    

00102fa1 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102fa1:	55                   	push   %ebp
  102fa2:	89 e5                	mov    %esp,%ebp
  102fa4:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102fa7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102fae:	eb 04                	jmp    102fb4 <strnlen+0x13>
        cnt ++;
  102fb0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102fb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fb7:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102fba:	73 10                	jae    102fcc <strnlen+0x2b>
  102fbc:	8b 45 08             	mov    0x8(%ebp),%eax
  102fbf:	8d 50 01             	lea    0x1(%eax),%edx
  102fc2:	89 55 08             	mov    %edx,0x8(%ebp)
  102fc5:	0f b6 00             	movzbl (%eax),%eax
  102fc8:	84 c0                	test   %al,%al
  102fca:	75 e4                	jne    102fb0 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102fcc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102fcf:	c9                   	leave  
  102fd0:	c3                   	ret    

00102fd1 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102fd1:	55                   	push   %ebp
  102fd2:	89 e5                	mov    %esp,%ebp
  102fd4:	57                   	push   %edi
  102fd5:	56                   	push   %esi
  102fd6:	83 ec 20             	sub    $0x20,%esp
  102fd9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fdf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fe2:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102fe5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fe8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102feb:	89 d1                	mov    %edx,%ecx
  102fed:	89 c2                	mov    %eax,%edx
  102fef:	89 ce                	mov    %ecx,%esi
  102ff1:	89 d7                	mov    %edx,%edi
  102ff3:	ac                   	lods   %ds:(%esi),%al
  102ff4:	aa                   	stos   %al,%es:(%edi)
  102ff5:	84 c0                	test   %al,%al
  102ff7:	75 fa                	jne    102ff3 <strcpy+0x22>
  102ff9:	89 fa                	mov    %edi,%edx
  102ffb:	89 f1                	mov    %esi,%ecx
  102ffd:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103000:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103003:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  103006:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  103009:	83 c4 20             	add    $0x20,%esp
  10300c:	5e                   	pop    %esi
  10300d:	5f                   	pop    %edi
  10300e:	5d                   	pop    %ebp
  10300f:	c3                   	ret    

00103010 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103010:	55                   	push   %ebp
  103011:	89 e5                	mov    %esp,%ebp
  103013:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  103016:	8b 45 08             	mov    0x8(%ebp),%eax
  103019:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  10301c:	eb 21                	jmp    10303f <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  10301e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103021:	0f b6 10             	movzbl (%eax),%edx
  103024:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103027:	88 10                	mov    %dl,(%eax)
  103029:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10302c:	0f b6 00             	movzbl (%eax),%eax
  10302f:	84 c0                	test   %al,%al
  103031:	74 04                	je     103037 <strncpy+0x27>
            src ++;
  103033:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  103037:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10303b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  10303f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103043:	75 d9                	jne    10301e <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  103045:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103048:	c9                   	leave  
  103049:	c3                   	ret    

0010304a <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10304a:	55                   	push   %ebp
  10304b:	89 e5                	mov    %esp,%ebp
  10304d:	57                   	push   %edi
  10304e:	56                   	push   %esi
  10304f:	83 ec 20             	sub    $0x20,%esp
  103052:	8b 45 08             	mov    0x8(%ebp),%eax
  103055:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103058:	8b 45 0c             	mov    0xc(%ebp),%eax
  10305b:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  10305e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103061:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103064:	89 d1                	mov    %edx,%ecx
  103066:	89 c2                	mov    %eax,%edx
  103068:	89 ce                	mov    %ecx,%esi
  10306a:	89 d7                	mov    %edx,%edi
  10306c:	ac                   	lods   %ds:(%esi),%al
  10306d:	ae                   	scas   %es:(%edi),%al
  10306e:	75 08                	jne    103078 <strcmp+0x2e>
  103070:	84 c0                	test   %al,%al
  103072:	75 f8                	jne    10306c <strcmp+0x22>
  103074:	31 c0                	xor    %eax,%eax
  103076:	eb 04                	jmp    10307c <strcmp+0x32>
  103078:	19 c0                	sbb    %eax,%eax
  10307a:	0c 01                	or     $0x1,%al
  10307c:	89 fa                	mov    %edi,%edx
  10307e:	89 f1                	mov    %esi,%ecx
  103080:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103083:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103086:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103089:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10308c:	83 c4 20             	add    $0x20,%esp
  10308f:	5e                   	pop    %esi
  103090:	5f                   	pop    %edi
  103091:	5d                   	pop    %ebp
  103092:	c3                   	ret    

00103093 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103093:	55                   	push   %ebp
  103094:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103096:	eb 0c                	jmp    1030a4 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103098:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10309c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1030a0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1030a4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030a8:	74 1a                	je     1030c4 <strncmp+0x31>
  1030aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ad:	0f b6 00             	movzbl (%eax),%eax
  1030b0:	84 c0                	test   %al,%al
  1030b2:	74 10                	je     1030c4 <strncmp+0x31>
  1030b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b7:	0f b6 10             	movzbl (%eax),%edx
  1030ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030bd:	0f b6 00             	movzbl (%eax),%eax
  1030c0:	38 c2                	cmp    %al,%dl
  1030c2:	74 d4                	je     103098 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1030c4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030c8:	74 18                	je     1030e2 <strncmp+0x4f>
  1030ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cd:	0f b6 00             	movzbl (%eax),%eax
  1030d0:	0f b6 d0             	movzbl %al,%edx
  1030d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d6:	0f b6 00             	movzbl (%eax),%eax
  1030d9:	0f b6 c0             	movzbl %al,%eax
  1030dc:	29 c2                	sub    %eax,%edx
  1030de:	89 d0                	mov    %edx,%eax
  1030e0:	eb 05                	jmp    1030e7 <strncmp+0x54>
  1030e2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030e7:	5d                   	pop    %ebp
  1030e8:	c3                   	ret    

001030e9 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1030e9:	55                   	push   %ebp
  1030ea:	89 e5                	mov    %esp,%ebp
  1030ec:	83 ec 04             	sub    $0x4,%esp
  1030ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f2:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030f5:	eb 14                	jmp    10310b <strchr+0x22>
        if (*s == c) {
  1030f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fa:	0f b6 00             	movzbl (%eax),%eax
  1030fd:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103100:	75 05                	jne    103107 <strchr+0x1e>
            return (char *)s;
  103102:	8b 45 08             	mov    0x8(%ebp),%eax
  103105:	eb 13                	jmp    10311a <strchr+0x31>
        }
        s ++;
  103107:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  10310b:	8b 45 08             	mov    0x8(%ebp),%eax
  10310e:	0f b6 00             	movzbl (%eax),%eax
  103111:	84 c0                	test   %al,%al
  103113:	75 e2                	jne    1030f7 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  103115:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10311a:	c9                   	leave  
  10311b:	c3                   	ret    

0010311c <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  10311c:	55                   	push   %ebp
  10311d:	89 e5                	mov    %esp,%ebp
  10311f:	83 ec 04             	sub    $0x4,%esp
  103122:	8b 45 0c             	mov    0xc(%ebp),%eax
  103125:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103128:	eb 11                	jmp    10313b <strfind+0x1f>
        if (*s == c) {
  10312a:	8b 45 08             	mov    0x8(%ebp),%eax
  10312d:	0f b6 00             	movzbl (%eax),%eax
  103130:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103133:	75 02                	jne    103137 <strfind+0x1b>
            break;
  103135:	eb 0e                	jmp    103145 <strfind+0x29>
        }
        s ++;
  103137:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  10313b:	8b 45 08             	mov    0x8(%ebp),%eax
  10313e:	0f b6 00             	movzbl (%eax),%eax
  103141:	84 c0                	test   %al,%al
  103143:	75 e5                	jne    10312a <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  103145:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103148:	c9                   	leave  
  103149:	c3                   	ret    

0010314a <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  10314a:	55                   	push   %ebp
  10314b:	89 e5                	mov    %esp,%ebp
  10314d:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103150:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103157:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10315e:	eb 04                	jmp    103164 <strtol+0x1a>
        s ++;
  103160:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103164:	8b 45 08             	mov    0x8(%ebp),%eax
  103167:	0f b6 00             	movzbl (%eax),%eax
  10316a:	3c 20                	cmp    $0x20,%al
  10316c:	74 f2                	je     103160 <strtol+0x16>
  10316e:	8b 45 08             	mov    0x8(%ebp),%eax
  103171:	0f b6 00             	movzbl (%eax),%eax
  103174:	3c 09                	cmp    $0x9,%al
  103176:	74 e8                	je     103160 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103178:	8b 45 08             	mov    0x8(%ebp),%eax
  10317b:	0f b6 00             	movzbl (%eax),%eax
  10317e:	3c 2b                	cmp    $0x2b,%al
  103180:	75 06                	jne    103188 <strtol+0x3e>
        s ++;
  103182:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103186:	eb 15                	jmp    10319d <strtol+0x53>
    }
    else if (*s == '-') {
  103188:	8b 45 08             	mov    0x8(%ebp),%eax
  10318b:	0f b6 00             	movzbl (%eax),%eax
  10318e:	3c 2d                	cmp    $0x2d,%al
  103190:	75 0b                	jne    10319d <strtol+0x53>
        s ++, neg = 1;
  103192:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103196:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10319d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031a1:	74 06                	je     1031a9 <strtol+0x5f>
  1031a3:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1031a7:	75 24                	jne    1031cd <strtol+0x83>
  1031a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ac:	0f b6 00             	movzbl (%eax),%eax
  1031af:	3c 30                	cmp    $0x30,%al
  1031b1:	75 1a                	jne    1031cd <strtol+0x83>
  1031b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b6:	83 c0 01             	add    $0x1,%eax
  1031b9:	0f b6 00             	movzbl (%eax),%eax
  1031bc:	3c 78                	cmp    $0x78,%al
  1031be:	75 0d                	jne    1031cd <strtol+0x83>
        s += 2, base = 16;
  1031c0:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1031c4:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1031cb:	eb 2a                	jmp    1031f7 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  1031cd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031d1:	75 17                	jne    1031ea <strtol+0xa0>
  1031d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d6:	0f b6 00             	movzbl (%eax),%eax
  1031d9:	3c 30                	cmp    $0x30,%al
  1031db:	75 0d                	jne    1031ea <strtol+0xa0>
        s ++, base = 8;
  1031dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031e1:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1031e8:	eb 0d                	jmp    1031f7 <strtol+0xad>
    }
    else if (base == 0) {
  1031ea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031ee:	75 07                	jne    1031f7 <strtol+0xad>
        base = 10;
  1031f0:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1031f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031fa:	0f b6 00             	movzbl (%eax),%eax
  1031fd:	3c 2f                	cmp    $0x2f,%al
  1031ff:	7e 1b                	jle    10321c <strtol+0xd2>
  103201:	8b 45 08             	mov    0x8(%ebp),%eax
  103204:	0f b6 00             	movzbl (%eax),%eax
  103207:	3c 39                	cmp    $0x39,%al
  103209:	7f 11                	jg     10321c <strtol+0xd2>
            dig = *s - '0';
  10320b:	8b 45 08             	mov    0x8(%ebp),%eax
  10320e:	0f b6 00             	movzbl (%eax),%eax
  103211:	0f be c0             	movsbl %al,%eax
  103214:	83 e8 30             	sub    $0x30,%eax
  103217:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10321a:	eb 48                	jmp    103264 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  10321c:	8b 45 08             	mov    0x8(%ebp),%eax
  10321f:	0f b6 00             	movzbl (%eax),%eax
  103222:	3c 60                	cmp    $0x60,%al
  103224:	7e 1b                	jle    103241 <strtol+0xf7>
  103226:	8b 45 08             	mov    0x8(%ebp),%eax
  103229:	0f b6 00             	movzbl (%eax),%eax
  10322c:	3c 7a                	cmp    $0x7a,%al
  10322e:	7f 11                	jg     103241 <strtol+0xf7>
            dig = *s - 'a' + 10;
  103230:	8b 45 08             	mov    0x8(%ebp),%eax
  103233:	0f b6 00             	movzbl (%eax),%eax
  103236:	0f be c0             	movsbl %al,%eax
  103239:	83 e8 57             	sub    $0x57,%eax
  10323c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10323f:	eb 23                	jmp    103264 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103241:	8b 45 08             	mov    0x8(%ebp),%eax
  103244:	0f b6 00             	movzbl (%eax),%eax
  103247:	3c 40                	cmp    $0x40,%al
  103249:	7e 3d                	jle    103288 <strtol+0x13e>
  10324b:	8b 45 08             	mov    0x8(%ebp),%eax
  10324e:	0f b6 00             	movzbl (%eax),%eax
  103251:	3c 5a                	cmp    $0x5a,%al
  103253:	7f 33                	jg     103288 <strtol+0x13e>
            dig = *s - 'A' + 10;
  103255:	8b 45 08             	mov    0x8(%ebp),%eax
  103258:	0f b6 00             	movzbl (%eax),%eax
  10325b:	0f be c0             	movsbl %al,%eax
  10325e:	83 e8 37             	sub    $0x37,%eax
  103261:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103264:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103267:	3b 45 10             	cmp    0x10(%ebp),%eax
  10326a:	7c 02                	jl     10326e <strtol+0x124>
            break;
  10326c:	eb 1a                	jmp    103288 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  10326e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103272:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103275:	0f af 45 10          	imul   0x10(%ebp),%eax
  103279:	89 c2                	mov    %eax,%edx
  10327b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10327e:	01 d0                	add    %edx,%eax
  103280:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103283:	e9 6f ff ff ff       	jmp    1031f7 <strtol+0xad>

    if (endptr) {
  103288:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10328c:	74 08                	je     103296 <strtol+0x14c>
        *endptr = (char *) s;
  10328e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103291:	8b 55 08             	mov    0x8(%ebp),%edx
  103294:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103296:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10329a:	74 07                	je     1032a3 <strtol+0x159>
  10329c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10329f:	f7 d8                	neg    %eax
  1032a1:	eb 03                	jmp    1032a6 <strtol+0x15c>
  1032a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1032a6:	c9                   	leave  
  1032a7:	c3                   	ret    

001032a8 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1032a8:	55                   	push   %ebp
  1032a9:	89 e5                	mov    %esp,%ebp
  1032ab:	57                   	push   %edi
  1032ac:	83 ec 24             	sub    $0x24,%esp
  1032af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b2:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1032b5:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  1032b9:	8b 55 08             	mov    0x8(%ebp),%edx
  1032bc:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1032bf:	88 45 f7             	mov    %al,-0x9(%ebp)
  1032c2:	8b 45 10             	mov    0x10(%ebp),%eax
  1032c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1032c8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1032cb:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1032cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1032d2:	89 d7                	mov    %edx,%edi
  1032d4:	f3 aa                	rep stos %al,%es:(%edi)
  1032d6:	89 fa                	mov    %edi,%edx
  1032d8:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1032db:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1032de:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1032e1:	83 c4 24             	add    $0x24,%esp
  1032e4:	5f                   	pop    %edi
  1032e5:	5d                   	pop    %ebp
  1032e6:	c3                   	ret    

001032e7 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1032e7:	55                   	push   %ebp
  1032e8:	89 e5                	mov    %esp,%ebp
  1032ea:	57                   	push   %edi
  1032eb:	56                   	push   %esi
  1032ec:	53                   	push   %ebx
  1032ed:	83 ec 30             	sub    $0x30,%esp
  1032f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1032fc:	8b 45 10             	mov    0x10(%ebp),%eax
  1032ff:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103302:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103305:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103308:	73 42                	jae    10334c <memmove+0x65>
  10330a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10330d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103310:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103313:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103316:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103319:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10331c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10331f:	c1 e8 02             	shr    $0x2,%eax
  103322:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103324:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103327:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10332a:	89 d7                	mov    %edx,%edi
  10332c:	89 c6                	mov    %eax,%esi
  10332e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103330:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103333:	83 e1 03             	and    $0x3,%ecx
  103336:	74 02                	je     10333a <memmove+0x53>
  103338:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10333a:	89 f0                	mov    %esi,%eax
  10333c:	89 fa                	mov    %edi,%edx
  10333e:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103341:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103344:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103347:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10334a:	eb 36                	jmp    103382 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10334c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10334f:	8d 50 ff             	lea    -0x1(%eax),%edx
  103352:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103355:	01 c2                	add    %eax,%edx
  103357:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10335a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10335d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103360:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103363:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103366:	89 c1                	mov    %eax,%ecx
  103368:	89 d8                	mov    %ebx,%eax
  10336a:	89 d6                	mov    %edx,%esi
  10336c:	89 c7                	mov    %eax,%edi
  10336e:	fd                   	std    
  10336f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103371:	fc                   	cld    
  103372:	89 f8                	mov    %edi,%eax
  103374:	89 f2                	mov    %esi,%edx
  103376:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103379:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10337c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10337f:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103382:	83 c4 30             	add    $0x30,%esp
  103385:	5b                   	pop    %ebx
  103386:	5e                   	pop    %esi
  103387:	5f                   	pop    %edi
  103388:	5d                   	pop    %ebp
  103389:	c3                   	ret    

0010338a <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10338a:	55                   	push   %ebp
  10338b:	89 e5                	mov    %esp,%ebp
  10338d:	57                   	push   %edi
  10338e:	56                   	push   %esi
  10338f:	83 ec 20             	sub    $0x20,%esp
  103392:	8b 45 08             	mov    0x8(%ebp),%eax
  103395:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103398:	8b 45 0c             	mov    0xc(%ebp),%eax
  10339b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10339e:	8b 45 10             	mov    0x10(%ebp),%eax
  1033a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1033a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033a7:	c1 e8 02             	shr    $0x2,%eax
  1033aa:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1033ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033af:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033b2:	89 d7                	mov    %edx,%edi
  1033b4:	89 c6                	mov    %eax,%esi
  1033b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1033b8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1033bb:	83 e1 03             	and    $0x3,%ecx
  1033be:	74 02                	je     1033c2 <memcpy+0x38>
  1033c0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033c2:	89 f0                	mov    %esi,%eax
  1033c4:	89 fa                	mov    %edi,%edx
  1033c6:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1033c9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1033cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1033cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1033d2:	83 c4 20             	add    $0x20,%esp
  1033d5:	5e                   	pop    %esi
  1033d6:	5f                   	pop    %edi
  1033d7:	5d                   	pop    %ebp
  1033d8:	c3                   	ret    

001033d9 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1033d9:	55                   	push   %ebp
  1033da:	89 e5                	mov    %esp,%ebp
  1033dc:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1033df:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1033e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033e8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1033eb:	eb 30                	jmp    10341d <memcmp+0x44>
        if (*s1 != *s2) {
  1033ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033f0:	0f b6 10             	movzbl (%eax),%edx
  1033f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033f6:	0f b6 00             	movzbl (%eax),%eax
  1033f9:	38 c2                	cmp    %al,%dl
  1033fb:	74 18                	je     103415 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1033fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103400:	0f b6 00             	movzbl (%eax),%eax
  103403:	0f b6 d0             	movzbl %al,%edx
  103406:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103409:	0f b6 00             	movzbl (%eax),%eax
  10340c:	0f b6 c0             	movzbl %al,%eax
  10340f:	29 c2                	sub    %eax,%edx
  103411:	89 d0                	mov    %edx,%eax
  103413:	eb 1a                	jmp    10342f <memcmp+0x56>
        }
        s1 ++, s2 ++;
  103415:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103419:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  10341d:	8b 45 10             	mov    0x10(%ebp),%eax
  103420:	8d 50 ff             	lea    -0x1(%eax),%edx
  103423:	89 55 10             	mov    %edx,0x10(%ebp)
  103426:	85 c0                	test   %eax,%eax
  103428:	75 c3                	jne    1033ed <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  10342a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10342f:	c9                   	leave  
  103430:	c3                   	ret    
