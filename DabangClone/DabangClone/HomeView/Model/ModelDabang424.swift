// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dabang = try? newJSONDecoder().decode(Dabang.self, from: jsonData)

import Foundation

// MARK: - DabangElement
struct DabangElement: Codable {
        let pk: Int
        let broker: Broker?
        let type: DabangType
        let dabangDescription: String
        let address: Address
        let lng, lat: Double
        let salesForm: SalesForm
        let floor, totalFloor, areaChar: String
        let supplyAreaInt: Int
        let supplyAreaChar: String
        let shortRent: Bool
        let managementSet: [ManagementSet]
        let parkingDetail: ParkingDetail
        let parkingtf: Bool
        let livingExpenses: String?
        let livingExpensesDetail: LivingExpensesDetail?
        let moveInChar: MoveInChar
        let moveInDate: String?
        let optionSet: [OptionSet]
        let heatingType: HeatingType
        let pet, elevator, builtIn, veranda: Bool
        let depositLoan: Bool
        let totalCitizen: String?
        let totalPark: TotalPark?
        let complete: String?
        let securitySafetySet: [SecuritySafetySet]
        let postimage: [String]

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
            case postimage
        }
    }

    // MARK: - Address
    struct Address: Codable {
        let loadAddress: String
        let detailAddress: JSONNull?
    }

    // MARK: - Broker
    struct Broker: Codable {
        let pk: Int
        let companyName, address: String?
        let managerName, tel: String
        let image: String?
        let companyNumber, brokerage, dabangCreatedAt, successCount: String?

        enum CodingKeys: String, CodingKey {
            case pk, companyName, address, managerName, tel, image, companyNumber, brokerage
            case dabangCreatedAt = "dabangCreated_at"
            case successCount
        }
    }

    enum HeatingType: String, Codable {
        case 개별난방 = "개별난방"
        case 지역난방 = "지역난방"
    }

    enum LivingExpensesDetail: String, Codable {
        case empty = "(-)"
        case 관리비 = "(관리비)"
        case 관리비주차비 = "(관리비 + 주차비)"
        case 월세 = "(월세)"
        case 월세관리비 = "(월세 + 관리비)"
        case 월세관리비주차비 = "(월세 + 관리비 + 주차비)"
        case 월세주차비 = "(월세 + 주차비)"
        case 주차비 = "(주차비)"
    }

    enum ManagementSet: String, Codable {
        case 기타 = "기타"
        case 도시가스 = "도시가스"
        case 수도세 = "수도세"
        case 유선Tv = "유선TV"
        case 인터넷 = "인터넷"
        case 전기세 = "전기세"
        case 청소비 = "청소비"
        case 협의가능 = "협의가능"
    }

    enum MoveInChar: String, Codable {
        case 날짜협의 = "날짜 협의"
        case 즉시입주 = "즉시 입주"
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

    enum ParkingDetail: String, Codable {
        case 가능무료 = "가능(무료)"
        case 문의 = "문의"
        case 불가 = "불가"
    }

    // MARK: - SalesForm
    struct SalesForm: Codable {
        let type: SalesFormType
        let depositChar, monthlyChar: String
        let depositInt, monthlyInt: Int
    }

    enum SalesFormType: String, Codable {
        case 매매 = "매매"
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

    enum TotalPark: String, Codable {
        case empty = "-"
        case the07대 = "0.7대"
        case the08대 = "0.8대"
        case the11대 = "1.1대"
        case the12대 = "1.2대"
        case the13대 = "1.3대"
        case the15대 = "1.5대"
        case the16대 = "1.6대"
        case the17대 = "1.7대"
        case the18대 = "1.8대"
        case the1대 = "1대"
        case the65대 = "6.5대"
    }

    enum DabangType: String, Codable {
        case 쓰리룸 = "쓰리룸"
        case 아파트 = "아파트"
        case 오피스텔 = "오피스텔"
        case 오피스텔주방분리형15룸복층 = "오피스텔(주방 분리형(1.5룸),복층)"
        case 원룸 = "원룸"
        case 원룸복층 = "원룸(복층)"
        case 원룸주방분리형15룸 = "원룸(주방 분리형(1.5룸))"
        case 투룸 = "투룸"
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
    let markedRooms: [DabangElement]?
    let contactedBrokers: [Broker]?
    
    enum CodingKeys: String, CodingKey {
        case pk, phone, profileImage
        case recentlyCheckedRooms = "posts"
        case markedRooms = "postLike"
        case contactedBrokers = "brokers"
    }
}


class UserData {
    static let shared = UserData()
    var user: User!
    private init() {}
    
}
