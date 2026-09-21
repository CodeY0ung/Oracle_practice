SELECT CURRENT_TIMESTAMP FROM dual;

CREATE TABLE server_time(
    id NUMBER PRIMARY KEY,
    -- 자바단에서는 getobject -> offsetDateTime으로 받아야 한다.
    current_time TIMESTAMP WITH TIME ZONE NOT NULL
);

INSERT INTO server_time VALUES(1, CURRENT_TIMESTAMP);
insert into server_time values(2, current_timestamp);

COMMIT;
SELECT * FROM server_time;

create table fcfs(
    id number primary key,
    name varchar2(20) not null,
    reserve_at timestamp with time zone not null,
    reserve_at_with_zone timestamp with time zone not null
);

drop table fcfs;
select * from fcfs;

delete from fcfs where id = 1;
-- Instant  : 절대적인 순간
-- OffsetDateTime : 날짜 + 시간 + UTC Offset(UTC 기준으로 떨어진 시간거리)
-- ZonedDateTime : 날짜 + 시간 + UTC Offset + 지역시간대
-- 지역시간대를 포함하냐 안하냐 차이

-- [참고]
-- Instant를 사용할 때 : 
-- - 애플리케이션 내부 로직처리, 백엔드 서비스 간 내부 통신
-- - 단순히 "이 이벤트가 정확히 언제 일어났는가"에 대한 데이터 기록

-- OffsetDateTime을 사용할 때 :
-- - RestAPI의 JSON 요청/응답 스펙 정의
-- - JPA/HIBERNATE 사용 시 Oracle의 TIMESTAMP WITH TIME ZONE 컬럼 매핑
-- - 날짜/시간의 개별 필드(연,월,일, 시간 등)를 뽑아내어 로직을 처리할 때

-- *ZoneDateTime과의 차이
-- OffsetDateTime은 단순 Offset(+9:00)만 보존함.
-- ZoneDateTime은 이에 더해 타임존 ID(Asia/Seoul)외 서머타임(DST) 규칙까지 함께 관리함.
