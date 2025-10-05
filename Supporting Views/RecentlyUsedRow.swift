//
//  RecentlyUsedRow.swift
//  LifeBeats
//
//  Created by User on 12/10/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct RecentlyUsedRow: View {
    
    @EnvironmentObject var userData: UserData
    @State var index1: Int = 17
    @State var index2: Int = 14
    @State var index3: Int = 18
    @State var index4: Int = 13
    @State var index5: Int = 11
    
    var body: some View {
        CustomizedCategoryRow( name: "Recently Used", items: [userData.therapies[self.index5], userData.therapies[self.index4], userData.therapies[self.index3], userData.therapies[self.index2], userData.therapies[self.index1]])
        
//        CustomizedCategoryRow( name: "Recently Used", items: [userData.therapies[11], userData.therapies[12], userData.therapies[13], userData.therapies[14], userData.therapies[15]])
            .listRowInsets(EdgeInsets())
        .onAppear(perform: {            
            if let recent1 = UserDefaults.standard.value(forKey: "recent1") as? Int
            {
                self.index1 = recent1
                print(recent1)
            }
            else
            {
                print("nothing at all")
            }
                if let recent2 = UserDefaults.standard.value(forKey: "recent2") as? Int
                {
                    self.index2 = recent2
                    print(recent2)

                }
                else
                {
                    print("nothing at all")
                }
                    if let recent3 = UserDefaults.standard.value(forKey: "recent3") as? Int
                    {
                        self.index3 = recent3
                        print(recent3)

                    }
                    else
                    {
                        print("nothing at all")
                    }
                        if let recent4 = UserDefaults.standard.value(forKey: "recent4") as? Int
                        {
                            self.index4 = recent4
                            print(recent4)

                        }
                        else
                        {
                            print("nothing at all")
                        }
                        if let recent5 = UserDefaults.standard.value(forKey: "recent5") as? Int
                        {
                            self.index5 = recent5
                            print(recent5)

                        }
                        else
                        {
                            print("nothing at all")
                        }
        })
        
    }
}

struct RecentlyUsedRow_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyUsedRow()
    }
}
