--bbs.sql
--답변 및 댓글형 게시판

--테이블 삭제
drop table tb_bbs;

--테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate   -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null  -- 사용자 요청 PC의 IP
 ,primary key(bbsno)                 --bbsno 기본키(PK) 
);

--시퀀스 생성
create sequence bbs_seq;

--시퀀스 삭제
drop sequence bbs_seq;

--명령어 완료
commit;

/////////////////////////////////////////////////////////////

--새글쓰기
bbsno                           : 시퀀스를 이용해서 일련번호
wname, subject, content, passwd : 사용자가 입력
readcnt, regdt, indent, ansnum  : default 값
ip                              : 요청 PC의 IP 저장(request에서 꺼내오면 됨)
grpno                           : max(bbsno)+1

--그룹번호(grpno) 만들기
select max(bbsno) from tb_bbs;
select max(bbsno)+1 from tb_bbs; --null값이면 계산 안됨
--nvl()함수를 이용해서 max(bbsno)값이 비어있을 때(null) 0으로 바꿈
select nvl(max(bbsno),0) from tb_bbs;
--nvl()함수를 이용해서 max(bbsno)값이 비어있을 때(null) 0으로 바꾼 후+1
select nvl(max(bbsno),0)+1 from tb_bbs;

--행추가
INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)
VALUES (bbs_seq.nextval, ?,?,?,?,?, (SELECT NVL(MAX(bbsno,0)+1 FROM tb_bbs));

--전체목록
select bbsno, wname, subject, readcnt, regdt
from tb_bbs
order by grpno desc, ansnum asc;

--상세보기
select * from tb_bbs where bbsno=?

--행삭제
delete from tb_bbs where bbsno=? and passwd=?

--행수정
update tb_bbs set wname=?, subject=?, content=?, ip=?
where bbsno=? and passwd=?

--조회수 증가
update tb_bbs set readcnt=readcnt+1 where bbsno=?

[답변쓰기 알고리즘]

- 새글 쓰기 : 최초의 부모글
- 답변 쓰기 : 자식글

- 그룹번호(grpno)
- 들여쓰기(indent)
- 글순서 (ansnum)

- 글순서(ansnum) 재조정
UPDATE tb_bbs 
SET ansnum=ansnum+1 
WHERE grpno=2 and ansnum>=6

[검색]
-- 제목+내용에서 '파스타'가 있는지 검색
where subject like '%  파스타  %' or content like '%파스타%'

-- 제목에서 '파스타'가 있는지 검색
where subject like '%파스타%'

-- 내용에서 '파스타'가 있는지 검색
where content like '%파스타%'

-- 작성자에서 '파스타'가 있는지 검색
where wname like '%파스타%'

//////////////////////////////////////////////////////////////
[페이징]
- rownum 줄번호 활용
1)
SELECT bbsno,subject,wname,readcnt,indent,regdt
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

2)rownum 추가 - 줄번호까지 정렬됨
SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

3)
SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
FROM (
		SELECT bbsno,subject,wname,readcnt,indent,regdt
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	 );
	 
4)
SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
from (
		SELECT bbsno,subject,wname,readcnt,indent,regdt
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	 )
where rownum>=1 and rownum<=5;

5)
SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
from (
		SELECT bbsno,subject,wname,readcnt,indent,regdt
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	 )
where rownum>=6 and rownum<=10;

6)줄번호가 있는 3)의 테이블을 한번 더 셀프조인하고, rownum칼럼명을 r을 바꾼다.
SELECT *
FROM (
		SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r
	    FROM (
				SELECT bbsno,subject,wname,readcnt,indent,regdt
				FROM tb_bbs
				ORDER BY grpno DESC, ansnum ASC
	 		 )
	 )
WHERE r>=6 AND r<=10;

7)제목에서 '파스타'가 있는 행을 검색해서 2페이지(6행~10행) 조회하시오
그러니까 아래 쿼리는 '파스타'가 포함된 글이 6개이상이지 않으면 조회가 안 됨.

SELECT *
FROM (
		SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r
	    FROM (
				SELECT bbsno,subject,wname,readcnt,indent,regdt
				FROM tb_bbs
				WHERE subject LIKE '%파스타%'
				ORDER BY grpno DESC, ansnum ASC
	 		 )
	 )
WHERE r>=6 AND r<=10;

