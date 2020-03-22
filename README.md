# SiriKit
SiriKit, ShortCut, intents, intents UI

Siri ShortCut을 위한 샘플앱

SiriKit (iOS 10이상)

Intents, Intents UI Framework

Intents App Extension ?
User(request) -> SiriKit -> APP Task

Intents FrameWork? 
우리의 앱과 시스템의 커뮤니케이션을 도와주는 프레임워크

Intents UI FrameWork?
Intents를 UI로 커스텀할수있게 만들어줌


[구현편]
![guide_siri_project_00](./README image/intents/guide_siri_project_00)
project -> Signing & Capabiliies에서
Siri 사용 추가

![이미지](./README image/guide_siri_project_01.png)
New File에서 SiriKit Intent Definition File 추가


![이미지](./README image/guide_siri_project_02.png)![이미지](./README image/guide_siri_project_03.png)
왼쪽 하단 ‘+’ 버튼을 눌러
내가 원하는 의도대로 request와 response 작성

![이미지](./README image/guide_siri_project_04.png)
Project -> 왼쪽 하단 ‘+’ -> intents Extension 추가

![이미지](./README image/guide_siri_project_05.png)
Intent Extension을 추가하면
Xcode는 CityWeatherIntent.swift를 추가한다.

모든 의도는 CityWeatherIntent.swift를 통하여 처리가 된다.
이를 핸들링 할수 있는 핸들러를 만들어준다.

![이미지](./README image/guide_siri_project_06.png)
이 후 Appdelegate에 Siri를 통해 들어온 의도를 처리할수 있는
userActivity에 내용을 구현함


[SiriKit Debugging]
guide_siri_debugging_00
Intents 선택후 Edit Scheme

guide_siri_debugging_01
Siri Intent Query에 디버깅시에 시리에게 수행시킬 문자열을 입력

guide_siri_debugging_02
수행


[수행 모습]
Siri ShortCut




참고 URL  :  https://itnext.io/siri-shortcut-tutorial-using-custom-intent-d0f836af5863
