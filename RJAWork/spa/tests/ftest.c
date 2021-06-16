/*
 * Tests in the criterion framework
 */

#include <criterion/criterion.h>
#include <stdio.h>
#include "../assoc.h"
#include "../cap.h"
#include "../spa.h"

/* Make sure good line for ipv4 tcp works */
Test(utests, parsegoodip4tcp) {
	char lineip4tcp[LINE_BUF_SIZE] = "17,0x00000800,192.168.1.10,192.168.1.3,6,,,,22,,12345,";
	frame *fip4tcp = parse_line(lineip4tcp);
	cr_expect_str_eq(fip4tcp->framenum,"17","The frame number is not correct");
	cr_expect_eq(fip4tcp->ethtype,0x0800,"The ethtype is not correct");
	cr_expect_str_eq(fip4tcp->srcip,"192.168.1.10","The src ip is not correct");
	cr_expect_str_eq(fip4tcp->destip,"192.168.1.3","The dest ip is not correct");
	cr_expect_str_empty(fip4tcp->srcip6,"The srcip6 str is not empty");
	cr_expect_str_empty(fip4tcp->destip6,"The destip6 str is not empty");
	cr_expect_eq(fip4tcp->ipproto,6,"The ip proto is not correct");
	cr_expect_str_eq(fip4tcp->srcport_tcp,"22","The srcport_tcp is not correct");
	cr_expect_str_empty(fip4tcp->srcport_udp,"The srcport_udp is not empty");
	cr_expect_str_eq(fip4tcp->destport_tcp,"12345","The destport_tcp is not correct");
	cr_expect_str_empty(fip4tcp->destport_udp,"The destport_udp is not empty");
}

/* Make sure good line for ipv6 tcp works */
Test(utests, parsegoodip6tcp) {
	char line[LINE_BUF_SIZE] = "17,0x000086DD,,,,fe80::1,ff02::1,6,22,,12345,";
	frame *f = parse_line(line);
	cr_expect_str_eq(f->framenum,"17","The frame number is not correct");
	cr_expect_eq(f->ethtype,0x86DD,"The ethtype is not correct");
	cr_expect_str_empty(f->srcip,"192.168.1.10","The src ip is not correct");
	cr_expect_str_empty(f->destip,"192.168.1.3","The dest ip is not correct");
	cr_expect_str_eq(f->srcip6,"fe80::1","The srcip6 str is not empty");
	cr_expect_str_eq(f->destip6,"ff02::1","The destip6 str is not empty");
	cr_expect_eq(f->ipproto,6,"The ip proto is not correct");
	cr_expect_str_eq(f->srcport_tcp,"22","The srcport_tcp is not correct");
	cr_expect_str_empty(f->srcport_udp,"The srcport_udp is not empty");
	cr_expect_str_eq(f->destport_tcp,"12345","The destport_tcp is not correct");
	cr_expect_str_empty(f->destport_udp,"The destport_udp is not empty");
}

/* Make sure good line for ipv4 udp works */
Test(utests, parsegoodip4udp) {
	char line[LINE_BUF_SIZE] = "17,0x00000800,192.168.1.10,192.168.1.3,6,,,,,47,,25";
	frame *f = parse_line(line);
	cr_expect_str_eq(f->framenum,"17","The frame number is not correct");
	cr_expect_eq(f->ethtype,0x0800,"The ethtype is not correct");
	cr_expect_str_eq(f->srcip,"192.168.1.10","The src ip is not correct");
	cr_expect_str_eq(f->destip,"192.168.1.3","The dest ip is not correct");
	cr_expect_str_empty(f->srcip6,"The srcip6 str is not empty");
	cr_expect_str_empty(f->destip6,"The destip6 str is not empty");
	cr_expect_eq(f->ipproto,6,"The ip proto is not correct");
	cr_expect_str_empty(f->srcport_tcp,"The srcport_tcp is not empty");
	cr_expect_str_eq(f->srcport_udp,"47","The srcport_udp is not correct");
	cr_expect_str_empty(f->destport_tcp,"The destport_tcp is not empty");
	cr_expect_str_eq(f->destport_udp,"25","The destport_udp is not correct");
}

/* Make sure good line for ipv6 udp works */
Test(utests, parsegoodip6udp) {
	char line[LINE_BUF_SIZE] = "17,0x000086DD,,,,fe80::1,ff02::1,6,,45,,25565";
	frame *f = parse_line(line);
	cr_expect_str_eq(f->framenum,"17","The frame number is not correct");
	cr_expect_eq(f->ethtype,0x86DD,"The ethtype is not correct");
	cr_expect_str_empty(f->srcip,"192.168.1.10","The src ip is not correct");
	cr_expect_str_empty(f->destip,"192.168.1.3","The dest ip is not correct");
	cr_expect_str_eq(f->srcip6,"fe80::1","The srcip6 str is not empty");
	cr_expect_str_eq(f->destip6,"ff02::1","The destip6 str is not empty");
	cr_expect_eq(f->ipproto,6,"The ip proto is not correct");
	cr_expect_str_empty(f->srcport_tcp,"The srcport_tcp is not empty");
	cr_expect_str_eq(f->srcport_udp,"45","The srcport_udp is not correct");
	cr_expect_str_empty(f->destport_tcp,"12345","The destport_tcp is not empty");
	cr_expect_str_eq(f->destport_udp,"25565","The destport_udp is not correct");
}

int compare_files(FILE *f1, FILE *f2)
{
	char c1 = getc(f1);
	char c2 = getc(f2);
	
	while (c1 != EOF && c2 != EOF)
	{
		if(c1 != c2)
			return 1;
		c1 = getc(f1);
		c2 = getc(f2);
	}
	return 0;
}

/*
 * WARNING: This test requires pcapng files that are not distributed with the
 * source as they contained private ip address information. Feel free to create
 * example files that can be distributed and update the test accordingly.
 */
Test(utests, filewritegood) {
	char line[LINE_BUF_SIZE] = {0};
	frame *f = NULL;
	frame *prev = NULL;
	for (int i=1;i<=52;i++)
	{
		sprintf(line, "%d,0x00000800,192.168.1.10,192.168.1.3,6,,,,22,,12345,", i);
		frame *t = parse_line(line);
		sprintf(t->procinfo, "spaprocnames=(dummy) spapids=(%d)", i);
		if (f == NULL)
		{
			f = t;
			prev = f;
		}
		else 
		{
			prev->next = t;
			prev = prev->next;
		}
	}
	cr_expect_eq(write_info_to_file("tests/example.pcapng", "testout.pcapng", &f, 52),0,"Error in file write");
	FILE *exfile, *chkfile;
	cr_assert_not_null(exfile = fopen("testout.pcapng","r"), "Issue opening test file");
	cr_assert_not_null(chkfile = fopen("tests/excheck.pcapng","r"), "Issue opening check file");
	cr_expect_eq(compare_files(exfile, chkfile),0,"The files do not match");
	fclose(exfile);
	fclose(chkfile);
}
