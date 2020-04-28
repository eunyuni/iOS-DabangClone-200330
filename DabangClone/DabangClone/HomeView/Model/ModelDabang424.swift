// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dabang = try? newJSONDecoder().decode(Dabang.self, from: jsonData)

import Foundation

// MARK: - DabangElement
struct DabangElement: Codable {
      let pk: Int
      let broker: Broker
      let type: BuildingTypeEnum
      let dabangDescription: String
      let address: Address
      let lng, lat: Double
      let salesForm: SalesForm
      let floor, totalFloor, areaChar: String
      let supplyAreaInt: Int
      let supplyAreaChar: String
      let shortRent: Bool
      let managementSet: [String]
      let parkingDetail: String
      let parkingtf: Bool
      let livingExpenses, livingExpensesDetail: String?
      let moveInChar: String
      let moveInDate: String?
      let optionSet: [OptionSet]
      let heatingType: Heating
      let pet, elevator, builtIn, veranda: Bool
      let depositLoan: Bool
      let totalCitizen, totalPark, complete: String?
      let securitySafetySet: [SecuritySafetySet]
      let postimage: [String]
      let complex: Complex?

      enum CodingKeys: String, CodingKey {
          case pk, broker, type
          case dabangDescription = "description"
          case address, lng, lat, salesForm, floor, totalFloor, areaChar, supplyAreaInt, supplyAreaChar, shortRent
          case managementSet = "management_set"
          case parkingDetail
          case parkingtf = "parkingTF"
          case livingExpenses = "living_expenses"
          case livingExpensesDetail = "living_expenses_detail"
          case moveInChar, moveInDate
          case optionSet = "option_set"
          case heatingType, pet, elevator, builtIn, veranda, depositLoan, totalCitizen, totalPark, complete
          case securitySafetySet = "securitySafety_set"
          case postimage, complex
      }
  }

  // MARK: - Address
  struct Address: Codable {
      let loadAddress: String
      let detailAddress: String?
  }

  // MARK: - Broker
  struct Broker: Codable {
      let pk: Int
      let companyName, address, managerName, tel: String
      let image: String
      let companyNumber: String
      let brokerage: Brokerage
      let dabangCreatedAt, successCount: String

      enum CodingKeys: String, CodingKey {
          case pk, companyName, address, managerName, tel, image, companyNumber, brokerage
          case dabangCreatedAt = "dabangCreated_at"
          case successCount
      }
  }

  enum Brokerage: String, Codable {
      case empty = "-"
      case the11200201800221 = "11200201800221"
      case the11200201900121 = "11200-2019-00121"
      case the11680201900396 = "11680201900396"
      case the92262605 = "9226-2605"
      case 제11680201900149 = "제11680-2019-00149"
  }

  // MARK: - Complex
  struct Complex: Codable {
      let pk: Int
      let complexName: ComplexName
      let buildDate: String
      let totalCitizen: TotalCitizen
      let personalPark: PersonalPark
      let totalNumber: TotalNumber
      let heatingSystem: Heating
      let minMaxFloor: MinMaxFloor
      let buildingType: BuildingTypeEnum
      let constructionCompany: ConstructionCompany
      let fuel: Fuel
      let complexType: ComplexType
      let floorAreaRatio: FloorAreaRatio
      let dryWasteRate: DryWasteRate
      let complexSale: ComplexSale
      let complexPrice: ComplexPrice
      let areaSale: AreaSale
      let areaPrice: AreaPrice
      let image: [String]
      let list: [Int]
      let countPost: Int
  }

  enum AreaPrice: String, Codable {
      case the1602만33M당 = "1602만/3.3m²당"
  }

  enum AreaSale: String, Codable {
      case the2745만33M당 = "2745만/3.3m²당"
  }

  enum BuildingTypeEnum: String, Codable {
      case 쓰리룸 = "쓰리룸"
      case 아파트 = "아파트"
      case 원룸 = "원룸"
      case 원룸주방분리형15룸 = "원룸(주방 분리형(1.5룸))"
      case 투룸 = "투룸"
  }

  enum ComplexName: String, Codable {
      case 강변건영 = "강변건영"
      case 갤러리아포레 = "갤러리아포레"
      case 대림로즈빌 = "대림로즈빌"
      case 동아 = "동아"
      case 성수동아그린 = "성수동아그린"
      case 트리마제 = "트리마제"
  }

  enum ComplexPrice: String, Codable {
      case empty = "-"
      case the1115만33M당 = "1115만/3.3m²당"
      case the1289만33M당 = "1289만/3.3m²당"
      case the3776만33M당 = "3776만/3.3m²당"
  }

  enum ComplexSale: String, Codable {
      case empty = "-"
      case the4502만33M당 = "4502만/3.3m²당"
  }

  enum ComplexType: String, Codable {
      case 계단식 = "계단식"
      case 복합식 = "복합식"
  }

  enum ConstructionCompany: String, Codable {
      case 대림산업주식회사 = "대림산업주식회사"
      case 동아건설주 = "동아건설(주)"
      case 두산중공업주 = "두산중공업(주)"
      case 주건영 = "(주)건영"
      case 주한화건설 = "(주)한화건설"
  }

  enum DryWasteRate: String, Codable {
      case empty = "-"
      case the16 = "16%"
      case the20 = "20%"
      case the27 = "27%"
      case the41 = "41%"
  }

  enum FloorAreaRatio: String, Codable {
      case empty = "-"
      case the279 = "279%"
      case the281 = "281%"
      case the301 = "301%"
      case the319 = "319%"
      case the399 = "399%"
  }

  enum Fuel: String, Codable {
      case 도시가스 = "도시가스"
  }

  enum Heating: String, Codable {
      case 개별난방 = "개별난방"
      case 중앙 = "중앙"
  }

  enum MinMaxFloor: String, Codable {
      case the1010층 = "10-10층"
      case the2847층 = "28-47층"
      case the645층 = "6-45층"
      case the815층 = "8-15층"
      case the825층 = "8-25층"
      case the918층 = "9-18층"
  }

  enum PersonalPark: String, Codable {
      case the11대 = "1.1대"
      case the16대 = "1.6대"
      case the1대 = "1대"
      case the65대 = "6.5대"
  }

  enum TotalCitizen: String, Codable {
      case the230세대 = "230세대"
      case the331세대 = "331세대"
      case the372세대 = "372세대"
      case the390세대 = "390세대"
      case the580세대 = "580세대"
      case the688세대 = "688세대"
  }

  enum TotalNumber: String, Codable {
      case the2동 = "2동"
      case the3동 = "3동"
      case the4동 = "4동"
      case the6동 = "6동"
  }

  // MARK: - SalesForm
  struct SalesForm: Codable {
      let type: SalesFormType
      let depositChar, monthlyChar: String
      let depositInt, monthlyInt: Int
  }

  enum SalesFormType: String, Codable {
      case 매매 = "매매"
      case 아파트 = "아파트"
      case 월세 = "월세"
      case 전세 = "전세"
  }

  enum SecuritySafetySet: String, Codable {
      case cctv = "CCTV"
      case 경비원 = "경비원"
      case 공동현관 = "공동현관"
      case 방범창 = "방범창"
      case 비디오폰 = "비디오폰"
      case 인터폰 = "인터폰"
      case 카드키 = "카드키"
  }
  
    enum OptionSet: String, Codable {
        case tv = "TV"
        case 가스레인지 = "가스레인지"
        case 냉장고 = "냉장고"
        case 비데 = "비데"
        case 세탁기 = "세탁기"
        case 신발장 = "신발장"
        case 에어컨 = "에어컨"
        case 옷장 = "옷장"
        case 인덕션 = "인덕션"
        case 전자도어락 = "전자도어락"
        case 전자레인지 = "전자레인지"
        case 책상 = "책상"
        case 침대 = "침대"
    }


extension OptionSet {
func imageName() -> String {
  var imageName = ""
  switch self {
  case .에어컨:
    imageName = "https://www.dabangapp.com/static/media/aircondition.44b18cc8.svg"
  case .세탁기:
    imageName = "https://www.dabangapp.com/static/media/laundry.0a16ead7.svg"
  case .책상:
    imageName = "https://www.dabangapp.com/static/media/desk.748a98e2.svg"
  case .신발장:
    imageName = "https://www.dabangapp.com/static/media/shoes.bb4d329a.svg"
  case .인덕션:
    imageName = "https://www.dabangapp.com/static/media/induction.5e864e8c.svg"
  case .전자도어락:
    imageName = "https://www.dabangapp.com/static/media/doorlock.7232c733.svg"
  case .냉장고:
    imageName = "https://www.dabangapp.com/static/media/refrigerator.e02bcaa9.svg"
  case .전자레인지:
    imageName = "https://www.dabangapp.com/static/media/microoven.8ea02a25.svg"
  case .가스레인지:
    imageName = "https://www.dabangapp.com/static/media/gas.fbf3fa6e.svg"
  case .침대:
    imageName = "https://www.dabangapp.com/static/media/bed.df0ca1a5.svg"
  case .tv:
    imageName = "https://www.dabangapp.com/static/media/tv.476aa44b.svg"
  case .옷장:
    imageName = "https://www.dabangapp.com/static/media/closet.c5f64c5d.svg"
  case .비데:
    imageName = "https://www.dabangapp.com/static/media/bidet.3bc9f2e6.svg"
  default:
    break
  }
  return imageName
}
}

typealias Dabang = [DabangElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


struct CoordinateFromAddress {
  var pk: Int?
  var coordinate: CLLocationCoordinate2D?
}


// MARK: - User Model
struct User: Codable {
    let pk: Int
    let phone: String?
    let profileImage: String?
    let recentlyCheckedRooms: [DabangElement]?
//    let markedRooms: [DabangElement]?
    let contactedBrokers: [Broker]?
    enum CodingKeys: String, CodingKey {
        case pk, phone, profileImage
        case recentlyCheckedRooms = "posts"
//        case markedRooms
        case contactedBrokers = "brokers"
    }
}


class UserData {
    static let shared = UserData()
    var user: User!
    private init() {}
    
}
