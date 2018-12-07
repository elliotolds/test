
// The solidity compiler allegedly packs structs into 256 bit words using a greedy approach. 
// The Expensive struct can be packed into 4 uint256s, with the boundaries shown by the 
// spaces below. However, creating one of these structs and adding it to a storage array
// costs about 155,000 gas. If the struct contained only 4 uints it would cost 47,000 gas. 
// 
// Why does this difference exist?
//
// The fact that it does incentivizes me to write ugly/complex code to manually pack
// variables into uints. Solidity devs should not have to do this to write performant code :(.

  struct Expensive {
        uint48 partyAResolution;
        uint48 partyBResolution;
        uint48 automaticResolution;
        uint48 resolution;
        uint32 nextArbitrationStepAllowedAfterTimestamp;
        bool partyAStakePaid;
        bool partyBStakePaid;
        bool partyARequestedArbitration;
        bool partyBRequestedArbitration;
        bool partyAWithdrew;
        bool partyBWithdrew;
        bool partyAResolvedLast;
        bool arbitratorWithdrewDisputeFee;
        bool usingArbitrationStandard; 

        uint160 partyAAddress;
        uint48 partyAStakeAmount;
        uint48 partyAInitialArbitratorFee;
        
        uint160 partyBAddress;
        uint48 partyBStakeAmount;
        uint48 partyBInitialArbitratorFee;
        
        address arbitratorAddress;
        uint48 disputeFee;
        uint32 autoResolveAfterTimestamp;
        uint16 daysToRespondToArbitrationRequest;
    }
    
    // This costs only 47,000 gas to add to a storage array. The above struct should cost the same :(.
    struct CheapNamed{
        uint a;
        uint b;
        uint c;
        uint d;
    }
    
