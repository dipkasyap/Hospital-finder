// MARK: - Mocks generated from file: Hospital Finder/Service/ServiceHandller/HospitalListHandling.swift at 2020-06-20 08:59:26 +0000

//
//  IllnessListHandling
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//
import Cuckoo
@testable import Hospital_Finder

import Foundation


 class MockHospitalListHandling: HospitalListHandling, Cuckoo.ProtocolMock {
    
     typealias MocksType = HospitalListHandling
    
     typealias Stubbing = __StubbingProxy_HospitalListHandling
     typealias Verification = __VerificationProxy_HospitalListHandling

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HospitalListHandling?

     func enableDefaultImplementation(_ stub: HospitalListHandling) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getHospitals(_ then: @escaping (_: HospitalListModel?, _: Error?) -> Void)  {
        
    return cuckoo_manager.call("getHospitals(_: @escaping (_: HospitalListModel?, _: Error?) -> Void)",
            parameters: (then),
            escapingParameters: (then),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getHospitals(then))
        
    }
    

	 struct __StubbingProxy_HospitalListHandling: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getHospitals<M1: Cuckoo.Matchable>(_ then: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((_: HospitalListModel?, _: Error?) -> Void)> where M1.MatchedType == (_: HospitalListModel?, _: Error?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((_: HospitalListModel?, _: Error?) -> Void)>] = [wrap(matchable: then) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHospitalListHandling.self, method: "getHospitals(_: @escaping (_: HospitalListModel?, _: Error?) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HospitalListHandling: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getHospitals<M1: Cuckoo.Matchable>(_ then: M1) -> Cuckoo.__DoNotUse<((_: HospitalListModel?, _: Error?) -> Void), Void> where M1.MatchedType == (_: HospitalListModel?, _: Error?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((_: HospitalListModel?, _: Error?) -> Void)>] = [wrap(matchable: then) { $0 }]
	        return cuckoo_manager.verify("getHospitals(_: @escaping (_: HospitalListModel?, _: Error?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HospitalListHandlingStub: HospitalListHandling {
    

    

    
     func getHospitals(_ then: @escaping (_: HospitalListModel?, _: Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Hospital Finder/Service/ServiceHandller/IllnessListHandling.swift at 2020-06-20 08:59:26 +0000

//
//  IllnessListHandling
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//
import Cuckoo
@testable import Hospital_Finder

import Foundation


 class MockIllnessListHandling: IllnessListHandling, Cuckoo.ProtocolMock {
    
     typealias MocksType = IllnessListHandling
    
     typealias Stubbing = __StubbingProxy_IllnessListHandling
     typealias Verification = __VerificationProxy_IllnessListHandling

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: IllnessListHandling?

     func enableDefaultImplementation(_ stub: IllnessListHandling) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getIllnesses(_ completion: @escaping (_: IllnessListModel?, _: Error?) -> Void)  {
        
    return cuckoo_manager.call("getIllnesses(_: @escaping (_: IllnessListModel?, _: Error?) -> Void)",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getIllnesses(completion))
        
    }
    

	 struct __StubbingProxy_IllnessListHandling: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getIllnesses<M1: Cuckoo.Matchable>(_ completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((_: IllnessListModel?, _: Error?) -> Void)> where M1.MatchedType == (_: IllnessListModel?, _: Error?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((_: IllnessListModel?, _: Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockIllnessListHandling.self, method: "getIllnesses(_: @escaping (_: IllnessListModel?, _: Error?) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_IllnessListHandling: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getIllnesses<M1: Cuckoo.Matchable>(_ completion: M1) -> Cuckoo.__DoNotUse<((_: IllnessListModel?, _: Error?) -> Void), Void> where M1.MatchedType == (_: IllnessListModel?, _: Error?) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((_: IllnessListModel?, _: Error?) -> Void)>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("getIllnesses(_: @escaping (_: IllnessListModel?, _: Error?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class IllnessListHandlingStub: IllnessListHandling {
    

    

    
     func getIllnesses(_ completion: @escaping (_: IllnessListModel?, _: Error?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

