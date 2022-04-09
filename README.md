# ⛺️iOS 커리어 스타터 캠프

## 목차
- [쥬스 메이커 프로젝트 ](#️-쥬스-메이커-프로젝트)
    - [실행 화면](#실행-화면)
   - [Step1](#Step-1)
       - [구현 내용](#구현-내용-Step1 )
     - [고민한점](#고민한점-Step1 )     
     - [학습키워드](#학습키워드-Step1)
     - [배운개념](#배운-개념-Step1)
   - [Step2](#Step-2)
       - [구현 내용](#구현-내용-Step2 )
       - [고민한점](#고민한점-Step2)
       - [학습키워드](#학습키워드-Step2)
       - [배운개념](#배운-개념-Step2)
    - [Step3](#Step-3)
        - [구현 내용](#구현-내용-Step3 )
        - [고민한점](#고민한점-Step3)
        - [학습키워드](#학습키워드-Step3)
        - [배운개념](#배운-개념-Step3)

</br>
</br>


## ⛺️ 쥬스 메이커 프로젝트 
🗓 기간 : 2022.02.21 ~ 2022.03.11(3w)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [Eddy](https://github.com/kimkyunghun3)</br>
🗓 리뷰어 : [도미닉](https://github.com/AppleCEO)</br>
📝 설명 : 맛있는 주스를 만들고, 재고 관리까지 해주는 app  (console app)</br>
</br>

</br>
## 실행 화면


![Simulator Screen Recording - iPhone 13 Pro Max - 2022-03-07 at 11 12 18](https://user-images.githubusercontent.com/75601594/156959790-ebd0229b-b661-4e12-b144-78915ab3d9ae.gif)
![juicemaker](https://user-images.githubusercontent.com/52434820/162580812-4d0454e1-e497-4093-be27-e939152ff805.gif)


# Step 1


## 구현 내용 Step1
- `JuiceMakerError`  에러타입  enum 구현
- `consumeFruit`  과일의 수를 세는 함수 구현 
- `JuiceTypes` 쥬스의 과일의 타입을 구현
- `recipe`  쥬스 레시피 switch로  각 레시피 별로 과일 수량 구현 
- `makeJuice` 레시피 수량을 확인 하는 함수 


</br>

  

## 고민한점 Step1

1. 역시나  네이밍은  항상  어렵고  힘드네요 .. ㅠㅠ🤣🤣
```swift=
 result를 안쓰고 한 경우 
 func makeJuice(fruitJuice: FruitsTypes) {
        let recipe = fruitJuice.recipe
        do  {
            try fruitStore.countFruit(recipe: recipe)
        } catch JuiceMakerError.outOfStock {
            print("재고가 없습니다")
        } catch {}
    }

```
</br>

result를 쓰고 한 경우인데  아직은 result에 대한 공부가 부족해서 
do catch문으로 코드를 구현해서 pr을 요청드립니다

```swift=
 func make(fruitJuice: Int) -> Result<Bool, JuiceMakerError>{
    
        guard fruitJuice > 10 else {
            return .failure(.outOfStock)
        }
        return .success(true)
```

> 보통 result 를 안 쓰고 진행하는 것 같습니다. 에러가 표시되야하면 throw 해서 상위 함수에서 에러 처리를 한다던지 해서요. 이렇게 하면 result를 따로 사용하지 않아도 괜찮을 것 같습니다.
> 
</br>

2. 처음 UML 작성처럼 기능을 클래스 단위로 분리해서 코드를 구현해볼까 고민해봤습니다. 그래서 가장 슈퍼클래스에서 이들을 상속받아서 하려고 했으나, 찾아보았더니 다중상속을 swift는 지원을 하지 않는 것으로 알게 되었습니다. 그래서 기능을 다른 클래스에서 상속받아서 연달아 사용하는 방식(마치 함수들을 연결짓기 위해 매개변수를 활용하는 방식)을 생각했는데, 이렇게 되면 초기화 함수 같은 것을 구현했을 떄 매번 사용할 떄 불편할 뿐만 아니라 이렇게 기능단위로 클래스 구분이 맞는가 의심이 되었습니다. 작은 단위로 기능을 구현하는 것도 좋지만 한 클래스 안에 속할 수 있는 기능은 클래스 하나로 묶어서 하는 것이 저는 더 맞는 구현 방향이라고 생각하는데 이에 대한 조언을 듣고 싶습니다.
> 하나의 클래스에서 너무 많은 동작을 하면 읽기도 힘들고 객체지향적이지 않게 됩니다. 각자 역할을 나눠서 여러 객체가 상호작용하면서 동작이 진행되는 것이 더 좋다고 생각합니다. 물론 기능이 연관되 있으면 하나의 클래스에서 최대한 구현하는 것도 괜찮겠죠!
> 
3. UML에서 저희가 상속을 사용하지 않고 예를 들어 구조체로 구현한 것을 인스턴스하여 사용하거나 enum을 하나의 딕셔너리를 초기화할 떄 사용하는 식으로 했는데 이런 경우에는 어떻게 연결관계를 해야할지 고민이 되었습니다. 단순히 연관이 있다고 해서 현재에는 선을 통해서 표현했는데, UML Class diagram 같은 경우에는 클래스의 상속 등과 같은 객체적 연관관계와 이에 따른 화살표 모양이 존재하는데 구조체같은 경우에는 이처럼 선으로만해서 이를 사용하고 있다고 봐도 될까요? 상속이 아닌 인스턴스 만드는 것이라 저는 그부분이 맞다고 생각이 들었었습니다.

> 클래스와 구조체는 같은 객체라서 클래스와 거의 같게 그릴 수 있을 것 같습니다. 상속같은 부분은 구조체에서는 못하니까 못그리는게 맞겠지만요~

## 브랜치 전략 
- main: 완성된 프로젝트를 보관하는 브랜치
- develop: pr를 받고 완성된 코드를 병합하는 브랜치
- step1,2,3: 각 스텝의 요구사항을 구현하는 / 평소 코드를 작성하는 브랜치

 ![](https://i.imgur.com/RyPTGCQ.jpg)
 
## 학습 키워드 Step1
- CaseIterable
- enum - associated value
- git flow
- MVC
- 초기화
- do try catch 
- class & struct 
- 저장 프로퍼티

## 배운 개념 Step1
- 에러 메세지를 출력할 때에는 다른 에러가 있을 수 있다는 가능성을 배제하면 안되고 모든 경우의 수에 대한 처리와 에러 메시지를 통해 구분하여 에러가 났을 때 개발자가 바로 확인가능하도록 해야한다.
- 코딩 컨벤션을 정할 때  함수와 함수사이에 띄어쓰기 등과 같이 코드의 컨벤션으로 코드의 가독성을 증진 시키고 읽기 좋은 코드룰 작성 할수있다. 
- class, struct의 가장 큰 차이점은 상속가능여부에 있다. 또한 모든 기능별로 클래스를 구분하여 사용하게 되면 무분별한 상속이 이루어지기 때문에 오히려 가독성을 해칠 수 있다. 그러므로 클래스에 속하는 연관된 기능은 하나의 클래스로 묶는 것이 가독성을 높이고 구현의 편의성도 제공한다.
- git flow를 사용함으로써 메인에서 생기는 에러를 미리 수정하여 메인 프로젝트와 거리를 유지할 수 있다. 또한 브랜치별 구현을 통해 가독성이 높아지고 분업화된 협업이 가능해진다.
- CaseIterable는 모든 case 값들에 컬렉션을 제공하는 타입으로 일반적으로 enum으로 각 케이스 별로 관리 하는것 보다  한 꺼번에 enum의 값을  변경해줄수 있어서 사용하기가 편리 했다.
  
# Step2 
## 구현 내용 Step2 
### Controller
- JuiceMakerViewController: 
    - fruitsLabelCollection: 주스 라벨 모음
    - changeViewControllerTapped: 버튼 클릭 시 뷰컨트롤러 전환 함수 
    - orderJuicesbuttonPressed: 주스 버튼 클릭 시 주스 주문 함수
    - orderJuices: 주스 재고 상황에 따른 라벨 업데이트 및 알람 표시 함수
    - updateFruitsLabel: 주스 주문에 따라 재고 변경을 라벨에 적용 함수 
    - showStockChangeAlertMessage: 과일 재고 없을 시 알림 메시지 함수
    - showJuiceAlertMessage: 과일 재고 있을 시 주스 주문 알림 함수
    - initFruits: 과일 재고 10으로 초기화 함수
- ChangeStockViewController: 재고 수정

</br>

### Model
- JuiceMaker: 주스 만들기
- FruitStore: 과일 초기값 설정, 과일 사용에 따른 재고 변경
- JuiceTypes: 주스 타입 모임, 레시피 구현
- FruitsTypes: 과일 타입 모음
- AlertMessage: 경고메시지 모음

</br>

### Error
- JuiceMakerError : 에러 처리 모음 열거형

</br>

## 고민한점 Step2

orderFruitsButton 함수에서 default를 어떤식으로 처리해야할지 고민이 되었습니다. 현재 저희가 버튼 클릭에 따라 각각 구현하는 곳을 다르게 했는데 default에 들어갈 버튼이 존재하지 않습니다. 그래서 사실상 default로 가는 부분은 없다고 하지만 switch에서 default 부분에 대한 처리가 필수이기 때문에 어쩔 수없이 Error 케이스를 하나 만들어서 넣었습니다. 하지만 알다시피 이곳은 사용되지 않는 다는 노란색 경고창이 뜨는데 이는 당연하다고 하지만 이를 어떤 식으로 처리하면 좋을지 궁금합니다.
>  열거형을 활용하면 switch문에서 꼭 default 를 작성하지 않아도 됩니다. 이 특성을 활용해보면 어떨까요?

updateFruitsLabel에서 각각의 케이스에 따라 변화하는 재고의 text를 뷰에 보여지도록 구현했습니다. 하지만 딕셔너리가 딕셔너리 자체에서는 옵셔널 타입이 아닌데, 딕셔너리에서의 값을 접근하여 이를 활용하려고 하면 옵셔널 타입이 되는 것을 파악하게 되었습니다. 그래서 옵셔널 바인딩을 통해 옵셔널을 벗겨야되는데 사실 이것을 사용하는 시점이 case 안 이기 때문에 이 순간을 제외하고는 옵셔널이 아니라 옵셔널 바인딩을 사용하는 곳이 case 안에서만 필요하다고 느끼게 되었습니다. 그래서 저는 코드의 가독성을 위해 nil-coalesing 를 활용하는 것이 더 적절하다고 하는데 어떻게 생각하시는지 궁금합니다. 또한 그 값을 따로 빼서 0으로 지정했는데 그 이유로는 여기에서는 재고가 없으면 0 이 되므로 옵셔널로 nil인 경우 0으로 해줘도 될 것이라고 판단했는데 잘못된 방향의 생각인지 궁금합니다.
>  이 과일에 재고가 0인건지 이 과일이 없는 과일인지 구분이 되면 더 좋다고 생각은 듭니다. 그런 부분은 try catch 를 활용해서 처리가 가능할 것 같은데요!

initFruits 함수에서 저희는 딕셔너러의 키와 값을 통해 초기화 해주는 방법을 생각했습니다. 처음에는 스위치로 하면 더 보기 좋은 코드가 되겠다고 생각했지만 이 딕셔너리 속에는 딸바쥬스, 망고키위쥬스가 같이 존재하기 때문에 default로 이 딕셔너리가 가는 것을 확인하게 되었습니다. 그래서 if- else if 로 구현하게 되었는데 코드 상에서 가독성이 떨어지지만 이렇게 할 수 밖에 없는 이유가 있었는데 괜찮을지 궁금합니다.
> 매칭해주는 다른 방법을 고려해볼 수 있을까요? 저는 이럴 때 enum 의 rawValue 를 많이 활용하는 편입니다~

IBOutlet, IBAction 네이밍에 대한 정보가 공식문서에서 찾아볼 수 없어서 이곳저곳 찾아봤는데 Label를 쓰는경우 마지막에 Label 표시와 button를 탭한경우 Tapped 라는 것을 마지막에 쓰는 것을 보았는데 이것이 일반적인 네이밍 방식인지 궁금합니다. 아니면 저희가 컨벤셔널한 네이밍을 찾지 못한것인지..? 궁금합니다.
> 보통 label 은 붙이는 것이 맞습니다. tap 은 저는 앞 쪽으로 작성을 합니다. 예를 들면 tappedStrawberryButton 과 같이요. 이런 것은 정확한 규칙은 없습니다. 통일감 있게만 작성하면 될 것 같습니다.

일단 저희가 생각하기에 class 2개에 대해서는 현재로서는 상속받을 일이 없기에 final로 구현을 했습니다. 또한 ViewController에서 필요한 부분을 캡슐화했는데 캡슐화한 것이 제대로 한것인지, 또 추가로 할 수 있는데 안한 곳이 있는지 궁금합니다.
> 캡슐화라는 것이 메소드들에 접근제어자를 설정한 것을 말씀하시는거죠? 다른 객체에서 쓰이지 않는다면 label, button 과 같은 프로퍼티들도 접근제어자를 설정해 볼 수 있을 것 같네요~

설계한 방식이 model에 있는 것을 사용해서 ViewController에서 View와 연관짓도록 만들려고 노력을 했는데 혹시 저희가 설계하여 구현한 방식이 MVC 패턴을 활용한 적절한 방법인지 궁금합니다.
> 보통 폴더명을 나누는 것도 MVC를 작성하는데 좋지만 모델이라는 객체에서만 필요한 것들(에러를 선언한 열거형 등)은 모델 객체 안에서 선언해주는 것도 좋을 것 같습니다. 예를 들면 JuiceMaker 에서 발생할 에러들을 따로 model/Error.swift 라고 놓는 것이 아니라 JuiceMaker 객체 안에서 열거형을 선언하는 방식 등으로 조금 더 모델에 연관성있게 붙여놓을 수 있을 것 같네요!

## 브랜치 전략 
![](https://i.imgur.com/483zYVb.png)


### 학습 키워드 Step2
- init rawValue
- 캡슐화
- IBoutletCollection
- Tag
- SRP 원칙

## 배운 개념 Step2
- init의 rawValue와 버튼이나 라벨의 tag를 활용해서 이를 매칭시킨 후 적절한 값을 반환하는 방식으로 사용하니 switch문을 없앨 수 있어서 가독성을 높힐수 있었습니다. 이것이 오히려 더 객체지향적인 설계 즉 SRP 원칙을 사용해서 하는 방식이 맞다는 점을 배우게 되었습니다.
- 어떤 부분을 캡슐화 할 수 있을지 고민이 되었고, 그 중에 private인 함수 속 내부 변수가 public이면 적절하지 않을 것같다고 판단하게 되었으며 public인 함수 내부 변수가 private인 것은 일부만 캡슐화 시킬 수 있다고 판단하여 가능하다고 생각했습니다. 이를 통해 캡슐화의 용도와 어떤 식으로 사용해야할지에 대해 학습할 수 있었습니다.
- IBOutletCollection를 통해 동일한 기능을 하는 Iboutlet를 하나로 묶은 배열을 활용하고 이를 tag를 통해 사용할 수 있다는 것을 파악할 수 있었습니다.
- 버튼과 라벨의 네이밍에 대한 규칙이 없기 때문에 이를 통일성 있게 사용하면 된다는 것을 학습했습니다. 예를 들어 Label를 네이밍 마지막에 붙이거나, 버튼은 맨 앞이나 맨 뒤에 Tapped를 써서 탭했을 시 하는 행동한다는 것을 명시할 수 있었습니다.


# Step3

## 구현 내용 Step3
### Controller
- JuiceMakerViewController
    - viewWillAppear(_ animated: Bool) : 다음화면에서 이전화면 왔을 때 호출되는 뷰 싸이클 메서드
- ChangeStockViewController
    - showFruitsStock() : 현재 과일의 재고를 보여주는 메서드
    - @IBAction stepperPressed(_ sender: UIStepper) : Stepper 눌렀을 시 값을 증감 시키도록 하는 메서드
    - @IBAction updateFruitStockButtonTapped(_ sender: Any) : 이전으로 돌아가며 과일 값을 업데이트하는 메서드

## 고민한점 Step3
- 데이터 전송
- Stepper 활용
- viewWillAppear 활용 
- magic number 처리 

## 학습키워드 Step3
- stepper
- data transfer
- view life cycle
- magic number

## 배운 개념 Step3
- 데이터 전송 방법으로는 여러가지가 있다. Segue를 활용한 데이터 전송, Delegate 활용한 데이터 전송, closure를 활용한 데이터 전송, 프로퍼터를 활용한 데이터 전송, NotificationCenter를 활용한 전송 방식이 있다. 먼저 설계할 때 NavigationController를 활용해서 Push, pop를 활용하기 때문에 Segue를 사용하기 애매하다고 판단했으며 Delegate는 단방향인데 양방향으로 하기에 적절하지 않다고 판단했습니다. 그리고 클로저, 프러퍼티, NotificationCenter 보다는 이전 화면으로 돌아가는 것이기 때문에 viewWillAppear() 가 호출되기 때문에 init시 딕셔너리의 키와 값을 통해 업데이트 시키는 것을 호출하면 되겠다고 생각해서 간단하게 구현이 가능하므로 이렇게 진행하게 되었습니다.
- Stepper를 활용해서 여러 Stepper 케이스를 Switch문을 통해 각각 처리해주도록 했습니다. 이는 어떤 과일을 누르는지 파악할 수 있기 때문에 가독성을 높이려고 했습니다.
- magic number를 작성하게 되면 이 숫자나 문자열이 의미하는 것을 다른 사람이 파악하기 어렵다고 판단해서 이를 전역이나 지역변수로 할당해서 재사용성을 높이는 것이 좋다고 판단했습니다. 그리하여 magic number를 지양하도록 했습니다.

