//
//  Configuration.swift
//  Pensamentos
//
//  Created by Luana Martinez de La Flor on 17/09/21.
//

import Foundation

enum UserDefaultKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}


class Configuration {
    
    let defaults = UserDefaults.standard // Propiedade que serve para armazenar dados na memoria
    static var shared: Configuration = Configuration() // singleton, usado para acessar a propia classe
    
    var timeInterval: Double{
        get{
            return defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue) // retorna e persiste um double biblioteca userDefaults
        }
        set{
            defaults.set( newValue, forKey: UserDefaultKeys.timeInterval.rawValue)//adiocina a inforacao a persister
        }
    }
    
    var colorScheme: Int{
        get{
            return defaults.integer(forKey: UserDefaultKeys.colorScheme.rawValue) // retorna e persiste um double biblioteca userDefaults
        }
        set{
            defaults.set( newValue, forKey: UserDefaultKeys.colorScheme.rawValue)//adiocina a inforacao a persister
        }
    }
    
    var autoRefresh: Bool{
        get{
            return defaults.bool(forKey: UserDefaultKeys.autorefresh.rawValue) // retorna e persiste um double biblioteca userDefaults
        }
        set{
            defaults.set( newValue, forKey: UserDefaultKeys.autorefresh.rawValue)//adiocina a inforacao a persister
        }
    }
    
    private init () {
        if defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue) == 0 {
            defaults.set( 8.0, forKey: UserDefaultKeys.timeInterval.rawValue)
        }
        
    }
    
    
    
}
