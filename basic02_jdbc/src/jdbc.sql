--sungjuk ���̺� ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '�����', 99, 98, 97, 'Seoul', sysdate)

--����Ŭ �ܼ�â ���ڰ� ���
set linesize 1000;
col uname for a10; --col Į���� for 20��
col addr for a10; --col Į���� for 20��


1)�ּҰ� ������ �� ��ȸ�ϱ�
select addr, uname, kor, eng, mat
from sungjuk
where addr='Seoul';