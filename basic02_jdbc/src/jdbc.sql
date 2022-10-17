--sungjuk 테이블 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)

--오라클 콘솔창 예쁘게 출력
set linesize 1000;
col uname for a10; --col 칼럼명 for 20자
col addr for a10; --col 칼럼명 for 20자


1)주소가 서울인 행 조회하기
select addr, uname, kor, eng, mat
from sungjuk
where addr='Seoul';