#[test_only]
module fungible_tokens::redcoin_tests {

    use fungible_tokens::REDCOIN::{Self, REDCOIN};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let scenario = test_scenario::begin(addr1);
        
        // Run the REDCOIN coin module init function
        {
            REDCOIN::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<REDCOIN>` object
        next_tx(&mut scenario, addr1);
        {
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<REDCOIN>>(&scenario);
            REDCOIN::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<REDCOIN>>(addr1, treasurycap);
        };

        // Burn a `Coin<REDCOIN>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<REDCOIN>>(&scenario);
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<REDCOIN>>(&scenario);
            REDCOIN::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<REDCOIN>>(addr1, treasurycap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }

}