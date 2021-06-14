/*
 * Tests in the criterion framework
 */

#include <criterion/criterion.h>
#include "../assoc.h"
#include "../cap.h"
#include "../spa.h"

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