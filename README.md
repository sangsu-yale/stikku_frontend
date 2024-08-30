<div align="center">
  <img src="https://github.com/user-attachments/assets/dfa5358d-f3dd-4220-9691-f7525854a1b7" alt="icon" width="200px"/>
  <h1>스티다 - 스포츠 티켓 다이어리</h1>
</div>

<br />
  
## 📚 목적
**"좋아하는 스포츠 경기 관람 후 나만의 후기를 쓰고, 보여 주고 싶어!"**  
  
영화나 뮤지컬 관람과 더불어 스포츠에도 뜨거운 인기 열풍이 불고 있는 가운데, **스포츠 경기의 직관 기록을 남기는 사람들은 보통 수기로 남겨 사진을 찍거나 닉네임 옆에 (1승 9패)를 써 놓는 등의 행동을 보였습니다.**   
  
종이로 된 스포츠 다이어리가 있었지만 종목이 정해져 있었고, 자주 보게 되는 스포츠 특성상 친구들과 공유하기에는 불편함이 따랐습니다. **모바일로 간편하게 관리하고, 남들에게 보여 줄 수 있는 추억 적립 "관람 티켓"이 필요**했습니다.  
  
### ✨ 스티다의 목표
- 간단하게 작성할 수 있을 것  
- 어떠한 스포츠도 기록이 가능할 것
- 내가 본 경기를 한눈에 파악할 수 있을 것
- 기록이 작성된 티켓의 이미지는 절대 비어 보이지 않을 것  
- 내가 본 경기의 승률 통계를 볼 수 있을 것  
- 마이 팀(응원 팀)만 따로 볼 수 있을 것  

<br />

## 📬 스티다 프로젝트 문서
사용자 요구사항 명세서를 비롯하여, 프로젝트를 구현하며 집중한 부분, 자주 보였던 에러 등, 개발 과정에 대해 작성한 문서입니다.  
**스티다, 어떻게 개발했을까? ✅[스티다 프로젝트 문서로 이동](https://www.notion.so/61fa3a940f574f83a5c45473017a06f8)**


  <br />
  
## 🚩 팀 소개
- **2인 프로젝트** | 프론트엔드 1인, 백엔드 1인  
- **프론트엔드 단독 진행**, UI/UX 및 디자인 제작, 기획 참여  
- 2024.07 ~ 2024.08 (1개월 15일)
  
**<img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"> <img src="https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"> <img src="https://img.shields.io/badge/getx-8A2BE2?style=for-the-badge&logo=getx&logoColor=white"> <img src="https://img.shields.io/badge/isar-4285F4?style=for-the-badge&logo=flutter&logoColor=white">**

<br />

## 🚀 사용 방법
#### 직접 사용해 보고 싶으시다면?
- 안드로이드용 APK 파일 다운로드 후 실제 사용이 가능합니다.
➡️ [GoogleDrive](https://drive.google.com/file/d/1fxNMNumqiDyLxMZNN673JgLRTcuX8khD/view?usp=drive_link)

#### Flutter와 AMD가 설치되어 있다면? (VSCode 기준)
1. 스티다 프로젝트를 Clone해 주세요.
2. 터미널 > `flutter pub get` 실행해 주세요.
3. 안드로이드 에뮬레이터 디바이스를 연동해 주세요.
4. `flutter run` 혹은, `main.dart`에서 `▶️`를 클릭하여 스티다 프로젝트를 실행하세요.
  
_현재 앱스토어 출시를 준비 중이며, 비공개 사용자 피드백을 반영한 업데이트를 계획하고 있습니다._
  
<br />
  
## 🚀 주요 기능
- 🌟 **간단한 경기 기록을 작성 및 기록 티켓 발급**
  - 팀 이름 / 스코어만 적어도 작성 가능 (0점인 경우 팀 이름만으로도 가능)
  - 다이어리의 경우, 작성하고 싶은 위젯만 선택 가능
<img src="https://github.com/user-attachments/assets/649ac8f1-f104-4113-bf45-b72375f5308b" alt="기록 작성" width="350px"/>

<br />
<br />
<br />

- 🌟 **경기 기록 수정 및 삭제**
<img src="https://github.com/user-attachments/assets/0d6b9112-4345-46b1-86d9-3ed02903df94" alt="수정 삭제" width="350px"/>

<br />
<br />
<br />

- 🌟 **한 달간의 관람 현황을 한눈에 확인 가능**
  - 오늘자 경기 작성 시, 하단의 기록 작성 버튼(연필 아이콘)이 기록 페이지 이동 버튼(메모 아이콘)으로 변경 
<img src="https://github.com/user-attachments/assets/5283b65c-44d8-45d1-83cc-31d94ab3fb92" alt="티켓 저장" width="350px"/>

<br />
<br />
<br />

- 🌟 **관람 티켓 갤러리에 저장**
  - 관람 기록 및 다이어리 둘 다 저장 가능
<img src="https://github.com/user-attachments/assets/9df2e478-7a1a-447b-ae39-35f58886eb6c" alt="티켓 저장" width="350px"/>

<br />
<br />
<br />
  
- 🌟 **원하는 것만 볼 수 있는 리스트 필터 기능 4종 및 2가지 View 옵션**
  - 필터 기능 (전체보기 및 직관만, 집관만, 이긴 경기만 등)
  - 순서 (최근순, 오래된순, 작성순) 정렬, 좋아요 및 검색 기능
<img src="https://github.com/user-attachments/assets/a8269e47-711b-4093-8afd-2cf1456ff0f2" alt="필터 기능" width="350px"/>

<br />
<br />
<br />
  
- 🌟 **직관 및 집관 통계 기능 제공**
<img src="https://github.com/user-attachments/assets/aabf617b-6744-43c8-b99e-af2f47b26e2d" alt="통계" width="350px"/>

<br />
<br />
<br />
  
- 🌟 **소셜 로그인(구글) 및 로그아웃**
<img src="https://github.com/user-attachments/assets/e9d5a0d7-ba22-43b5-9501-10d5a2c5a5b5" alt="로그인 로그아웃" width="350px"/>

<br />
<br />
<br />
  
- 🌟 **이전 데이터 불러오기**
  - 로그인 시, 이전에 썼던 데이터 불러올 수 있음
<img src="https://github.com/user-attachments/assets/f91d81e5-1aee-4865-806b-26d49d641b7e" alt="데이터 불러오기" width="350px"/>


---
  
감사합니다! 😊  
