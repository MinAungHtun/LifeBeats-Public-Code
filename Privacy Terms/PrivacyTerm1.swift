//
//  PrivacyTerm1.swift
//  LifeBeats
//
//  Created by User on 1/28/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct PrivacyTerm1: View {
    var body: some View {
        NavigationView{
        ScrollView(.vertical, showsIndicators: false){
            NavigationLink(destination: TermsOfUse())
                {
                Text("See Terms of Use")
            }
            VStack{
                
        Text("Privacy Policy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            .foregroundColor(Color.gray).padding()
                
                
                Text("Lifebeats built the Lifebeats app as a Freemium app. This SERVICE is provided by Lifebeats at no cost and is intended for use as is.").padding()
                
                Text("This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.").padding()
                

                Text("If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.").padding()
                

                Text("The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Lifebeats unless otherwise defined in this Privacy Policy.").padding()
             
                    Text("Information Collection and Use")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading).padding()
                    Text("For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Email address, Name, HealthKit analytics (in the future), User Patterns. The information that we request will be retained by us and used as described in this privacy policy.")
                        .padding()
                
                Text("The app does use third party services that may collect information used to identify you.\n Privacy policy of third party service providers used by the app.\n Google Play Services, Google Analytics for Firebase, Facebook.").padding()
            }
            
            VStack
            {
                Text("Log Data")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.").padding()
                
                Text("Cookies")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.").padding()
                
                Text("This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.").padding()
            }
            
            VStack
            {
                Text("Service Providers")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("We may employ third-party companies and individuals due to the following reasons: to facilitate our Service, to provide the Service on our behalf, to perform Service-related services; or to assist us in analyzing how our Service is used.").padding()
                
                Text("We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.").padding()
                
                Text("Security")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.").padding()
                
                Text("Links to Other Sites")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.").padding()
            }
            VStack
            {
                Text("Children’s Privacy")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.").padding()
                
                Text("Changes to This Privacy Policy")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.").padding()
                
                Text("Contact Us")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading).padding()
                
                Text("If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at admin@lifebeats.co.").padding()
                
                
            }
        }
        }.environment(\.colorScheme, .dark)
    }
}

struct PrivacyTerm1_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyTerm1()
    }
}
