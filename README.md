# TeamProject_BikeMap

환경 설정

 - Base : Spring
 - DB 연결 : Mybatis

코드 작성 시

1. 변수 작성
  - DB 에 존재하는 변수는 그 이름 그대로
  - 줄임말 사용은 최대한 지양해주세요.
  - 데이터 변경 시에는 메소드 / 클래스 생성 시 기본 예약어 사용
    추가 : insert
    변경 : update
    삭제 : del
    선택 : select
  - 행동(액션/이벤트 등) + 목적(대상/변수 등) + 추가 조건(있을 시)
    login
    logout
    selectListAll
    selectListWithAge
    
2. 같은 페이지에서 결과 출력할 때는 ajax 우선 사용
3. 메소드 생성, 복잡한 조건문 사용 시 주석 잘 달기

