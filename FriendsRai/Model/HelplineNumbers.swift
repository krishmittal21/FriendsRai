//
//  HelplineNumbers.swift
//  FriendsRai
//
//  Created by Krish Mittal on 09/03/24.
//

import Foundation

struct HelplineNumbers {
    let name: String
    let number: String
}

enum Country: String, CaseIterable {
    case india
    case usa
    case uk
    case canada
    case germany
    case france
    case italy
    case sweden
    case finland
    case norway
    case turkey
    case china
    case japan
    case pakistan
    case bangladesh
    case sriLanka
    
    var countryName: String {
        switch self {
        case .india:
            return " 🇮🇳 India"
        case .usa:
            return " 🇺🇸 USA"
        case .uk:
            return " 🇬🇧 UK"
        case .canada:
            return " 🇨🇦 Canada"
        case .germany:
            return " 🇩🇪 Germany"
        case .france:
            return " 🇫🇷 France"
        case .italy:
            return " 🇮🇹 Italy"
        case .sweden:
            return " 🇸🇪 Sweden"
        case .finland:
            return " 🇫🇮 Finland"
        case .norway:
            return " 🇳🇴 Norway"
        case .turkey:
            return " 🇹🇷 Turkey"
        case .china:
            return " 🇨🇳 China"
        case .japan:
            return " 🇯🇵 Japan"
        case .pakistan:
            return " 🇵🇰 Pakistan"
        case .bangladesh:
            return " 🇧🇩 Bangladesh"
        case .sriLanka:
            return " 🇱🇰 Sri Lanka"
        }
    }

    
    var helplineNumbers: [HelplineNumbers] {
        switch self {
        case .india:
            return indiaHelplineNumbers
        case .usa:
            return usaHelplineNumbers
        case .uk:
            return ukHelplineNumbers
        case .canada:
            return canadaHelplineNumbers
        case .germany:
            return germanyHelplineNumbers
        case .france:
            return franceHelplineNumbers
        case .italy:
            return italyHelplineNumbers
        case .sweden:
            return swedenHelplineNumbers
        case .finland:
            return finlandHelplineNumbers
        case .norway:
            return norwayHelplineNumbers
        case .turkey:
            return turkeyHelplineNumbers
        case .china:
            return chinaHelplineNumbers
        case .japan:
            return japanHelplineNumbers
        case .pakistan:
            return pakistanHelplineNumbers
        case .bangladesh:
            return bangladeshHelplineNumbers
        case .sriLanka:
            return sriLankaHelplineNumbers
        }
    }
}


//India
let indiaHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Police", number: "100"),
    HelplineNumbers(name: "Fire brigade", number: "101"),
    HelplineNumbers(name: "Ambulance", number: "102"),
    HelplineNumbers(name: "Women Helpline", number: "1091"),
    HelplineNumbers(name: "Child Helpline", number: "1098"),
    HelplineNumbers(name: "Senior Citizens Helpline", number: "1090"),
    HelplineNumbers(name: "Disaster Management", number: "1070"),
    HelplineNumbers(name: "Road Accident Emergency Service", number: "1073"),
    HelplineNumbers(name: "Railway Accident Emergency Service", number: "1072"),
    HelplineNumbers(name: "National Emergency Number", number: "112"),
    HelplineNumbers(name: "Anti Poison (New Delhi)", number: "1066"),
    HelplineNumbers(name: "Anti Ragging Helpline", number: "1800-180-5522"),
    HelplineNumbers(name: "Anti Corruption Helpline (Delhi)", number: "1031"),
    HelplineNumbers(name: "AIDS Helpline", number: "1097"),
    HelplineNumbers(name: "Tourist Helpline (Incredible India)", number: "1800-11-1363"),
]


//USA
let usaHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "National Suicide Prevention Lifeline", number: "1-800-273-8255"),
    HelplineNumbers(name: "Domestic Violence Hotline", number: "1-800-799-7233"),
    HelplineNumbers(name: "National Child Abuse Hotline", number: "1-800-422-4453"),
    HelplineNumbers(name: "National Human Trafficking Hotline", number: "1-888-373-7888"),
    HelplineNumbers(name: "National Sexual Assault Hotline", number: "1-800-656-4673"),
    HelplineNumbers(name: "National Poison Control Center", number: "1-800-222-1222"),
    HelplineNumbers(name: "National Eating Disorders Association Helpline", number: "1-800-931-2237"),
    HelplineNumbers(name: "National Runaway Safeline", number: "1-800-786-2929"),
    HelplineNumbers(name: "Veterans Crisis Line", number: "1-800-273-8255 (press 1)"),
    HelplineNumbers(name: "SAMHSA National Helpline", number: "1-800-662-4357"),
    HelplineNumbers(name: "NAMI Helpline", number: "1-800-950-6264"),
    HelplineNumbers(name: "Crisis Text Line", number: "Text HOME to 741741"),
]

//UK
let ukHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "999"),
    HelplineNumbers(name: "Non-emergency Police", number: "101"),
    HelplineNumbers(name: "NHS Non-emergency Medical Advice", number: "111"),
    HelplineNumbers(name: "Samaritans (Emotional Support)", number: "116 123"),
    HelplineNumbers(name: "National Domestic Abuse Helpline", number: "0808 2000 247"),
    HelplineNumbers(name: "Childline (Support for Children)", number: "0800 1111"),
    HelplineNumbers(name: "NSPCC", number: "0808 800 5000"),
    HelplineNumbers(name: "Age UK", number: "0800 169 6565"),
    HelplineNumbers(name: "Mind", number: "0300 123 3393"),
    HelplineNumbers(name: "Alcoholics Anonymous", number: "0800 9177 650"),
    HelplineNumbers(name: "SANE", number: "0300 304 7000"),
    HelplineNumbers(name: "Shelter", number: "0808 800 4444"),
    HelplineNumbers(name: "Victim Support", number: "0808 1689 111"),
    HelplineNumbers(name: "Cruse Bereavement Care", number: "0808 808 1677"),
    HelplineNumbers(name: "National Debtline", number: "0808 808 4000"),
    HelplineNumbers(name: "Samaritans (Welsh Language)", number: "0808 164 0123"),
    HelplineNumbers(name: "Samaritans (Irish Language)", number: "028 9066 4422"),
]

// Canada
let canadaHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "911"),
    HelplineNumbers(name: "Kids Help Phone (Youth Counseling)", number: "1-800-668-6868"),
    HelplineNumbers(name: "Crisis Services Canada", number: "1-833-456-4566"),
    HelplineNumbers(name: "Canadian Anti-Fraud Centre", number: "1-888-495-8501"),
    HelplineNumbers(name: "VictimLinkBC", number: "1-800-563-0808"),
    HelplineNumbers(name: "National Suicide Prevention Lifeline", number: "1-800-273-8255"),
    HelplineNumbers(name: "Health Canada COVID-19 Information", number: "1-833-784-4397"),
]

// Germany
let germanyHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "Helpline for Children and Youth", number: "0800 1110 333"),
    HelplineNumbers(name: "Violence Against Women Helpline", number: "08000 116 016"),
    HelplineNumbers(name: "Poison Control Centre", number: "030 19240"),
    HelplineNumbers(name: "Alcoholics Anonymous", number: "030 3030 3133"),
    HelplineNumbers(name: "Federal Ministry of Health COVID-19 Hotline", number: "030 346 465 100"),
]

// France
let franceHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "SOS Help (English-language Emotional Support)", number: "01 46 21 46 46"),
    HelplineNumbers(name: "SOS Amitié (Emotional Support)", number: "09 72 39 40 50"),
    HelplineNumbers(name: "Violence Against Women Helpline", number: "3919"),
    HelplineNumbers(name: "Alcoholics Anonymous", number: "01 43 25 75 00"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "0800 130 000"),
]

// Italy
let italyHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "Telefono Azzurro", number: "19696"),
    HelplineNumbers(name: "Telefono Rosa", number: "1522"),
    HelplineNumbers(name: "National Institute for the Promotion of Health", number: "800 13 13 13"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "1500"),
]

// Sweden
let swedenHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "SOS Alarm (Non-Emergency Police and Fire)", number: "114 14"),
    HelplineNumbers(name: "BRIS (Support for Children and Adolescents)", number: "116 111"),
    HelplineNumbers(name: "Women's Shelter Helpline", number: "020 50 50 50"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "113 13"),
]

// Finland
let finlandHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "Crisis Helpline", number: "09 2525 0111"),
    HelplineNumbers(name: "Mental Health Helpline", number: "010 195 202"),
    HelplineNumbers(name: "Violence Against Women Helpline", number: "0800 02400"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "0295 535 535"),
]

// Norway
let norwayHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "Mental Health Helpline", number: "116 123"),
    HelplineNumbers(name: "Violence Against Women Helpline", number: "188 88"),
    HelplineNumbers(name: "Alcohol and Drug Helpline", number: "800 30 186"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "815 55 015"),
]

// Turkey
let turkeyHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "Police", number: "155"),
    HelplineNumbers(name: "Gendarmerie", number: "156"),
    HelplineNumbers(name: "Health Support Line", number: "184"),
    HelplineNumbers(name: "Child Support Line", number: "183"),
    HelplineNumbers(name: "Social Support Line", number: "1453"),
    HelplineNumbers(name: "Women Support Line", number: "0553 112 52 52"),
    HelplineNumbers(name: "Mental Health Support Line", number: "0850 460 45 46"),
    HelplineNumbers(name: "Domestic Violence Support Line", number: "0212 656 96 96"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "184"),
]

// China
let chinaHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "110"),
    HelplineNumbers(name: "Police", number: "122"),
    HelplineNumbers(name: "Fire Brigade", number: "119"),
    HelplineNumbers(name: "Medical Emergency", number: "120"),
    HelplineNumbers(name: "Traffic Accident", number: "122"),
    HelplineNumbers(name: "Women and Children Protection Hotline", number: "12338"),
    HelplineNumbers(name: "Anti-Fraud Helpline", number: "96110"),
    HelplineNumbers(name: "Mental Health Hotline", number: "400-161-9995"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "12345"),
]

// Japan
let japanHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "110"),
    HelplineNumbers(name: "Police", number: "112"),
    HelplineNumbers(name: "Fire and Ambulance", number: "119"),
    HelplineNumbers(name: "Tokyo English Lifeline (Emotional Support)", number: "03-5774-0992"),
    HelplineNumbers(name: "Child Abuse Hotline", number: "189"),
    HelplineNumbers(name: "Domestic Violence Hotline", number: "0570-0-70800"),
    HelplineNumbers(name: "Suicide Prevention Hotline", number: "0570-064-556"),
    HelplineNumbers(name: "Japan Helpline (Counseling and Support)", number: "0570-000-911"),
    HelplineNumbers(name: "Foreign Residents Inquiries (Japan Helpline)", number: "0570-000-911"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "0120-565-653"),
]

// Pakistan
let pakistanHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "112"),
    HelplineNumbers(name: "Police", number: "15"),
    HelplineNumbers(name: "Edhi Ambulance Service", number: "115"),
    HelplineNumbers(name: "Rescue 1122", number: "1122"),
    HelplineNumbers(name: "Child Protection and Welfare Bureau", number: "1121"),
    HelplineNumbers(name: "Women's Helpline", number: "1099"),
    HelplineNumbers(name: "Mental Health Helpline", number: "042-35761999"),
    HelplineNumbers(name: "National AIDS Control Program", number: "0800-99000"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "1166"),
]

// Bangladesh
let bangladeshHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "999"),
    HelplineNumbers(name: "Police", number: "999"),
    HelplineNumbers(name: "Fire Service and Civil Defense", number: "999"),
    HelplineNumbers(name: "Ambulance Service", number: "999"),
    HelplineNumbers(name: "Women's Helpline (24 hours)", number: "109"),
    HelplineNumbers(name: "Child Helpline", number: "1098"),
    HelplineNumbers(name: "National Mental Health Helpline", number: "09666777222"),
    HelplineNumbers(name: "Drug Addiction Helpline", number: "01556761313"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "16263"),
]

// Sri Lanka
let sriLankaHelplineNumbers: [HelplineNumbers] = [
    HelplineNumbers(name: "Emergency Services", number: "119"),
    HelplineNumbers(name: "Police Emergency Hotline", number: "118"),
    HelplineNumbers(name: "Ambulance Service", number: "1990"),
    HelplineNumbers(name: "Fire and Rescue Service", number: "111"),
    HelplineNumbers(name: "Women and Child Abuse Hotline", number: "1938"),
    HelplineNumbers(name: "Mental Health Support Hotline", number: "1926"),
    HelplineNumbers(name: "National STD/AIDS Helpline", number: "198"),
    HelplineNumbers(name: "Government COVID-19 Information Hotline", number: "1999"),
]
